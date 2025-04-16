package co.algorizo.erp.stock;

import java.util.List;

import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.stock.stockDTO;

public interface stockService {
	
		List<stockDTO> list() throws Exception;
				
		stockDTO detail(int s_id) throws Exception;
				
		List<StockSummaryDTO> summary() throws Exception;
		
		void updateStockStatus(stockDTO stockdto) throws Exception; 
		
}
