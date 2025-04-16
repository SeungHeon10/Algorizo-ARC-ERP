package co.algorizo.erp.outbound;

import java.util.List;

public interface outboundService {
	
	List<outboundDTO> list() throws Exception;
			
	List<outboundDTO> detail(int out_id) throws Exception;
			
	void register(outboundDTO dto)throws Exception; 
			
	void update(outboundDTO dto)throws Exception;
			
	int delete(int out_id) throws Exception;
	
//	boolean canProceedOutbound(int product_p_id,int out_quantity)throws Exception;
	
	boolean exceed(int product_p_id,int out_quantity) throws Exception;
	
	void updateOutboundStatus(String out_id, String out_status) throws Exception;
	
	void stockupdate(int s_quantity,int s_id) throws Exception;
	
}
