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
	private inboundDAO inbounddao;
	@Autowired
	private outboundDAO outbounddao;
	@Autowired
	private CompanyDAO companydao;
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
	public List<stockDTO> detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return stockdao.detail(s_id);
	}
	@Override
	public void register(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		stockdao.register(dto);
		inbounddao.list();
		outbounddao.list();
		productdao.productlist();
		memberdao.memberList();
		companydao.companylist();
	}
	@Override
	public void update(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		stockdao.update(dto);
	}
	@Override
	public int delete(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return stockdao.delete(s_id);
	}
	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		return stockdao.summary();
	}

}
