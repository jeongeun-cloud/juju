package com.jujumarket.shop.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.mapper.BannerMapper;
import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.mapper.RegisterItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RegisterItemServiceImpl implements RegisterItemService {
	
	@Setter(onMethod_ = @Autowired)
	private RegisterItemMapper mapper;
	private BannerMapper bannerMapper;

	@Override
	public void register(RegisterItemVO register) {
		log.info("register......" + register);
		
		mapper.insertSelectKey(register);
	}

//	@Override
//	public List<RegisterItemVO> getList() {
//		log.info("getList.....");
//		return mapper.getList();
//	}

	@Override
	public List<RegisterItemVO> getList(ItemCriteria cri) {
		log.info("getList with Cri..... : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public RegisterItemVO get(String itemCode) {
		log.info("get......" + itemCode);
		return mapper.read(itemCode);
	}

	@Override
	public boolean modify(RegisterItemVO register) {
		log.info("modify........" + register);
		
		List<ListItemVO> list = bannerMapper.getSeason();
		for(int i=0; i<list.size(); i++) {
			ListItemVO vo = list.get(i);
			if(vo.getItemCode().equals(register.getItemCode())) {
				mapper.updateSeason(register);
			}
		}
		
		return mapper.update(register) == 1;
	}

	@Override
	public boolean remove(String itemCode) {
		log.info("remove......" + itemCode);
		return mapper.delete(itemCode) == 1;
	}

	@Override
	public List<CategoryVO> category() {
		log.info("카테고리 체크....");
		return mapper.category();
	}
	
	@Override
	public int getTotal(ItemCriteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public void getExcelDown(HttpServletResponse response) {
		List<?> list = mapper.getList();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        
        try{
            //Excel Down 시작
            Workbook workbook = new XSSFWorkbook();
            //시트생성
            Sheet sheet = workbook.createSheet("상품 리스트");
            
            //행, 열, 열번호
            Row row = null;
            Cell cell = null;
            int rowNo = 0;

            // 헤더 생성
            row = sheet.createRow(rowNo++);
    
            cell = row.createCell(0);
            cell.setCellValue("상품코드");
            cell = row.createCell(1);
            cell.setCellValue("상품명");
            cell = row.createCell(2);
            cell.setCellValue("판매가");
            cell = row.createCell(3);
            cell.setCellValue("정상가");
            cell = row.createCell(4);
            cell.setCellValue("재고");
            cell = row.createCell(5);
            cell.setCellValue("진열상태");
            cell = row.createCell(6);
            cell.setCellValue("판매상태");
            cell = row.createCell(7);
            cell.setCellValue("상품 특성");
            cell = row.createCell(8);
            cell.setCellValue("등록일");
            cell = row.createCell(9);
            cell.setCellValue("수정일");
    
            // 데이터 부분 생성
            for(Object obj : list) {
                RegisterItemVO vo = (RegisterItemVO) obj;
                
                row = sheet.createRow(rowNo++);
                
                cell = row.createCell(0);
                cell.setCellValue(vo.getItemCode());
                cell = row.createCell(1);
                cell.setCellValue(vo.getItemName());
                cell = row.createCell(2);
                cell.setCellValue(vo.getPrice());
                cell = row.createCell(3);
                cell.setCellValue(vo.getNormPrice());
                cell = row.createCell(4);
                cell.setCellValue(vo.getStock());
                cell = row.createCell(5);
                cell.setCellValue(vo.getDispStat());
                cell = row.createCell(6);
                cell.setCellValue(vo.getSaleStat());
                cell = row.createCell(7);
                cell.setCellValue(vo.getItemChr());
                cell = row.createCell(8);
                cell.setCellValue(format.format(vo.getRegDate()));
                cell = row.createCell(9);
                cell.setCellValue(format.format(vo.getUpdateDate()));
            }
            
            // 컨텐츠 타입과 파일명 지정
            response.setContentType("ms-vnd/excel");
//            response.setHeader("Content-Disposition", "attachment;filename=ProductList.xls");	// 옛날 버전 excel2003?이전
            response.setHeader("Content-Disposition", "attachment;filename=ProductList.xlsx");	// excel2007이후 버전
 
            // 엑셀 출력
            workbook.write(response.getOutputStream());
//            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

	}

	@Override
	public String getCategory(String itemCode) {
		
		return mapper.getCategory(itemCode);
	}

	@Override
	public int getResultTotal(ItemCriteria cri) {
		log.info("get total Reault");
		
		return mapper.getResultTotal(cri);
	}

}