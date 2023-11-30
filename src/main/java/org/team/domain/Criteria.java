package org.team.domain;

import lombok.Data;


@Data
public class Criteria {
    private int pageNum; // 현재 페이지 번호
    private int amount;  // 한 페이지당 보여줄 게시물 수
    private String keyword;
	/*
	 * public Criteria() { this(1, 10); // 기본적으로 1페이지, 10개의 게시물을 보여줍니다. }
	 */
    public Criteria() {
        this.pageNum = 1;
        this.amount = 10;
        this.keyword = "";
    }
    
    public Criteria(int pageNum, int amount, String keyword) {
    	this.pageNum = pageNum;
    	this.amount = amount;
    	this.keyword = keyword;
    }
    
    public int getPageStart() {
    	return (pageNum - 1) * amount;
    }

}