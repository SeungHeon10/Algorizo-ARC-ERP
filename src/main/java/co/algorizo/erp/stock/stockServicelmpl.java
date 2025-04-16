package co.algorizo.erp.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.algorizo.erp.company.CompanyDAO;
import co.algorizo.erp.inbound.inboundDAO;
import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.outbound.outboundDAO;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.product.ProductDAO;
import co.algorizo.erp.register.dao.MemberDAO;

@Service
public class stockServicelmpl implements stockService{
	
	@Autowired
	private stockDAO stockdao;
 	@Autowired
 	private ProductDAO productdao;

	@Autowired
	private MemberDAO memberdao;
	
	
	@Override
	public List<stockDTO> list() throws Exception {
		// TODO Auto-generated method stub
		List<stockDTO> st = stockdao.list();
		System.out.println(st);
		return st;
	}
	
	@Override
	public stockDTO detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return stockdao.detail(s_id);
	}
	
	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		List<StockSummaryDTO> s =  stockdao.summary();
		System.out.println("dao" + s);
		return s;
	}

	@Override
	public void updateStockStatus(stockDTO stockdto) throws Exception {
		// TODO Auto-generated method stub
		stockdao.updateStockStatus(stockdto);
	}

}
