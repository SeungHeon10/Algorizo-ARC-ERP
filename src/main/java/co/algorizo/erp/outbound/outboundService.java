package co.algorizo.erp.outbound;

import java.util.List;

public interface outboundService {
	
	List<outboundDTO> list() throws Exception;
			
	List<outboundDTO> detail(int out_id) throws Exception;
			
	void register(outboundDTO dto)throws Exception; 
			
	void update(outboundDTO dto)throws Exception;
			
	int delete(int out_id) throws Exception;
}
