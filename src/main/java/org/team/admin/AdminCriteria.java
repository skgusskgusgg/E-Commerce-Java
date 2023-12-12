package org.team.admin;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class AdminCriteria {
	private int pageNum;
	private int amount;

	
	public AdminCriteria() {
		this.pageNum = 1;
		this.amount = 10;

	}
	public AdminCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getstartPage() {
		return (pageNum-1)*amount;
	}
}
