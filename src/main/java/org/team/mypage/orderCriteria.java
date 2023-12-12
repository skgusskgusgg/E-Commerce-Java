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
	private int id;
	
	public orderCriteria(){
		this(1,10,0);
	}
	
	public orderCriteria(int pageNum, int amount, int id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.id = id;
	}
	public int getPageStart() {
    	return (pageNum - 1) * amount;
    }
}
