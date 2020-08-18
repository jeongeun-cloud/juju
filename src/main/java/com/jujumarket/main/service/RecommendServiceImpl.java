package com.jujumarket.main.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.stereotype.Service;

import com.jujumarket.shop.mapper.ShopManageMapper;
import com.jujumarket.shop.service.ShopManageServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RecommendServiceImpl implements RecommendService {

	private ServletContext servletContext;
	
	@Override
	public List<?> getRecommend() throws IOException, TasteException {
		System.out.println("Recommend Service Impl 들어옴");
		
		String uploadFolder = servletContext.getRealPath("/resources/data");
		
		DataModel dataModel = new FileDataModel(new File(uploadFolder, "customerData.csv"));
		UserSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, dataModel);
		UserBasedRecommender recommender = new GenericUserBasedRecommender(dataModel, neighborhood, similarity);
		
		List<RecommendedItem> recommendations = recommender.recommend(2, 3);	// ID가 2번인 사람에게 3개의 아이템을 추천해라	// 결과 : 아이템 12,13,14번 추천
		
//		for (RecommendedItem recommendation : recommendations) {
//			System.out.println("2번 사람에게 추천 결과 [item : s00" + recommendation.getItemID() + ", value : " + recommendation.getValue() + "]");
//		}
		
		return recommendations;
		
	}
	
		

}
