package edu.osu.cse5234.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.model.*;


/** Purchases Controller
 */
@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Order order = new Order();
		String[] itemNames = {"Mushrooms", "Coffee", "Microsoft", "Orange Juice", "KitKat"};
		String[] itemPrices = {"3.50", "2.75", "10000.50", "4.00", "1.99"};
		List<Item> items = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			Item item = new Item();
			item.setName(itemNames[i]);
			item.setPrice(itemPrices[i]);
			items.add(item);
		}
		order.setItems(items);
		request.setAttribute("order", order);
		return "purchase/OrderEntryForm";
	}


	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);
		return "redirect:/purchase/paymentEntry";
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("paymentInfo", new PaymentInfo());	
		return "purchase/PaymentEntryForm";
	}
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("paymentInfo") PaymentInfo paymentInfo, HttpServletRequest request) {
		request.getSession().setAttribute("paymentInfo", paymentInfo);	
		return "redirect:/purchase/shippingEntry";
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("shippingInfo", new ShippingInfo());
		return "purchase/ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shippingInfo") ShippingInfo shippingInfo, HttpServletRequest request) {
		request.getSession().setAttribute("shippingInfo", new ShippingInfo());	
		return "redirect:/purchase/viewOrder";
	}
	
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrderPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("order", request.getSession().getAttribute("order"));
		return "purchase/ViewOrder";
	}
	
	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);	
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmationPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("order", request.getSession().getAttribute("order"));
		return "purchase/Confirmation";
	}



}