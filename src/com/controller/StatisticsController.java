package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;



import java.util.*;

@Controller
public class StatisticsController extends BaseController {
	@Resource
	ProductDAO productDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	OrdermsgDAO ordermsgDAO;
	
	
	
	
	//销售量统计
	@RequestMapping("admin/saleProduct")
	public  String saleProduct(HttpServletRequest request) {
		User admin = (User)request.getSession().getAttribute("admin");
		String key = request.getParameter("key");
		String key1 = request.getParameter("key1");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("key1", key1);
		List<Product> plist = productDAO.selectProductAll(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
	        List<Ordermsgdetails> ordermsgdetailslist = ordermsgdetailsDAO.selectSale(product.getId());
	        int i =0;
	        nlist.add("'"+product.getProductname()+"'");
	        if(ordermsgdetailslist.size()==0){
	        slist.add(i);	
	        }else{
	        	for(Ordermsgdetails ordermsgdetails:ordermsgdetailslist){
	        		i+=ordermsgdetails.getNum();
	        	}
	        slist.add(i);
	        }
		}
		request.setAttribute("key", key);
		request.setAttribute("key1", key1);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjsaleproduct";
	}
	
	
	
	//点赞统计
	@RequestMapping("admin/voteProduct")
	public  String voteProduct(HttpServletRequest request) {
		User admin = (User)request.getSession().getAttribute("admin");
		HashMap map = new HashMap();
		List<Product> plist = productDAO.selectAll(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
			nlist.add("'"+product.getProductname()+"'");
			slist.add(product.getVote());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjvoteproduct";
	}
	
	
	//销售额
	@RequestMapping("admin/saleMoney")
	public  String saleMoney(HttpServletRequest request) {
		User admin = (User)request.getSession().getAttribute("admin");
		HashMap map = new HashMap();
		List<Ordermsg> olist = ordermsgDAO.selectSaleMoney(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Ordermsg ordermsg:olist){
			nlist.add("'"+ordermsg.getSavetime()+"'");
			slist.add(ordermsg.getTotal());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjsalemoney";
	}
	
	//订单量
	@RequestMapping("admin/orderNum")
	public  String orderNum(HttpServletRequest request) {
		User admin = (User)request.getSession().getAttribute("admin");
		HashMap map = new HashMap();
		if(admin.getUsertype().equals("商家")){
			map.put("saver",admin.getId());
			}
		List<Ordermsg> olist = ordermsgDAO.orderNum(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Ordermsg ordermsg:olist){
			nlist.add("'"+ordermsg.getSavetime()+"'");
			slist.add(ordermsg.getOrderno());
		}
//		System.out.println("nlist==="+nlist);
//		System.out.println("slist==="+slist);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjordernum";
	}
	
	
	

}
