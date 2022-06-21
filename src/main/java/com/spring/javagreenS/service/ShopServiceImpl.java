package com.spring.javagreenS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {
 @Autowired
 ShopDAO shopDAO;
}
