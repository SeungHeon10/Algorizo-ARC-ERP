package co.algorizo.erp.stock;

import java.math.BigDecimal;
import java.sql.Date;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inspection.DTO.InspectionDTO;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.register.dto.MemberDTO;

public class stockDTO {

	private int s_id;
	private int s_quantity;
	private String s_status;
	private int del;
	private String etc;
	private int product_p_id;
	private ProductDTO product;
	private Date in_date;
	private Date out_date;
	private InspectionDTO inspection;
	/*
	 * private MemberDTO member; private CompanyDTO company;
	 */

	public stockDTO() {

	}
	public stockDTO(int s_id, int s_quantity, String s_status, int del, String etc, int product_p_id,
			ProductDTO product, Date in_date, Date out_date, InspectionDTO inspection) {
		super();
		this.s_id = s_id;
		this.s_quantity = s_quantity;
		this.s_status = s_status;
		this.del = del;
		this.etc = etc;
		this.product_p_id = product_p_id;
		this.product = product;
		this.in_date = in_date;
		this.out_date = out_date;
		this.inspection = inspection;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getS_quantity() {
		return s_quantity;
	}
	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}
	public String getS_status() {
		return s_status;
	}
	public void setS_status(String s_status) {
		this.s_status = s_status;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getProduct_p_id() {
		return product_p_id;
	}
	public void setProduct_p_id(int product_p_id) {
		this.product_p_id = product_p_id;
	}
	public ProductDTO getProduct() {
		return product;
	}
	public void setProduct(ProductDTO product) {
		this.product = product;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public InspectionDTO getInspection() {
		return inspection;
	}
	public void setInspection(InspectionDTO inspection) {
		this.inspection = inspection;
	}
	@Override
	public String toString() {
		return "stockDTO [s_id=" + s_id + ", s_quantity=" + s_quantity + ", s_status=" + s_status + ", del=" + del
				+ ", etc=" + etc + ", product_p_id=" + product_p_id + ", product=" + product + ", in_date=" + in_date
				+ ", out_date=" + out_date + ", inspection=" + inspection + "]";
	}
	
}