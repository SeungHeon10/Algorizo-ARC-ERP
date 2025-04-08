package co.algorizo.erp.inbound;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.register.dto.MemberDTO;

public class inboundDTO {

	private int in_id;
	private Date in_date;
	private Date update_date; 
	private String in_status; 
	private String etc; 
	private int del; 
	private int in_quantity;
	private int product_p_id;
	private int company_cp_id;
	private String member_m_id;
	private ProductDTO product;
	private MemberDTO member;
	private CompanyDTO company;
	
	public inboundDTO() {

	}

	public inboundDTO(int in_id, Date in_date, Date update_date, String in_status, String etc, int del,
			int in_quantity, int product_p_id, int company_cp_id, String member_m_id, ProductDTO product,
			MemberDTO member, CompanyDTO company) {
		super();
		this.in_id = in_id;
		this.in_date = in_date;
		this.update_date = update_date;
		this.in_status = in_status;
		this.etc = etc;
		this.del = del;
		this.in_quantity = in_quantity;
		this.product_p_id = product_p_id;
		this.company_cp_id = company_cp_id;
		this.member_m_id = member_m_id;
		this.product = product;
		this.member = member;
		this.company = company;
	}

	public int getIn_id() {
		return in_id;
	}

	public void setIn_id(int in_id) {
		this.in_id = in_id;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public String getIn_status() {
		return in_status;
	}

	public void setIn_status(String in_status) {
		this.in_status = in_status;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getIn_quantity() {
		return in_quantity;
	}

	public void setIn_quantity(int in_quantity) {
		this.in_quantity = in_quantity;
	}

	public int getProduct_p_id() {
		return product_p_id;
	}

	public void setProduct_p_id(int product_p_id) {
		this.product_p_id = product_p_id;
	}

	public int getCompany_cp_id() {
		return company_cp_id;
	}

	public void setCompany_cp_id(int company_cp_id) {
		this.company_cp_id = company_cp_id;
	}

	public String getMember_m_id() {
		return member_m_id;
	}

	public void setMember_m_id(String member_m_id) {
		this.member_m_id = member_m_id;
	}

	public ProductDTO getProduct() {
		return product;
	}

	public void setProduct(ProductDTO product) {
		this.product = product;
	}

	public MemberDTO getMember() {
		return member;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}

	public CompanyDTO getCompany() {
		return company;
	}

	public void setCompany(CompanyDTO company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "inboundDTO [in_id=" + in_id + ", in_date=" + in_date + ", update_date=" + update_date + ", in_status="
				+ in_status + ", etc=" + etc + ", del=" + del + ", in_quantity=" + in_quantity + ", product_p_id="
				+ product_p_id + ", company_cp_id=" + company_cp_id + ", member_m_id=" + member_m_id + ", product="
				+ product + ", member=" + member + ", company=" + company + "]";
	}

}