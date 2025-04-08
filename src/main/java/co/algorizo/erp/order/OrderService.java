package co.algorizo.erp.order;

import java.util.List;
import java.util.Map;

public interface OrderService {

	public List<OrderDTO> getAllOrders();
	
	public void register(Map<String, Object> map);
	
	public OrderDTO getOrderDetail(String o_code);
	
	void updateOrder(Map<String, Object> map);
	
	void deleteOrder(String o_code);
	
	String generateNextOrderCode();
}
