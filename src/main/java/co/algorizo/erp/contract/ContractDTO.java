package co.algorizo.erp.contract;

public class ContractDTO {
	private int cr_no; 
	private String cr_name; 
	private String cr_regdate; 
	private String cr_code; 
	private String cr_moddate; 
	private String cr_state;
	
	public ContractDTO() {
		
	}
	
	public ContractDTO(int cr_no, String cr_name, String cr_regdate, String cr_code, String cr_moddate, String cr_state) {
		super();
		this.cr_no = cr_no;
		this.cr_name = cr_name;
		this.cr_regdate = cr_regdate;
		this.cr_code = cr_code;
		this.cr_moddate = cr_moddate;
		this.cr_state = cr_state;
	}


	public int getCr_no() {
		return cr_no;
	}


	public void scr_stater_no(int cr_no) {
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


	public String getcr_state() {
		return cr_state;
	}


	public void setcr_state(String cr_state) {
		this.cr_state = cr_state;
	}
	
	
	
}
