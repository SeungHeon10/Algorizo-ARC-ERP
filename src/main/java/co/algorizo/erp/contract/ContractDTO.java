package co.algorizo.erp.contract;

import co.algorizo.erp.company.CompanyDTO;
import co.algorizo.erp.dept.dto.DeptDTO;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.stock.stockDTO;

public class ContractDTO {
	private int cr_no; 
	private String cr_name; 
	private String cr_regdate; 
	private String cr_code; 
	private String cr_moddate; 
	private String cr_state;
	
	private String member_m_id; 
	private int product_p_id; 
	private int dept_d_id; 
	private int company_cp_id;
	
	private String cp_name;
	private String m_name;
	
	private ProductDTO product;
	private CompanyDTO company;
	private DeptDTO dept;
	
	public ContractDTO() {
		
	}

	public ContractDTO(int cr_no, String cr_name, String cr_regdate, String cr_code, String cr_moddate, String cr_state,
			String member_m_id, int product_p_id, int dept_d_id, int company_cp_id, String cp_name, String m_name,
			ProductDTO product, CompanyDTO company, DeptDTO dept) {
		super();
		this.cr_no = cr_no;
		this.cr_name = cr_name;
		this.cr_regdate = cr_regdate;
		this.cr_code = cr_code;
		this.cr_moddate = cr_moddate;
		this.cr_state = cr_state;
		this.member_m_id = member_m_id;
		this.product_p_id = product_p_id;
		this.dept_d_id = dept_d_id;
		this.company_cp_id = company_cp_id;
		this.cp_name = cp_name;
		this.m_name = m_name;
		this.product = product;
		this.company = company;
		this.dept = dept;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public String getCr_name() {
		return cr_name;
	}

	public void setCr_name(String cr_name) {
		this.cr_name = cr_name;
	}

	public String getCr_regdate() {
		return cr_regdate;
	}

	public void setCr_regdate(String cr_regdate) {
		this.cr_regdate = cr_regdate;
	}

	public String getCr_code() {
		return cr_code;
	}

	public void setCr_code(String cr_code) {
		this.cr_code = cr_code;
	}

	public String getCr_moddate() {
		return cr_moddate;
	}

	public void setCr_moddate(String cr_moddate) {
		this.cr_moddate = cr_moddate;
	}

	public String getCr_state() {
		return cr_state;
	}

	public void setCr_state(String cr_state) {
		this.cr_state = cr_state;
	}

	public String getMember_m_id() {
		return member_m_id;
	}

	public void setMember_m_id(String member_m_id) {
		this.member_m_id = member_m_id;
	}

	public int getProduct_p_id() {
		return product_p_id;
	}

	public void setProduct_p_id(int product_p_id) {
		this.product_p_id = product_p_id;
	}

	public int getDept_d_id() {
		return dept_d_id;
	}

	public void setDept_d_id(int dept_d_id) {
		this.dept_d_id = dept_d_id;
	}

	public int getCompany_cp_id() {
		return company_cp_id;
	}

	public void setCompany_cp_id(int company_cp_id) {
		this.company_cp_id = company_cp_id;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public ProductDTO getProduct() {
		return product;
	}

	public void setProduct(ProductDTO product) {
		this.product = product;
	}

	public CompanyDTO getCompany() {
		return company;
	}

	public void setCompany(CompanyDTO company) {
		this.company = company;
	}

	public DeptDTO getDept() {
		return dept;
	}

	public void setDept(DeptDTO dept) {
		this.dept = dept;
	}

	
	
	
}
