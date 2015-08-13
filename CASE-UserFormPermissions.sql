select Username,u.FirstName,u.LastName,LDAPUserPrincipalName as StandardID,LastLogOnDate,mpg.name as MPG,

SUBSTRING(PermissionsXML,charindex('SubTopic="Form"',convert(nvarchar(max),PermissionsXML),0),70) as FormXML,
CASE 
	WHEN CHARINDEX('View="true"',SUBSTRING(PermissionsXML,charindex('SubTopic="Form"',convert(nvarchar(max),PermissionsXML),0),70) ,0)  > 0
	then 'TRUE'
	else 'FALSE'
END as FormView,
CASE 
	WHEN CHARINDEX('Add="true"',SUBSTRING(PermissionsXML,charindex('SubTopic="Form"',convert(nvarchar(max),PermissionsXML),0),70) ,0)  > 0
	then 'TRUE'
	else 'FALSE'
END as FormAdd,
CASE 
	WHEN CHARINDEX('Edit="true"',SUBSTRING(PermissionsXML,charindex('SubTopic="Form"',convert(nvarchar(max),PermissionsXML),0),70) ,0)  > 0
	then 'TRUE'
	else 'FALSE'
END as FormEdit,
CASE 
	WHEN CHARINDEX('Delete="true"',SUBSTRING(PermissionsXML,charindex('SubTopic="Form"',convert(nvarchar(max),PermissionsXML),0),70) ,0)  > 0
	then 'TRUE'
	else 'FALSE'
END as CommDelete
from users u
left join Resources r on r.ResourceID=u.ResourceID
left join MeetingPlanningGroups mpg on mpg.MeetingPlanningGroupID=r.MeetingPlanningGroupID

where LogOnDisabled=0 and u.Inactive=0 and Not(LastLogOnDate is null)
order by LastLogOnDate desc
