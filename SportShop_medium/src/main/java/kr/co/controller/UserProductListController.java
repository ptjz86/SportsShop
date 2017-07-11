package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.BoardVO;
import kr.co.domain.PageMaker;
import kr.co.domain.ProductCriteria;
import kr.co.domain.ProductPageMaker;
import kr.co.domain.ProductSearchCriteria;
import kr.co.domain.ProductVO;
import kr.co.domain.SearchCriteria;
import kr.co.service.ProductService;

@Controller
@RequestMapping("/userProductList")
public class UserProductListController {
	
	@Inject
	private ProductService service;
	
	
	@RequestMapping(value="list", method =  RequestMethod.GET)
	public void list(Model model) throws Exception{
		
		List<ProductVO> listAllProduct = service.ListAllProduct();
		
		model.addAttribute("listAllProduct", listAllProduct);  
		
	}
	
	@RequestMapping(value="/listSearchCriteria", method= RequestMethod.GET)
	public void listCriteria(@ModelAttribute("cri") ProductSearchCriteria cri, Model model)throws Exception{
	
		List<ProductVO> list=service.listSearch(cri);
		model.addAttribute("listAllProduct", list);
		
		ProductPageMaker pageMaker = new ProductPageMaker();
		pageMaker.setCri(cri);
	
		int cnt = service.listSearchCount(cri);
		pageMaker.setTotalCount(cnt);
		
		model.addAttribute("pageMaker", pageMaker);

	
	}
	
	
	
	@RequestMapping(value="/productDetail", method= RequestMethod.GET)
	public void productDetail(int pno, @ModelAttribute("cri") ProductSearchCriteria cri, Model model)throws Exception{		
		
		ProductVO vo=service.readProduct(pno);
		
		model.addAttribute("vo", vo);
	
	
	}

	
	
}
