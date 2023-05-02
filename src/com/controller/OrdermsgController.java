package com.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class OrdermsgController extends BaseController {
    @Resource
    OrdermsgDAO ordermsgDAO;
    @Resource
    CartDAO cartDAO;
    @Resource
    MemberDAO memberDAO;
    @Resource
    ProductDAO productDAO;
    @Resource
    OrdermsgdetailsDAO ordermsgdetailsDAO;
    @Resource
    InventoryDAO inventoryDAO;
    @Resource
    CategoryDAO categoryDAO;
    @Resource
    AddressDAO addressDAO;
    @Resource
    UserDAO userDAO;

    private String Orderno;

    //创建订单
    @RequestMapping("creatOrder")
    public String creatOrder(HttpServletRequest request) {
        System.out.println("创建订单");
        //商品类别
        List<Category> ctlist = categoryDAO.selectAll();
        request.setAttribute("ctlist", ctlist);
        String addrid = request.getParameter("addrid") == null ? "" : request.getParameter("addrid");
        String shfs = request.getParameter("shfs");
        if (!addrid.equals("")) {
            Member member = (Member) request.getSession().getAttribute("sessionmember");
            List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
            String orderno = Info.getOrderNo();
            String totalstr = "";
            double total = 0.0;
            for (int i = 0; i < cartlist.size(); i++) {
                //添加订单详情信息
                Ordermsgdetails ordermsgdetails = new Ordermsgdetails();
                ordermsgdetails.setOrderno(orderno);
                ordermsgdetails.setProductid(cartlist.get(i).getProductid());
                ordermsgdetails.setNum(cartlist.get(i).getNum());
                ordermsgdetails.setMemberid(member.getId());
                ordermsgdetailsDAO.add(ordermsgdetails);

                //得到总价
                Member m = memberDAO.findById(cartlist.get(i).getMemberid());
                Product product = productDAO.findById(cartlist.get(i).getProductid());
                cartlist.get(i).setMember(m);
                cartlist.get(i).setProduct(product);
                total += Double.parseDouble(String.valueOf(cartlist.get(i).getNum())) * product.getPrice();

                //删除购物车中的数据
                cartDAO.delCart(cartlist.get(i).getId());
            }
            totalstr = String.format("%.2f", total);
            //添加订单
            Ordermsg ordermsg = new Ordermsg();
            ordermsg.setOrderno(orderno);
            ordermsg.setShfs(shfs);
            ordermsg.setAddrid(Integer.parseInt(addrid));
            ordermsg.setMemberid(member.getId());
            ordermsg.setTotal(totalstr);
            ordermsg.setFkstatus("待付款");
            ordermsg.setDistributorinfo("");
            ordermsgDAO.add(ordermsg);

            //清session
            request.getSession().removeAttribute("cartlist");
            request.getSession().setAttribute("totalstr", "0.0");
            return "ordersuc";
        } else {
            return "redirect:addressMsg.do";
        }

    }

    //前台订单列表
    @RequestMapping("orderList")
    public String orderList(HttpServletRequest request) {
        System.out.println("前台订单列表");

        //商品类别
        String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

        List<Category> ctlist = categoryDAO.selectAll();

        request.setAttribute("ctlist", ctlist);
        Member member = (Member) request.getSession().getAttribute("sessionmember");

        if (member != null) {
        }
        List<Ordermsg> fklist = ordermsgDAO.selectPayment(member.getId());
        for (int a = 0; a < fklist.size(); a++) {
            Member m = memberDAO.findById(fklist.get(a).getMemberid());
            Address address = addressDAO.findbyid(fklist.get(a).getAddrid());
            fklist.get(a).setAddress(address);
            fklist.get(a).setMember(m);
        }
        List<Ordermsg> shlist = ordermsgDAO.selectShouhuo(member.getId());

        for (int b = 0; b < shlist.size(); b++) {
            Member m = memberDAO.findById(shlist.get(b).getMemberid());
            Address address = addressDAO.findbyid(shlist.get(b).getAddrid());
            // 根据订单id 查询 订单对应的配送员 并加入返回的列表中
            Map<String, String> map =new HashMap<>();
            map.put("id",shlist.get(b).getOrderno());
            List<Ordermsg> ordermsg = ordermsgDAO.selectByOrderno(map);
            shlist.get(b).setDistributorinfo(ordermsg.get(0).getDistributorinfo());
            shlist.get(b).setAddress(address);
            shlist.get(b).setMember(m);
        }
        List<Ordermsg> wclist = ordermsgDAO.selectAccomplish(member.getId());
        for (int c = 0; c < wclist.size(); c++) {
            Member m = memberDAO.findById(wclist.get(c).getMemberid());
            Address address = addressDAO.findbyid(wclist.get(c).getAddrid());
            wclist.get(c).setAddress(address);
            wclist.get(c).setMember(m);
        }
        if (msg != null && msg.equals("yue")) {
            request.setAttribute("suc", "余额不足");
        }


        request.setAttribute("fklist", fklist);
        request.setAttribute("shlist", shlist);
        request.setAttribute("wclist", wclist);
        return "orderlist";

    }

    //前台查看订单详情
    @RequestMapping("orderDetails")
    public String orderDetails(String orderno, HttpServletRequest request) {
        System.out.println("前台查看订单详情");
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        if (member != null) {
            List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
            String totalstr = "";
            double total = 0.0;
            for (int i = 0; i < cartlist.size(); i++) {
                Member m = memberDAO.findById(cartlist.get(i).getMemberid());
                Product product = productDAO.findById(cartlist.get(i).getProductid());
                cartlist.get(i).setMember(m);
                cartlist.get(i).setProduct(product);
                total += Double.parseDouble(String.valueOf(cartlist.get(i).getNum())) * product.getPrice();
            }
            totalstr = String.format("%.2f", total);
            request.setAttribute("cartlist", cartlist);
            request.setAttribute("totalstr", totalstr);
        }

        List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(orderno);
        for (int a = 0; a < list.size(); a++) {
            Product product = productDAO.findById(list.get(a).getProductid());
            list.get(a).setProduct(product);
        }
        request.setAttribute("list", list);
        return "orderdetails";

    }

    //订单付款
    @RequestMapping("payOrder")
    public String payOrder(int id, HttpServletRequest request) {
        System.out.println("订单付款");
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        if (member != null) {
            List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
            String totalstr = "";
            double total = 0.0;
            for (int i = 0; i < cartlist.size(); i++) {
                Member m = memberDAO.findById(cartlist.get(i).getMemberid());
                Product product = productDAO.findById(cartlist.get(i).getProductid());
                cartlist.get(i).setMember(m);
                cartlist.get(i).setProduct(product);
                total += Double.parseDouble(String.valueOf(cartlist.get(i).getNum())) * product.getPrice();
            }
            totalstr = String.format("%.2f", total);
            request.setAttribute("cartlist", cartlist);
            request.setAttribute("totalstr", totalstr);
        }

        //订单付款
        Member mmm = (Member) memberDAO.findById(member.getId());
        double yue = mmm.getYue();
        Ordermsg ordermsg = ordermsgDAO.findById(id);
        double doubletotal = Double.parseDouble(ordermsg.getTotal());
        if (yue >= doubletotal) {
            ordermsg.setFkstatus("已付款");
            ordermsg.setShstatus("待发货");
            double yuetotal = yue - doubletotal;
            mmm.setYue(yuetotal);
            memberDAO.update(mmm);
            ordermsgDAO.update(ordermsg);
            return "redirect:orderList.do";
        } else {
            return "redirect:orderpay.do?id=" + id + "&total=" + ordermsg.getTotal() + "&msg=msg";
        }


    }

    //后台查询所有订单
    @RequestMapping("admin/orderList")
    public String adminorderList(HttpServletRequest request) {
        System.out.println("后台查询所有订单");
        String index = request.getParameter("index");
        String msg = request.getParameter("msg");
        String key = request.getParameter("key");
        int pageindex = 1;
        if (index != null) {
            pageindex = Integer.parseInt(index);
        }
        Page<Object> page = PageHelper.startPage(pageindex, 6);
        HashMap map = new HashMap();
        map.put("key", key);
        List<Ordermsg> list = ordermsgDAO.selectAll(map);
        for (int i = 0; i < list.size(); i++) {

            Member m = memberDAO.findById(list.get(i).getMemberid());
            Address address = addressDAO.findbyid(list.get(i).getAddrid());
            list.get(i).setAddress(address);
            list.get(i).setMember(m);
        }
        if (msg != null && msg.equals("msg")) {
            request.setAttribute("msg", "msg");

        }


//        System.out.println("list = " + list);
        //将员工表中是配送员的 列表查出
        List<User> courier = userDAO.selectByUsertype("配送员");
        // 创建一个配送员的员工类
        User deliveryman = new User();
        //创建一个 配送员数量的 随机数 作为下标
        Random r = new Random();
        int number = r.nextInt(courier.size() - 1);
        // 将查出并将随机 选择的 配送员的姓名和手机号 写入 创建的员工类
        deliveryman.setId(courier.get(number).getId());
        deliveryman.setUsername(courier.get(number).getUsername());
        deliveryman.setTel(courier.get(number).getTel());
        System.out.println("Orderno = " + Orderno);
        Map<String, Object> deliverymap = new HashMap();
        deliverymap.put("distributorinfo", "配送员姓名：" + deliveryman.getUsername() + "配送员联系方式：" + deliveryman.getTel());
        deliverymap.put("id", Orderno);
        // 将创建好的配送员类 写入数据库 并将信息返回给前端
        ordermsgDAO.updatedistributorinfo(deliverymap);

        request.setAttribute("list", list);
        request.setAttribute("deliveryman", deliveryman);
        request.setAttribute("key", key);
        request.setAttribute("index", page.getPageNum());
        request.setAttribute("pages", page.getPages());
        request.setAttribute("total", page.getTotal());
        return "admin/orderlist";

    }

    //后台查看订单详情
    @RequestMapping("admin/orderDetails")
    public String orderadminDetails(String orderno, HttpServletRequest request) {
        System.out.println("后台查看订单详情");
        String index = request.getParameter("index");
        String msg = request.getParameter("msg");
        int pageindex = 1;
        if (index != null) {
            pageindex = Integer.parseInt(index);
        }
        Page<Object> page = PageHelper.startPage(pageindex, 6);
        List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(orderno);
        for (int a = 0; a < list.size(); a++) {
            Product product = productDAO.findById(list.get(a).getProductid());
            list.get(a).setProduct(product);
        }

        request.setAttribute("list", list);
        request.setAttribute("index", page.getPageNum());
        request.setAttribute("pages", page.getPages());
        request.setAttribute("total", page.getTotal());
        return "admin/orderdetails";

    }


    //后台删除订单
    @RequestMapping("admin/orderDelAll")
    public void orderDelAll(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("后台删除订单");
        try {
            PrintWriter out = response.getWriter();
            String vals = request.getParameter("vals");
            String[] val = vals.split(",");
            for (int i = 0; i < val.length; i++) {
                Ordermsg ordermsg = ordermsgDAO.findById(Integer.parseInt(val[i]));
                List<Ordermsgdetails> detailslist = ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
                for (Ordermsgdetails ordermsgdetails : detailslist) {
                    ordermsgdetailsDAO.delete(ordermsgdetails.getId());
                }
                ordermsgDAO.delete(Integer.parseInt(val[i]));
            }
            out.println("0");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

    //发货
    @RequestMapping("admin/faHuo")
    public String faHuo(int id, HttpServletRequest request) {

        String company = request.getParameter("company");
        String waybillno = request.getParameter("waybillno");
        Ordermsg ordermsg = ordermsgDAO.findById(id);
//		System.out.println("ordermsg = " + ordermsg);
        List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
//		for (Ordermsgdetails ordermsgdetails : list) {
//			System.out.println("ordermsgdetails = " + ordermsgdetails);
//		}
        boolean flag = true;
        for (Ordermsgdetails ordermsgdetails : list) {
            int inventoryrecord = Info.getInventory(ordermsgdetails.getProductid());
            if (inventoryrecord < ordermsgdetails.getNum()) {
                flag = false;
                break;
            }
        }
        if (flag == true) {
            for (Ordermsgdetails omd : list) {
                Inventory inv = new Inventory();
                inv.setNum(omd.getNum());
                inv.setType("out");
                inv.setProductid(String.valueOf(omd.getProductid()));
                inventoryDAO.add(inv);
            }
            ordermsg.setCompany(company);
            ordermsg.setWaybillno(waybillno);
            ordermsg.setShstatus("运送中");
            ordermsgDAO.update(ordermsg);
            System.out.println("ordermsg.getOrderno() = " + ordermsg.getOrderno());
            Orderno = ordermsg.getOrderno();
            return "redirect:orderList.do";
        } else {
            return "redirect:orderList.do?msg=msg";
        }


    }

    //收货
    @RequestMapping("orderShouhuo")
    public String orderShouhuo(int id, HttpServletRequest request) {
        Ordermsg ordermsg = ordermsgDAO.findById(id);
        ordermsg.setShstatus("已收货");
        ordermsg.setShsavetime(Info.getDateStr());
        ordermsgDAO.update(ordermsg);
        return "redirect:orderList.do";
    }

    //跳转付款页面
    @RequestMapping("orderpay")
    public String orderpay(HttpServletRequest request) {
        String id = request.getParameter("id");
        String total = request.getParameter("total");
        String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
        if (msg.equals("msg")) {
            request.setAttribute("suc", "余额不足");
        }

        //商品类别
        List<Category> ctlist = categoryDAO.selectAll();
        request.setAttribute("ctlist", ctlist);
        request.setAttribute("total", total);
        request.setAttribute("id", id);
        return "orderpay";
    }

    //货到付款
    @RequestMapping("orderhdfk")
    public String orderhdfk(int id, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        if (member != null) {
            List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
            String totalstr = "";
            double total = 0.0;
            for (int i = 0; i < cartlist.size(); i++) {
                Member m = memberDAO.findById(cartlist.get(i).getMemberid());
                Product product = productDAO.findById(cartlist.get(i).getProductid());
                cartlist.get(i).setMember(m);
                cartlist.get(i).setProduct(product);
                total += Double.parseDouble(String.valueOf(cartlist.get(i).getNum())) * product.getPrice();
            }
            totalstr = String.format("%.2f", total);
            request.setAttribute("cartlist", cartlist);
            request.setAttribute("totalstr", totalstr);
        }

        //订单付款
        Member mmm = (Member) memberDAO.findById(member.getId());
        double yue = mmm.getYue();
        Ordermsg ordermsg = ordermsgDAO.findById(id);
        double doubletotal = Double.parseDouble(ordermsg.getTotal()) + 5;
        if (yue >= doubletotal) {
            ordermsg.setFkstatus("已付款");
            ordermsg.setShstatus("已收货");
            ordermsg.setShsavetime(Info.getDateStr());
            double yuetotal = yue - doubletotal;
            mmm.setYue(yuetotal);
            memberDAO.update(mmm);
            ordermsgDAO.update(ordermsg);
            return "redirect:orderList.do";
        } else {
            return "redirect:orderList.do?msg=yue";
        }


    }

}
