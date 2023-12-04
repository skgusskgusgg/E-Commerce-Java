package org.team.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.team.product.ProductVO;
import org.team.service.SearchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/search/*")
@AllArgsConstructor
public class SearchController {

    private SearchService service;

    @GetMapping("/list")
    public List<Map<String, Object>> search(@RequestParam(name = "keyword", required = false) String keyword) {
        log.info("search: " + keyword);

        if (keyword != null) {
            // 검색 결과를 가져와서 Map 형식으로 변환하여 반환
            List<ProductVO> searchResult = service.getSearch(keyword);
            List<Map<String, Object>> resultAsMapList = new ArrayList<>();

            for (ProductVO product : searchResult) {
                Map<String, Object> productMap = new HashMap<>();
                productMap.put("product_id", product.getProduct_id());
                productMap.put("category_id", product.getCategory_id());
                productMap.put("product_name", product.getProduct_name());
                productMap.put("price", product.getPrice());
                productMap.put("color_id", product.getColor_id());
                productMap.put("size_id", product.getSize_id());
                productMap.put("img", product.getImg());
                productMap.put("quantity", product.getQuantity());
                productMap.put("sell_count", product.getSell_count());

                resultAsMapList.add(productMap);
            }

            return resultAsMapList;
        }

        return Collections.emptyList(); // 검색어가 비어있으면 빈 리스트 반환
    }
    
    
}
