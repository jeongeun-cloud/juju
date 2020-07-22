package com.jujumarket.main.domain;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class PrdReplyPageDTO {

	private int prdReplyCnt;
	private List<PrdReplyVO> list;
}
