package org.team.mapper;

import static org.hamcrest.CoreMatchers.instanceOf;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.domain.AddProducts;
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
		Criteria cri = new Criteria(1, 8, "");
		ProductVO vo = new ProductVO();
		vo.setSize_id("1");
		vo.setColor_id("1");
		mapper.getList(vo, cri, "asc", 50000, 300000).forEach(e -> log.info(e));
	}

	@Test
	public void getSelectListTests() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("1");
		vo.setColor_id("99");
		vo.setSize_id("99");

		Criteria cri = new Criteria(1, 10, "");
		mapper.selectList(vo, cri, "asc", 200000, 350000).forEach(e -> log.info(e));
	}

	@Test
	public void getTotal() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("2");
		vo.setColor_id("1");
		vo.setSize_id("1");
		Criteria cri = new Criteria(1, 10, "");
		log.info(mapper.getTotal(vo, cri, "desc", 50000, 150000));
	}

	@Test
	public void selectTotal() {
		ProductVO vo = new ProductVO();
		vo.setCategory_id("1");
		vo.setColor_id("1");
		vo.setSize_id("1");

		Criteria cri = new Criteria(1, 10, "");
		log.info(mapper.selectTotal(vo, cri, "desc", 50000, 150000));
	}

	@Test
	public void postWish() {
		AddProducts pVo = new AddProducts();
		pVo.getProduct().setColor_id("red");
		pVo.getProduct().setSize_id("L");
		pVo.getProduct().setProduct_name("Aviator Bomber");
		pVo.setCount(2);

		ProductVO product = new ProductVO();
		product.setProduct_name(pVo.getProduct().getProduct_name());
		product.setSize_id(pVo.getProduct().getSize_id());
		product.setColor_id(pVo.getProduct().getColor_id());

		int mvo = 3;
		int count = pVo.getCount();

		int check = mapper.checkWishProduct(product, mvo);
		log.info("??????????????????????????????????" + product);
		if (check > 0) {
			mapper.updateWish(product, count, mvo);

		} else {
			mapper.postWish(pVo, mvo);
		}

	}

	@Test
	public void deleteWish() {
		ProductVO pVo = new ProductVO();

		pVo.setProduct_id(25);

		mapper.deleteWish(pVo, 2);
	}

	@Test
	public void postCart() {
		AddProducts pVo = new AddProducts();
		pVo.getProduct().setColor_id("red");
		pVo.getProduct().setSize_id("L");
		pVo.getProduct().setProduct_name("Elegance Trench");

		mapper.postCart(pVo, 2);
	}

	@Test
	public void sizeTotal() {
		ProductVO pVo = new ProductVO();
		pVo.setProduct_name("Green T");

		log.info(mapper.sizeTotal(pVo));
	}

	@Test
	public void colorTotal() {
		ProductVO pVo = new ProductVO();
		pVo.setProduct_name("Elegance Trench");

		log.info(mapper.colorTotal(pVo));
	}

	@Test
	public void bestProducts() {
		mapper.bestProducts().forEach(i -> log.info(i));

	}

}
