package org.team.domain;

import com.mysql.cj.log.Log;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Getter
@ToString
@Setter
@Log4j
public class PageDTO {
	private Criteria cri;
	private int total;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;    

    public PageDTO(Criteria cri, int total) {
    	this.cri = cri;
    	this.total = total;
    	
        endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
        
        startPage = (endPage - 10) + 1;
        
        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
       
        if(realEnd < this.endPage) {
        	this.endPage = realEnd;
        }
        
        this.prev = startPage > 1;
        this.next = endPage < realEnd;
        
    
    }



}
