package co.algorizo.erp.stock;

import java.util.List;

public interface stockDAO {
//stock
	List<stockDTO> list() throws Exception;

	stockDTO detail(int s_id) throws Exception;

	void register(stockDTO dto) throws Exception; 

	void update(stockDTO dto) throws Exception;

	int delete(int s_id) throws Exception;

	List<StockSummaryDTO> summary() throws Exception;
	
	void updateStockStatus(stockDTO stockdto) throws Exception; 
}
