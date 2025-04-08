package co.algorizo.erp.stock;


public class StockSummaryDTO {
	
	private String p_name;       
	private int s_quantity;
	private int p_id;
	private String p_code;

	
	public StockSummaryDTO(){
		
	}


	public StockSummaryDTO(String p_name, int s_quantity, int p_id, String p_code) {
		super();
		this.p_name = p_name;
		this.s_quantity = s_quantity;
		this.p_id = p_id;
		this.p_code = p_code;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public int getS_quantity() {
		return s_quantity;
	}


	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}


	public int getP_id() {
		return p_id;
	}


	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public String getP_code() {
		return p_code;
	}


	public void setP_code(String p_code) {
		this.p_code = p_code;
	}


	@Override
	public String toString() {
		return "StockSummaryDTO [p_name=" + p_name + ", s_quantity=" + s_quantity + ", p_id=" + p_id + ", p_code="
				+ p_code + "]";
	}
	
}
