package com.jujumarket.shop.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
//import message.messageService;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class RegisterItemContoller {

   private ServletContext servletContext;
   private RegisterItemService service;
//   @Autowired
//   private messageService mservice;
   
//   @GetMapping("/")
//   public String index() {
//      
//      return "shop/index";
//   }
   
   @GetMapping("/idCheck")
   public void idCheck() {
      
   }
   
   @GetMapping("/list")
   public void list(ItemCriteria cri, HttpSession session, Model model) {
      log.info("list : " + cri);
      MemberVO member = (MemberVO)session.getAttribute("sessionMember");
      String idNo = member == null ? "" : member.getIdNo();   // 비어있을 때 null Exception 방지
      
      cri.setIdNo(idNo); // 이걸 이용해서 그 사람의 상품만 가져오기
      
      model.addAttribute("list", service.getList(cri));
      //model.addAttribute("pageMaker", new ItemPageDTO(cri, 123));
      int total = service.getTotal(cri);
      
      log.info("total : " + total);
      
      if(cri.getKeyword() != null && cri.getKeyword() != "") {
         int resultTotal = service.getResultTotal(cri);
         model.addAttribute("pageMaker", new ItemPageDTO(cri, resultTotal));
      }else {
         model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
      }
   }
   
   // 이미지파일인지 확인
//   private boolean checkImgType(File file) {
//      try {
//         String contentType = Files.probeContentType(file.toPath());
//         return contentType.startsWith("image");
//      } catch (IOException e) {
//         e.printStackTrace();
//      }
//      return false;
//   }
   
   // 이미지 저장
   public void imgSave(RegisterItemVO register, MultipartFile[] uploadFile, boolean isModify) {

         Boolean flag = true;
         String uploadFolder = servletContext.getRealPath("/resources/upload");
         // 폴더 생성
         File uploadPath = new File(uploadFolder, register.getIdNo());
         log.info("upload path : " + uploadPath);
         
         if(uploadPath.exists() == false) {
            uploadPath.mkdir();      // 각 상점마다 자신의 폴더를 가짐
         }

         int i = 0;
         for(MultipartFile multi : uploadFile) {
            
            String uploadFilename = multi.getOriginalFilename();
            
            if(isModify){
               flag = (!uploadFilename.equals(""));
            }

            if(flag) {
               // IE has file path
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
            
               if(i==0) register.setItemImg1(uploadFilename);
               else if(i==1) register.setItemImg2(uploadFilename);
               else if(i==2) register.setItemImg3(uploadFilename);
               else if(i==3) register.setItemImg4(uploadFilename);
               else if(i==4) {
                  register.setImgDetail(uploadFilename);
                  break;
               }
            } 
            i++;
         } // end for
   }
   
   @PostMapping("/register")
   public String register(RegisterItemVO register, MultipartFile[] uploadFile, RedirectAttributes rttr) {
      
      imgSave(register, uploadFile, false);
      
      service.register(register);
      rttr.addFlashAttribute("result", register.getItemCode());
      
      return "redirect:/shop/list";
   }
   
//   @GetMapping("/register")
//   public void register() {
//      
//   }
   
   @GetMapping("/register")
   public void register(Model model) {

//      model.addAttribute("category", service.category());
      List<CategoryVO> category = null;
      category = service.category();
      model.addAttribute("category", JSONArray.fromObject(category));
   }
   
   @GetMapping({"/get", "/modify"})
   public void get(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model) {
      log.info("/get or modify");
      
      model.addAttribute("getCategory", service.getCategory(itemCode));
      model.addAttribute("item", service.get(itemCode));
   }
   
   @PostMapping("/modify")
   public String modify(RegisterItemVO register, MultipartFile[] uploadFile, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
      log.info("modify : " + register);
      
      imgSave(register, uploadFile, true);
      
      if(service.modify(register)) {
         rttr.addFlashAttribute("result", "success");
      }
      
//      rttr.addAttribute("pageNum", cri.getPageNum());
//      rttr.addAttribute("amount", cri.getAmount());
//      rttr.addAttribute("type", cri.getType());
//      rttr.addAttribute("keyword", cri.getKeyword());
       
      return "redirect:/shop/list" + cri.getListLink();
   }
   
   @PostMapping("/remove")
   public String remove(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
      log.info("remove....." + itemCode);
      
      RegisterItemVO vo = service.get(itemCode);
      
      String filePath = servletContext.getRealPath("/resources/upload");
      filePath = filePath + "/" + vo.getIdNo() + "/";

      File file = null;
      
      for(int i=0; i<5; i++) {
         if(i == 0) file = new File(filePath + vo.getItemImg1());
         else if(i==1) file = new File(filePath + vo.getItemImg2());
         else if(i==2) file = new File(filePath + vo.getItemImg3());
         else if(i==3) file = new File(filePath + vo.getItemImg4());
         else if(i==4) file = new File(filePath + vo.getImgDetail());
         
         if(file.exists()) {
            if(file.delete()) {
               System.out.println("삭제성공");
            }else {
               System.out.println("삭제실패");
            }
         }else {
            System.out.println("파일이 존재하지 않음");
         }
      }
      
      if(service.remove(itemCode)) {
         rttr.addFlashAttribute("result", "success");
      }
      
//      rttr.addAttribute("pageNum", cri.getPageNum());
//      rttr.addAttribute("amount", cri.getAmount());
//      rttr.addAttribute("type", cri.getType());
//      rttr.addAttribute("keyword", cri.getKeyword());
      
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
      rttr.addFlashAttribute("result", "success");
      

//      String[] arrIdx = itemCode.toString().split(",");
//      
//        for (int i=0; i<arrIdx.length; i++) {
//           log.info(arrIdx[i] + "스플릿 배열");
//           service.remove(arrIdx[i]);
//        }
        
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
      rttr.addFlashAttribute("result", "success");
      
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
				vo.setSaleStat("판매중");
			}
			
			service.modify(vo);
		}
		rttr.addFlashAttribute("result", "success");
		return "redirect:/shop/list";
	}
	
	@GetMapping("/soldModify")
	public String soldModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);
			
			vo.setSaleStat("품절");		
			service.modify(vo);
		}
		rttr.addFlashAttribute("result", "success");
		return "redirect:/shop/list";
	}


}