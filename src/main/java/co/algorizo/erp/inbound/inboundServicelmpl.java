package co.algorizo.erp.inbound;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import co.algorizo.erp.company.CompanyDAO;
import co.algorizo.erp.product.ProductDAO;
import co.algorizo.erp.product.ProductDTO;
import co.algorizo.erp.register.dao.MemberDAO;

@Service
public class inboundServicelmpl implements inboundService{
	
	@Autowired
	private inboundDAO inbounddao;
	@Autowired
	private ProductDAO productdao;
	@Autowired
	private MemberDAO memberdao;
	@Autowired
	private CompanyDAO companydao;

	@Override
	public List<inboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return inbounddao.list();
	}

	@Override
	public List<inboundDTO> detail(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(in_id);
		List<inboundDTO> dto = inbounddao.detail(in_id);
		System.out.println("service"+ dto);
		return dto;
	}
	
	@Override
	public void register(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		inbounddao.register(dto);
		productdao.productlist();
		companydao.companylist();
		memberdao.memberList();
	}

	@Override
	public void update(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		inbounddao.update(dto);
	}

	@Override
	public int delete(int in_id) throws Exception {
		// TODO Auto-generated method stub
	return inbounddao.delete(in_id);
	}


}
