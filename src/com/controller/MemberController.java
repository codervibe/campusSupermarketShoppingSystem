package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.joyce.mail.test.MailTest;

import java.util.*;

@Controller
public class MemberController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	ProductDAO productDAO;
	
	
	
	//登录
	@RequestMapping("Login")
	public String Login(HttpServletRequest request){
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		try {
			upass = DigestUtils.md5DigestAsHex(upass.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.print("------------------------------------------"+ upass);
		List<Member> list = memberDAO.selectOne(uname,upass);
		if(list.size()==0) {
			list = memberDAO.selectOne(uname,request.getParameter("upass"));
		}
		if(list.size()==0){
			request.setAttribute("msg", "upasserr");
			return "login";
		}else{
			if(list.get(0).getStatus().equals("在用")){
				request.getSession().setAttribute("sessionmember", list.get(0));
				return "redirect:index.do";	
			}else{
				request.setAttribute("msg", "statuserr");
				return "login";
			}
		}
	}
	
	//注册
	@RequestMapping("Register")
	public String Register(Member member, HttpServletRequest request){
		member.setStatus("在用");
		String upass = member.getUpass();
		try {
			member.setUpass(DigestUtils.md5DigestAsHex(upass.getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		memberDAO.add(member);
		request.setAttribute("msg", "registersuc");
			return "login";
	}
	
	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Member> list = memberDAO.checkUname(uname);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查找用户信息
	@RequestMapping("showMember")
	public String showMember(HttpServletRequest request){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		Member m = memberDAO.findById(member.getId());
		request.setAttribute("member", m);
			return "myinfo";
	}
	
	//修改个人信息
	@RequestMapping("memberinfoEidt")
	public String memberinfoEidt(Member member, HttpServletRequest request){
		String upass = member.getUpass();
		try {
			member.setUpass(DigestUtils.md5DigestAsHex(upass.getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		memberDAO.update(member);
			return "redirect:showMember.do";
	}
	
	//退出
	@RequestMapping("Exit")
	public String Exit(HttpServletRequest request){
		request.getSession().removeAttribute("sessionmember");
		return "redirect:index.do";
	}
	
	
	//后台查询会员列表
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request) {
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
	    map.put("key", key);
		List<Member> list = memberDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/memberlist";
	}
	
	
	//删除会员
	@RequestMapping("admin/memberDelAll")
	public String memberDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			memberDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:memberList.do";
	}
	
	//查找会员等级
	@RequestMapping("/admin/showLev")
	public String showLev( int id, HttpServletRequest request){
		Member m = memberDAO.findById(id);
		request.setAttribute("member", m);
			return "admin/showlev";
	}
	
	//提升等级
	@RequestMapping("/admin/levUpate")
	public String levUpate(Member member, HttpServletRequest request){
		memberDAO.updateLev(member);
		return "redirect:memberList.do";
	}
	
	
	//找回密码
	@RequestMapping("findUpass")
	public String findUpass(Member member, HttpServletRequest request){
		HashMap map = new HashMap();
		map.put("uname", member.getUname());
		map.put("email", member.getEmail());
		List<Member> list = memberDAO.selectAll(map);
		if(list.size()==1){
			MailTest.sendmial("你的MD5密码是:"+list.get(0).getUpass(),member.getEmail().toString());
			request.setAttribute("suc", "suc");
		}else{
			request.setAttribute("suc", "error");
		}
		return "findupass";
	}
	
	//锁定或解锁用户
	@RequestMapping("admin/changeStatus")
	public String changeStatus(HttpServletRequest request){
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		Member member = memberDAO.findById(Integer.parseInt(id));
		if(type.equals("sd")){
			member.setStatus("已禁用");
		}else{
			member.setStatus("在用");
		}
		memberDAO.update(member);
		return "redirect:memberList.do";
	}
	
	
	//帐户充值
	@RequestMapping("chongzhi")
	public String yueMsg(Member member, HttpServletRequest request){
		Member mmm = (Member)memberDAO.findById(member.getId());
		double yue = member.getYue()+mmm.getYue();
		member.setYue(yue);
		memberDAO.update(member);
		return "redirect:yueMsg.do";
	}
	
	
	//查看余额
	@RequestMapping("yueMsg")
	public String yueMsg(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		//余额
		if(member!=null){
		Member mmm = (Member)memberDAO.findById(member.getId());
		request.setAttribute("member", mmm);
		return "yuemsg";
		}else{
		return "login";	
		}
	}
	
	
}
