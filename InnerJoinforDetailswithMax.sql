select mrv.MeetingGeographicUnit as Region,mrv.Name,mrv.LeadPlanners, mrv.totalbudgetexpenseactualconverted as Budget
from MeetingsReportView mrv
inner join
(
-- find largest budget by service level
select mrv2.MeetingGeographicUnit,MAX(mrv2.totalbudgetexpenseactualconverted) as Budget
from MeetingsReportView mrv2
group by mrv2.MeetingGeographicUnit
) T
-- join to remove duplicates
on mrv.MeetingGeographicUnit=T.MeetingGeographicUnit and mrv.TotalBudgetExpenseActualConverted=T.Budget
where mrv.status!=6 and mrv.status!=10 ;
