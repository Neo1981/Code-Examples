select * from
(
select leadplanners,MeetingGeographicUnit
from MeetingsReportView
where YEAR(startdate)=2015
) blah
pivot
(
	count(MeetingGeographicUnit)
	for MeetingGeographicUnit in ([EMEA],[APAC],[US & Canada],[Latin America])

) as PivotTable
where leadplanners!='' 
