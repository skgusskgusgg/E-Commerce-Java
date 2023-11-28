package org.team.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void getListTests() {
		Criteria cri = new Criteria(1,2,"");
		mapper.getList(cri).forEach(e-> log.info(e));
	}
	@Test
	public void getSelectListTests() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("1");
		vo.setColor_id("1");
		vo.setSize_id("3");
		
		Criteria cri = new Criteria(1,2,"");
		mapper.selectList(vo,cri,"desc",50000,150000).forEach(e->log.info(e));
	}
	
	@Test 
	public void getTotal() {
		 log.info(mapper.getTotal()); 
	}
	@Test 
	public void selectTotal() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("1");
		vo.setColor_id("1");
		vo.setSize_id("3");
		
		Criteria cri = new Criteria(1,2,"");
		 log.info(mapper.selectTotal(vo,cri,"desc",50000,150000)); 
	}
	@Test
	public void postWish() {
		ProductVO pVo = new ProductVO();
		MemberDTO mDto = new MemberDTO();
		
		pVo.setProduct_name("Aviator Bomber");
		
		mDto.setId(2);
		
		mapper.postWish(pVo, mDto);
	}
	
	@Test
	public void deleteWish() {
		ProductVO pVo = new ProductVO();
		MemberDTO mDto = new MemberDTO();
		
		pVo.setProduct_id(25);
		mDto.setId(2);
		
		mapper.deleteWish(pVo, mDto);
	}
	
}
