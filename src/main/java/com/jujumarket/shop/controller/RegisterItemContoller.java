package com.jujumarket.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class RegisterItemContoller {

	private RegisterItemService service;
	
	@GetMapping("/list")
	public void list(ItemCriteria cri, Model model) {
		log.info("list : " + cri);
		
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new ItemPageDTO(cri, 123));
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}
	
	// 이미지파일인지 확인
//	private boolean checkImgType(File file) {
//		try {
//			String contentType = Files.probeContentType(file.toPath());
//			return contentType.startsWith("image");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	@PostMapping("/register")
	public String register(RegisterItemVO register, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		
		String uploadFolder = "C:\\upload";
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, "idNo");	// 임시로! 로그인 후엔 idNo 변경해주기
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();
		}
		
		// 파일 이름들 저장
		register.setItemImg1(uploadFile[0].getOriginalFilename());
		register.setItemImg2(uploadFile[1].getOriginalFilename());
		register.setItemImg3(uploadFile[2].getOriginalFilename());
		register.setItemImg4(uploadFile[3].getOriginalFilename());
		register.setImgDetail(uploadFile[4].getOriginalFilename());
		
		for(MultipartFile multi : uploadFile) {
			
			String uploadFilename = multi.getOriginalFilename();
			
			// IE has file path
			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);
			
			UUID uuid = UUID.randomUUID();
			uploadFilename = uuid.toString() + "_" + uploadFilename;
			
			try {
				File saveFile = new File(uploadPath, uploadFilename);
				multi.transferTo(saveFile);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
			
		} // end for
		
		service.register(register);
		rttr.addFlashAttribute("result", register.getItemCode());
		
		return "redirect:/shop/list";
	}
	
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
	@GetMapping("/register")
	public void register(Model model) {

//		model.addAttribute("category", service.category());
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("item", service.get(itemCode));
	}
	
	@PostMapping("/modify")
	public String modify(RegisterItemVO register, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		log.info("modify : " + register);
		
		if(service.modify(register)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		 
		return "redirect:/shop/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		log.info("remove....." + itemCode);
		
		if(service.remove(itemCode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/shop/list" + cri.getListLink();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			//log.info(itemCode[i] + "아이템 코드 넘어옴");
			service.remove(itemCode[i]);
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		

//		String[] arrIdx = itemCode.toString().split(",");
//		
//	  	for (int i=0; i<arrIdx.length; i++) {
//	  		log.info(arrIdx[i] + "스플릿 배열");
//	  		service.remove(arrIdx[i]);
//	  	}
	  	
	  	return "redirect:/shop/list";
	}
	
	@PostMapping("/excelDown")
	public void ExcelDown(HttpServletResponse response){
        log.info("@@@@@@@@@@@@@@@ExcelDown START@@@@@@@@@@@@@@@");
        
        service.getExcelDown(response);
        
        log.info("@@@@@@@@@@@@@@@ExcelDown END@@@@@@@@@@@@@@@");
    }
	
	@GetMapping("/disModify")
	public String disModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);
			
			// 진열상태 변경
			if(vo.getDispStat().equals("진열함")) {
				vo.setDispStat("진열안함");
			}else {
				vo.setDispStat("진열함");
			}
			
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}
	
	@GetMapping("/saleModify")
	public String saleModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);

			// 판매상태 변경
			if(vo.getSaleStat().equals("판매중")) {
				vo.setSaleStat("판매중지");
			}else {
				log.info(vo.getItemChr() + "2");
				vo.setSaleStat("판매중");
			}
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}
	
	@GetMapping("/soldModify")
	public String soldModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);
			
			vo.setSaleStat("품절");		
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}

}
