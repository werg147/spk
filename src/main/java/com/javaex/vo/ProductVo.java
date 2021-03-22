package com.javaex.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductVo {

	private String prod_no;
	private int sell_no;
	private String prod_cate;
	private String event_cate;
	private String prod_name;
	private int prod_price;
	private String prod_brand;
	private String prod_desc;
	private String prod_from;
	private String prod_wash;
	private String prod_qual;
	private String prod_detail;
	private String prod_detail_img_name;
	private String prod_detail_img_savename;
	private String prod_date;
	
	private String prod_img_name;
	private String prod_img_savename;
	
	
	private List<ProductVo> storeList;
	
	private List<ProdimgVo> pimgList;

	private List<ColorsizeVo> cssList;

	private MultipartFile mainfile;

	private MultipartFile[] subfile;

	private MultipartFile detailfile;

	public ProductVo() {
	}

	public ProductVo(String prod_no, int sell_no, String prod_cate, String event_cate, String prod_name, int prod_price,
			String prod_brand, String prod_desc, String prod_from, String prod_wash, String prod_qual,
			String prod_detail, String prod_detail_img_name, String prod_detail_img_savename, String prod_date,
			List<ColorsizeVo> cssList, MultipartFile mainfile, MultipartFile[] subfile, MultipartFile detailfile) {
		this.prod_no = prod_no;
		this.sell_no = sell_no;
		this.prod_cate = prod_cate;
		this.event_cate = event_cate;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_brand = prod_brand;
		this.prod_desc = prod_desc;
		this.prod_from = prod_from;
		this.prod_wash = prod_wash;
		this.prod_qual = prod_qual;
		this.prod_detail = prod_detail;
		this.prod_detail_img_name = prod_detail_img_name;
		this.prod_detail_img_savename = prod_detail_img_savename;
		this.prod_date = prod_date;
		this.cssList = cssList;
		this.mainfile = mainfile;
		this.subfile = subfile;
		this.detailfile = detailfile;
	}

	public ProductVo(List<ProductVo> storeList, List<ProdimgVo> pimgList) {
		super();
		this.storeList = storeList;
		this.pimgList = pimgList;
	}
	
	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int user_no) {
		this.sell_no = user_no;
	}

	public String getProd_cate() {
		return prod_cate;
	}

	public void setProd_cate(String prod_cate) {
		this.prod_cate = prod_cate;
	}

	public String getEvent_cate() {
		return event_cate;
	}

	public void setEvent_cate(String event_cate) {
		this.event_cate = event_cate;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public String getProd_brand() {
		return prod_brand;
	}

	public void setProd_brand(String prod_brand) {
		this.prod_brand = prod_brand;
	}

	public String getProd_desc() {
		return prod_desc;
	}

	public void setProd_desc(String prod_desc) {
		this.prod_desc = prod_desc;
	}

	public String getProd_from() {
		return prod_from;
	}

	public void setProd_from(String prod_from) {
		this.prod_from = prod_from;
	}

	public String getProd_wash() {
		return prod_wash;
	}

	public void setProd_wash(String prod_wash) {
		this.prod_wash = prod_wash;
	}

	public String getProd_qual() {
		return prod_qual;
	}

	public void setProd_qual(String prod_qual) {
		this.prod_qual = prod_qual;
	}

	public String getProd_detail() {
		return prod_detail;
	}

	public void setProd_detail(String prod_detail) {
		this.prod_detail = prod_detail;
	}

	public String getProd_detail_img_name() {
		return prod_detail_img_name;
	}

	public void setProd_detail_img_name(String prod_detail_img_name) {
		this.prod_detail_img_name = prod_detail_img_name;
	}

	public String getProd_detail_img_savename() {
		return prod_detail_img_savename;
	}

	public void setProd_detail_img_savename(String prod_detail_img_savename) {
		this.prod_detail_img_savename = prod_detail_img_savename;
	}

	public String getProd_date() {
		return prod_date;
	}

	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}

	public ProductVo(MultipartFile mainfile, MultipartFile[] subfile, MultipartFile detailfile) {
		super();
		this.mainfile = mainfile;
		this.subfile = subfile;
		this.detailfile = detailfile;
	}

	public List<ColorsizeVo> getCssList() {
		return cssList;
	}

	public void setCssList(List<ColorsizeVo> cssList) {
		this.cssList = cssList;
	}
	

	public List<ProdimgVo> getPimgList() {
		return pimgList;
	}

	public void setPimgList(List<ProdimgVo> pimgList) {
		this.pimgList = pimgList;
	}
	

	public List<ProductVo> getStoreList() {
		return storeList;
	}

	public void setStoreList(List<ProductVo> storeList) {
		this.storeList = storeList;
	}

	public String getProd_img_name() {
		return prod_img_name;
	}

	public void setProd_img_name(String prod_img_name) {
		this.prod_img_name = prod_img_name;
	}

	public String getProd_img_savename() {
		return prod_img_savename;
	}

	public void setProd_img_savename(String prod_img_savename) {
		this.prod_img_savename = prod_img_savename;
	}

	@Override
	public String toString() {
		return "ProductVo [prod_no=" + prod_no + ", sell_no=" + sell_no + ", prod_cate=" + prod_cate + ", event_cate="
				+ event_cate + ", prod_name=" + prod_name + ", prod_price=" + prod_price + ", prod_brand=" + prod_brand
				+ ", prod_desc=" + prod_desc + ", prod_from=" + prod_from + ", prod_wash=" + prod_wash + ", prod_qual="
				+ prod_qual + ", prod_detail=" + prod_detail + ", prod_detail_img_name=" + prod_detail_img_name
				+ ", prod_detail_img_savename=" + prod_detail_img_savename + ", prod_date=" + prod_date
				+ ", prod_img_name=" + prod_img_name + ", prod_img_savename=" + prod_img_savename + ", storeList="
				+ storeList + ", pimgList=" + pimgList + ", cssList=" + cssList + ", mainfile=" + mainfile
				+ ", subfile=" + Arrays.toString(subfile) + ", detailfile=" + detailfile + "]";
	}

	

}
