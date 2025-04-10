package co.algorizo.erp.inbound;

import java.util.List;

import co.algorizo.erp.product.ProductDTO;

public interface inboundService {
	
	List<inboundDTO> list() throws Exception;
	
	List<inboundDTO> detail(int in_id) throws Exception;
	
	void register(inboundDTO dto)throws Exception; 
	
	void update(inboundDTO dto)throws Exception;
	
	int delete(int in_id) throws Exception;
	
	
}