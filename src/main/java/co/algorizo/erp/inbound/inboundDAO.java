package co.algorizo.erp.inbound;

import java.util.List;

public interface inboundDAO {
	
	List<inboundDTO> list() throws Exception;
	
	List<inboundDTO> detail(int in_id) throws Exception;
	
	void register(inboundDTO dto)throws Exception; 
	
	void update(inboundDTO dto)throws Exception;
	
	int delete(int in_id) throws Exception;
	
	void updateInboundStatus(String in_id, String in_status) throws Exception;
	
	void stockupdate(int s_quantity,int s_id) throws Exception;
}
