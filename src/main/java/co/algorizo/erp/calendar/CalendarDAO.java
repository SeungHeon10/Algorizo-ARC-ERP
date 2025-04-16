package co.algorizo.erp.calendar;

import java.time.LocalDate;
import java.util.List;

import co.algorizo.erp.contract.ContractDTO;
import co.algorizo.erp.inbound.inboundDTO;
import co.algorizo.erp.inspection.DTO.InspectionDTO;
import co.algorizo.erp.order.OrderDTO;
import co.algorizo.erp.outbound.outboundDTO;
import co.algorizo.erp.outinspection.OutInspectionDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;

public interface CalendarDAO {
//	납기일
	List<PlanDetailDTO> planDate(LocalDate start, LocalDate end);
//	발주일
	List<OrderDTO> orderDate(LocalDate start, LocalDate end);
//	계약일
	List<ContractDTO> contractDate(LocalDate start, LocalDate end);
//	입고검수 완료일
	List<InspectionDTO> inspectionDate(LocalDate start, LocalDate end);
//	출고검수 완료일
	List<OutInspectionDTO> outInspectionDate(LocalDate start, LocalDate end);
//	입고일
	List<inboundDTO> inboundDate(LocalDate start, LocalDate end);
//	출고일
	List<outboundDTO> outboundDate(LocalDate start, LocalDate end);
}
