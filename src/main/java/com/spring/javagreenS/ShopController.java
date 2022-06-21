package com.spring.javagreenS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javagreenS.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "input/goodsMenu", method = RequestMethod.GET) 
	public String goodsMenuGet() {
		return "shop/input/goodsMenu";
	}
	@RequestMapping(value = "input/productMenu", method = RequestMethod.GET)
	public String productMenuGet() {
		return "shop/input/productMenu";
	}
}
