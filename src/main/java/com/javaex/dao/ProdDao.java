package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BuyProductVo;
import com.javaex.vo.ColorsizeVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;

@Repository
public class ProdDao {

	@Autowired
	private SqlSession sqlSession;
	
	//상품리스트 조회
	public List<ProductVo> prodSelectList(int sell_no) {
		System.out.println("[Dao]상품조회(리스트)" + sell_no);
		return sqlSession.selectList("prod.prodSelectList", sell_no);
	}
	
	//상품조회
	public ProductVo prodSelectOne(String prod_no) {
		System.out.println("[Dao]상품수정 정보조회" + prod_no);
		return sqlSession.selectOne("prod.prodSelectOne", prod_no);
	}
	
	//사이즈 조회
	public List<ColorsizeVo> colorsizeSelectList(String prod_no){
		System.out.println("[Dao]상품컬러사이즈조회" + prod_no);
		return sqlSession.selectList("prod.colorsizeSelectList", prod_no);
	}
	
	//이미지 조회
	public List<ProdimgVo> imgSelectList(String prod_no){
		System.out.println("[Dao]상품이미지조회" + prod_no);
		return sqlSession.selectList("prod.imgSelectList", prod_no);
		
	}
	
	//상품등록
	public String prodInsert(ProductVo prodvo) {
		System.out.println("[Dao]상품등록" + prodvo);
		sqlSession.insert("prod.insert", prodvo);
		
		return prodvo.getProd_no();
	}
	
	//상품 이미지 등록
	public void ImgInsert(ProdimgVo imgvo) {
		System.out.println("[Dao]이미지등록" + imgvo);
		sqlSession.insert("prod.imgInsert", imgvo);
	}

	//상품 사이즈 등록
	public int colorsizeInsert(ColorsizeVo colorsizevo) {
		System.out.println("[Dao]색상사이즈등록" + colorsizevo);
		int count = sqlSession.insert("prod.imgColorSize", colorsizevo);
		System.out.println(count +"저장");
		return count;
	}
	
	
	//상품 삭제
	public void prodSellStateUpdate(String prod_no) {
		System.out.println("[Dao]상품판매상태변경" + prod_no);
		sqlSession.update("prod.prodSellStateUpdate", prod_no);
	}
	//배송리스트 조회
	public List<ProdBuyForVo> delmanageselectList(int sell_no){
		System.out.println("[Dao]배송리스트 조회" + sell_no);
		
		return sqlSession.selectList("prod.delmanageselectList", sell_no);
	}
	
	//배송정보 가져오기
	public List<ProdBuyForVo> delformselectOne(ProdBuyForVo pvo) {
		System.out.println("[Dao]배송리스트 조회" + pvo);
		
		return sqlSession.selectList("prod.delformselectList", pvo);
	}
	
	//배송상태 수정
	public int delStateUpdate(ProdBuyForVo pbfvo) {
		return sqlSession.update("prod.delStateUpdate", pbfvo);
	}
	
	//택배사 운송장 정보입력(수정)
	public int delinfoUpdate(ProdBuyForVo pbfvo) {
		return sqlSession.update("prod.delinfoUpdate", pbfvo);
	}
	
	
}
