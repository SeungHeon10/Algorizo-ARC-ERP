package co.algorizo.erp.inspection;

import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.product.ProductDTO;

public class InspectionDTO {
	private int i_id; // 검수 ID
	private int in_id; // 입고 ID
	private String i_code;
	private String i_date; // 검수일자
	private int i_quantity; // 검수수량
	private int i_defective_quantity; // 불량수량
	private String i_result; // 검수 결과
	private String i_inspector; // 검수자
	private String i_moddate; // 검수 수정일
	private String i_etc; // 비고
	
	private inboundDTO inboundDTO;
	private ProductDTO productDTO;
	
	public InspectionDTO() {}

	public InspectionDTO(int i_id, int in_id, String i_code, String i_date, int i_quantity, int i_defective_quantity,
			String i_result, String i_inspector, String i_moddate, String i_etc,
			co.algorizo.erp.inbound.inboundDTO inboundDTO, ProductDTO productDTO) {
		super();
		this.i_id = i_id;
		this.in_id = in_id;
		this.i_code = i_code;
		this.i_date = i_date;
		this.i_quantity = i_quantity;
		this.i_defective_quantity = i_defective_quantity;
		this.i_result = i_result;
		this.i_inspector = i_inspector;
		this.i_moddate = i_moddate;
		this.i_etc = i_etc;
		this.inboundDTO = inboundDTO;
		this.productDTO = productDTO;
	}

	public int getI_id() {
		return i_id;
	}

	public void setI_id(int i_id) {
		this.i_id = i_id;
	}

	public int getIn_id() {
		return in_id;
	}

	public void setIn_id(int in_id) {
		this.in_id = in_id;
	}

	public String getI_code() {
		return i_code;
	}

	public void setI_code(String i_code) {
		this.i_code = i_code;
	}

	public String getI_date() {
		return i_date;
	}

	public void setI_date(String i_date) {
		this.i_date = i_date;
	}

	public int getI_quantity() {
		return i_quantity;
	}

	public void setI_quantity(int i_quantity) {
		this.i_quantity = i_quantity;
	}

	public int getI_defective_quantity() {
		return i_defective_quantity;
	}

	public void setI_defective_quantity(int i_defective_quantity) {
		this.i_defective_quantity = i_defective_quantity;
	}

	public String getI_result() {
		return i_result;
	}

	public void setI_result(String i_result) {
		this.i_result = i_result;
	}

	public String getI_inspector() {
		return i_inspector;
	}

	public void setI_inspector(String i_inspector) {
		this.i_inspector = i_inspector;
	}

	public String getI_moddate() {
		return i_moddate;
	}

	public void setI_moddate(String i_moddate) {
		this.i_moddate = i_moddate;
	}

	public String getI_etc() {
		return i_etc;
	}

	public void setI_etc(String i_etc) {
		this.i_etc = i_etc;
	}

	public inboundDTO getInboundDTO() {
		return inboundDTO;
	}

	public void setInboundDTO(inboundDTO inboundDTO) {
		this.inboundDTO = inboundDTO;
	}

	public ProductDTO getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}

	@Override
	public String toString() {
		return "InspectionDTO [i_id=" + i_id + ", in_id=" + in_id + ", i_code=" + i_code + ", i_date=" + i_date
				+ ", i_quantity=" + i_quantity + ", i_defective_quantity=" + i_defective_quantity + ", i_result="
				+ i_result + ", i_inspector=" + i_inspector + ", i_moddate=" + i_moddate + ", i_etc=" + i_etc
				+ ", inboundDTO=" + inboundDTO + ", productDTO=" + productDTO + "]";
	}
	
}
