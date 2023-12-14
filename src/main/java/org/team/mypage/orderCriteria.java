package org.team.mypage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class orderCriteria {
	private int pageNum;
	private int amount ;
	
	public orderCriteria(){
		this(1,10);
	}
	
	public orderCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;

	}
	public int getPageStart() {
    	return (pageNum - 1) * amount;
    }
}
