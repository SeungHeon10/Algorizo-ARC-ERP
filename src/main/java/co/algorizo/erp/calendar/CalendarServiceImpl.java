package co.algorizo.erp.calendar;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.algorizo.erp.contract.ContractDTO;
import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inspection.DTO.InspectionDTO;
import co.algorizo.erp.order.OrderDTO;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.outinspection.OutInspectionDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;


@Service
public class CalendarServiceImpl implements CalendarService{
	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	@Transactional
	public List<CalendarDTO> getMonthlySchedule(LocalDate start, LocalDate end) {
		List<CalendarDTO> list = new ArrayList<CalendarDTO>();
		
//		납기일
	    for (PlanDetailDTO plan : calendarDAO.planDate(start, end)) {
	    	list.add(convertToCalendar(plan, "납기", "#dc3545", "📅"));
	    }

//		발주일
	    for (OrderDTO order : calendarDAO.orderDate(start, end)) {
	    	list.add(convertToCalendar(order, "발주", "#6610f2", "🛒"));
	    }
	    
//		계약일
	    for (ContractDTO contract : calendarDAO.contractDate(start, end)) {
	    	list.add(convertToCalendar(contract, "계약", "#6c757d", "📄"));
	    }
	    
//		입고검수 완료일
	    for (InspectionDTO inspection : calendarDAO.inspectionDate(start, end)) {
	    	list.add(convertToCalendar(inspection, "입고검수", "#198754", "🔍"));
	    }
	    
//		출고검수 완료일
	    for (OutInspectionDTO outInspection : calendarDAO.outInspectionDate(start, end)) {
	    	list.add(convertToCalendar(outInspection, "출고검수", "#ffc107", "🔎"));
	    }
	    
//	    입고일
	    for (inboundDTO inbound : calendarDAO.inboundDate(start, end)) {
	    	list.add(convertToCalendar(inbound, "입고", "#20c997", "📦"));
	    }
	    
//	    출고일
	    for (outboundDTO outbound : calendarDAO.outboundDate(start, end)) {
	    	list.add(convertToCalendar(outbound, "출고", "#0d6efd", "🚚"));
	    }
		
		return list;
	}
	
	private CalendarDTO convertToCalendar(Object data, String type, String color, String emoji) {
	    CalendarDTO dto = new CalendarDTO();

	    if (data instanceof PlanDetailDTO) {
	    	PlanDetailDTO plan = (PlanDetailDTO) data;
	        dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + "일 - 품목 <strong style='color:black;'>" + plan.getP_name() + "</strong>");
	        dto.setStart(plan.getPp_delivery_date().toString());
	        dto.setRelatedId(String.valueOf(plan.getPlan_id()));
	    } else if (data instanceof OrderDTO) {
	    	OrderDTO order = (OrderDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + " - 품목 <strong style='color:black;'>" + order.getProduct().getP_name() + "</strong>");
	        dto.setStart(order.getO_regdate().toString());
	        dto.setRelatedId(order.getO_code());
	    } else if (data instanceof ContractDTO) {
	    	ContractDTO contract = (ContractDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + "완료 - 거래처 <strong style='color:black;'>" + contract.getCp_name() + "</strong>");
	        dto.setStart(contract.getCr_regdate().toString());
	        dto.setRelatedId(contract.getCr_code());
	    } else if (data instanceof InspectionDTO) {
	    	InspectionDTO inspection = (InspectionDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + " - 품목 <strong style='color:black;'>" + inspection.getProductDTO().getP_name() + "</strong>");
	        dto.setStart(inspection.getI_date().toString());
	        dto.setRelatedId(String.valueOf(inspection.getI_id()));
	    } else if (data instanceof OutInspectionDTO) {
	    	OutInspectionDTO outInspection = (OutInspectionDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + " - 품목 <strong style='color:black;'>" + outInspection.getProductDTO().getP_name() + "</strong>");
	        dto.setStart(outInspection.getOi_date().toString());
	        dto.setRelatedId(String.valueOf(outInspection.getOi_id()));
	    } else if (data instanceof inboundDTO) {
	    	inboundDTO inbound = (inboundDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + "일 - 품목 <strong style='color:black;'>" + inbound.getProduct().getP_name() + "</strong>");
	        dto.setStart(inbound.getIn_date().toString());
	        dto.setRelatedId(String.valueOf(inbound.getIn_id()));
	    } else if (data instanceof outboundDTO) {
	    	outboundDTO outbound = (outboundDTO) data;
	    	dto.setTitle("");
	        dto.setRenderedTitle(emoji + " " + type + "일 - 품목 <strong style='color:black;'>" + outbound.getProduct().getP_name() + "</strong>");
	        dto.setStart(outbound.getOut_date().toString());
	        dto.setRelatedId(String.valueOf(outbound.getOut_id()));
	    } 

	    dto.setColor(color);
	    dto.setType(type);
	    return dto;
	}
}
