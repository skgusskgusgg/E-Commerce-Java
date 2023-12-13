package org.team.admin;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminPageDTO {
	private int StartPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private AdminCriteria cri;

	public AdminPageDTO(AdminCriteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		
		this.StartPage = (this.endPage - 10)+1;
		int realEnd =(int)Math.ceil((total*1.0)/cri.getAmount());
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.StartPage > 1;
		this.next = this.endPage < realEnd;
		
	}

}
