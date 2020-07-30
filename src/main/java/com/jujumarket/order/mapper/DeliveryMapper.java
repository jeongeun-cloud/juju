
package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.DeliveryVO;
import com.jujumarket.order.domain.OrderRequestVO;

public interface DeliveryMapper {
	
	public void insertSelectKey(DeliveryVO delivery);

	public List<DeliveryVO> readByOrderCode(String orderCode);

}
