package co.algorizo.erp.calendar;

import java.time.LocalDate;
import java.util.List;

import co.algorizo.erp.contract.ContractDTO;
import co.algorizo.erp.inspection.DTO.InspectionDTO;
import co.algorizo.erp.order.OrderDTO;
import co.algorizo.erp.outinspection.OutInspectionDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDTO;

public interface CalendarService {
	
	List<CalendarDTO> getMonthlySchedule(LocalDate start, LocalDate end);
}
