//package com.jujumarket.shop.service;
//
//import java.io.File;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.List;
//import java.util.stream.Collectors;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.jujumarket.shop.domain.RegisterItemVO;
//import com.jujumarket.shop.mapper.RegisterItemMapper;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@Log4j
//@Component
//public class ItemFileCheckTask {
//	
//	@Setter(onMethod_= { @Autowired})
//	private RegisterItemMapper mapper;
//	
//	private String getFolderYesterDay() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//		
//		Calendar cal = Calendar.getInstance();
//		cal.add(Calendar.DATE, -1);
//		
//		String str = sdf.format(cal.getTime());
//		
//		return str.replace("-", File.separator);
//	}
//
//	@Scheduled(cron="0 0 2 * * *")
//	public void checkFiles() throws Exception {
//		log.warn("File Check Task run..........");
//		log.warn(new Date());
//		
//		List<RegisterItemVO> fileList = mapper.getOldFiles();
//		
//		List<Path> fileListPaths = fileList.stream().map(vo-> Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload", vo.getIdNo(),
//				vo.getItemImg1())).collect(Collectors.toList());
//		
//		fileList.stream().map(vo-> Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload", vo.getIdNo(),
//				vo.getItemImg2())).forEach(p -> fileListPaths.add(p));
//		fileList.stream().map(vo-> Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload", vo.getIdNo(),
//				vo.getItemImg3())).forEach(p -> fileListPaths.add(p));
//		fileList.stream().map(vo-> Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload", vo.getIdNo(),
//				vo.getItemImg4())).forEach(p -> fileListPaths.add(p));
//		fileList.stream().map(vo-> Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload", vo.getIdNo(),
//				vo.getImgDetail())).forEach(p -> fileListPaths.add(p));
//		
//		log.warn("=============================");
//		
//		fileListPaths.forEach(p-> log.warn(p));
//		
//		File targetDir = Paths.get("C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload\\idNo\\").toFile();
//		
//		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
//		
//		log.warn("-----------------------------");
//		for(File file : removeFiles) {
//			log.warn(file.getAbsolutePath() + "지우기");
//			file.delete();
//		}
//	}
//}
