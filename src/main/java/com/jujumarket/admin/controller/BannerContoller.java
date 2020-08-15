package com.jujumarket.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.domain.ColumnVO;
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class BannerContoller {

	private ServletContext servletContext;
	private BannerService service;

	// 배너 관리 겟 매핑
	@GetMapping("/eventBanner")
	public void eventBanner(Model model) {
		log.info("eventBanner........");
		
		String bannerType = "event";
		model.addAttribute("event", service.getBanner(bannerType));
	}
	
	@GetMapping("/advertise")
	public void advertise(Model model) {
		log.info("advertise........");
		
		String bannerType = "advertise";
		model.addAttribute("advertise", service.getBanner(bannerType));
	}
	
	@GetMapping("/mainBanner")
	public void mainBanner(Model model) {
		log.info("mainBanner........");
		
		String bannerType = "main";
		model.addAttribute("main", service.getBanner(bannerType));
	}
	
	@GetMapping("/seasonalMagazine")
	public void seasonalMagazine(ItemCriteria cri, Model model) {
		log.info("eventBanner........");
		
		int total = service.getItemTotal(cri);
		
		List<ColumnVO> list = service.getColumn();
		for(int i=0; i<list.size(); i++) {
			ColumnVO column = list.get(i);
			
			column.setColumn1(column.getColumn1().replace("\r\n", "<br>"));
			column.setColumn2(column.getColumn2().replace("\r\n", "<br>"));
		}
		
		model.addAttribute("column", list);
		
		model.addAttribute("seasonItemResult", service.getSeason());
		model.addAttribute("seasonal", service.getBanner("seasonal"));
		model.addAttribute("list", service.getItemList(cri));
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}
	
	// 파일 업로드 중복코드 메서드
	public List<BannerVO> imgSave(MultipartFile[] uploadFile, String bannerType, String idNo) {
		
		List<BannerVO> list = new ArrayList<>();
		String uploadFolder = servletContext.getRealPath("/resources/banner");
		
		System.out.println("업로드 경로 " + uploadFolder);
		
		String uploadFolderPath = File.separator + bannerType;
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multi : uploadFile) {
			BannerVO vo = new BannerVO();
			
			String uploadFileName = multi.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			vo.setImgName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multi.transferTo(saveFile);
				
				vo.setUuid(uuid.toString());
				vo.setImgPath(uploadFolderPath);
				vo.setBannerType(bannerType);
				
				vo.setIdNo(idNo);
				service.register(vo);
				
				list.add(vo);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return list;
	}
	
	// 이벤트 배너
	@PostMapping(value = "/eventBanner", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> uploadBanner(MultipartFile[] uploadFile, String idNo) {
		
		List<BannerVO> list = imgSave(uploadFile, "event", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 중간 광고  
	@PostMapping(value = "/advertise", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> advertise(MultipartFile[] uploadFile, String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "advertise", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 메인 슬라이드 배너
	@PostMapping(value = "/mainBanner", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> mainBanner(MultipartFile[] uploadFile, String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "main", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 제철 페이지
	@PostMapping(value = "/seasonalMagazine", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> seasonalMagazine(MultipartFile[] uploadFile , String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "seasonal", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 올린 후 보이기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String imgName) {
		File file = new File(servletContext.getRealPath("/resources/banner/") + imgName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 파일 삭제 중복코드 메서드
	public boolean removeImg(String fileName) {
		File file;
		String filePath = servletContext.getRealPath("/resources/banner");
		
		try {
			file = new File(filePath + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// 올린 후 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, String bannerType, String imgNo) {
		log.info("deleteFile : " + fileName);
		
		boolean deleteFile = removeImg(fileName);
		
		if(!deleteFile) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		service.remove(imgNo);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	// 이미 올라간 배너 삭제
	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> remove(String imgNo) {
		
		BannerVO vo = new BannerVO();
		vo = service.get(imgNo);
		
		String fileName = vo.getImgPath() + "/" + vo.getUuid() + "_" + vo.getImgName();
		
		boolean deleteFile = removeImg(fileName);
		
		if(!deleteFile) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		service.remove(imgNo);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@PostMapping("/regSeason")
	@ResponseBody
	public ResponseEntity<String> regSeason(String[] itemCode) {
		
		for(int i=0; i<itemCode.length; i++) {
			ListItemVO vo = service.getItem(itemCode[i]);
	
			service.regSeason(vo);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/deleSeason")
	@ResponseBody
	public ResponseEntity<String> deleSeason(String[] itemCode) {
		
		for(int i=0; i<itemCode.length; i++) {
			System.out.println(itemCode[i]);
			
			service.deleSeason(itemCode[i]);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	// 제철 칼럼 등록
	@PostMapping("/addColumn")
	public String addColumn(ColumnVO vo, MultipartFile[] addImg, RedirectAttributes rttr) {
		
		String uploadFolder = servletContext.getRealPath("/resources/banner");
		
		String uploadFolderPath = File.separator + "column";
		
		System.out.println("add Coulumn 저장 경로 >>> " + uploadFolder);
	    // 폴더 생성
	    File uploadPath = new File(uploadFolder, uploadFolderPath);
	    log.info("upload path : " + uploadPath);
	      
	    if(uploadPath.exists() == false) {
	       uploadPath.mkdir();      // 각 상점마다 자신의 폴더를 가짐
	    }
	    
	    Boolean flag = true;
	    
	    int i = 0;
	    for(MultipartFile multi : addImg) {
	         
	    	String uploadFilename = multi.getOriginalFilename();
	    	
	    	System.out.println(uploadFilename);

	    	if(vo.getType().equals("modify")) {
	    		flag = (!uploadFilename.equals(""));
	    	}
	        
	    	if(flag) {
	    		uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);
	    		
	    		UUID uuid = UUID.randomUUID();
	    		uploadFilename = uuid.toString() + "_" + uploadFilename;
	    		
	    		try {
	    			// 이미지 파일 path에 올리기
	    			File saveFile = new File(uploadPath, uploadFilename);
	    			multi.transferTo(saveFile);
	    			
	    		} catch (Exception e) {
	    			log.error(e.getMessage());
	    		} // end catch
	    		
	    		if(i==0) vo.setImg1(uploadFilename);
	    		else if(i==1) {
	    			vo.setImg2(uploadFilename); 
	    			break;
	    		}
	    	}
	    	i++;
	    } // end for
		
		if(vo.getType().equals("register")) {
			service.addColumn(vo);
		}else if(vo.getType().equals("modify")) {
			
			List<ColumnVO> list = service.getColumn();
			ColumnVO col = list.get(0);
			
			if(vo.getImg1() == null) {
				vo.setImg1(col.getImg1());
			}
			if(vo.getImg2() == null) {
				vo.setImg2(col.getImg2());
			}
			
			service.modifyColumn(vo);
		}
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/admin/seasonalMagazine";
	}
	
}