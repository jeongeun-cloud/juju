package com.jujumarket.main.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jujumarket.admin.service.BannerService;
import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.service.MainIndexService;
import com.jujumarket.main.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//import message.messageService;

import net.sf.json.JSONArray;


/**
 * Handles requests for the application home page.
 */
@Log4j
@RequestMapping("/")
@Controller
@AllArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private MainIndexService mainservice;
	private ReviewService reviewService;


	@Autowired

//	private messageService mservice;

	private BannerService bannerService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome JUJUMARKET, 환영합니다 주주마켓. ", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("RealNew", mainservice.RealNew());
		

		model.addAttribute("mainReview", reviewService.mainReview());			// 메인 리뷰
		model.addAttribute("advertise", bannerService.getBanner("advertise"));	// 중간 광고
		model.addAttribute("mainImg", bannerService.getBanner("main"));			// 메인 슬라이더
		
		//mservice.sendAlarm();

		
		return "/main/index";
	}

	
}
