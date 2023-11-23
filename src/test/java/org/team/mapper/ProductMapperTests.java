package org.team.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;

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
		mapper.getList().forEach(e-> log.info(e));
	}
	@Test
	public void getSelectListTests() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("2");
		vo.setColor_id("1");
		vo.setSize_id("3");
		Criteria cri = new Criteria(1,2);
		mapper.selectList(vo,cri,"desc").forEach(e->log.info(e));
	}
}
