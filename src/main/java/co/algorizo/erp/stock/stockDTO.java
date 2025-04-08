package co.algorizo.erp.stock;

import java.math.BigDecimal;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.inbound.inboundDTO;
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
	private int outbound_out_id;
	private int inbound_in_id;
	private String member_m_id;
	private int company_cp_id;
	private inboundDTO inbound;
	private outboundDTO outbound;
	private ProductDTO product;
	/*
	 * private MemberDTO member; private CompanyDTO company;
	 */

	public stockDTO() {

	}
	public stockDTO(int s_id, int s_quantity, String s_status, int del, String etc, int product_p_id,
			int outbound_out_id, int inbound_in_id, String member_m_id, int company_cp_id, inboundDTO inbound,
			outboundDTO outbound, ProductDTO product) {
		super();
		this.s_id = s_id;
		this.s_quantity = s_quantity;
		this.s_status = s_status;
		this.del = del;
		this.etc = etc;
		this.product_p_id = product_p_id;
		this.outbound_out_id = outbound_out_id;
		this.inbound_in_id = inbound_in_id;
		this.member_m_id = member_m_id;
		this.company_cp_id = company_cp_id;
		this.inbound = inbound;
		this.outbound = outbound;
		this.product = product;
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

	public int getOutbound_out_id() {
		return outbound_out_id;
	}

	public void setOutbound_out_id(int outbound_out_id) {
		this.outbound_out_id = outbound_out_id;
	}

	public int getInbound_in_id() {
		return inbound_in_id;
	}

	public void setInbound_in_id(int inbound_in_id) {
		this.inbound_in_id = inbound_in_id;
	}

	public String getMember_m_id() {
		return member_m_id;
	}

	public void setMember_m_id(String member_m_id) {
		this.member_m_id = member_m_id;
	}

	public int getCompany_cp_id() {
		return company_cp_id;
	}

	public void setCompany_cp_id(int company_cp_id) {
		this.company_cp_id = company_cp_id;
	}

	public inboundDTO getInbound() {
		return inbound;
	}

	public void setInbound(inboundDTO inbound) {
		this.inbound = inbound;
	}

	public outboundDTO getOutbound() {
		return outbound;
	}

	public void setOutbound(outboundDTO outbound) {
		this.outbound = outbound;
	}

	public ProductDTO getProduct() {
		return product;
	}

	public void setProduct(ProductDTO product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "stockDTO [s_id=" + s_id + ", s_quantity=" + s_quantity + ", s_status=" + s_status + ", del=" + del
				+ ", etc=" + etc + ", product_p_id=" + product_p_id + ", outbound_out_id=" + outbound_out_id
				+ ", inbound_in_id=" + inbound_in_id + ", member_m_id=" + member_m_id + ", company_cp_id="
				+ company_cp_id + ", inbound=" + inbound + ", outbound=" + outbound + ", product=" + product + "]";
	}

}