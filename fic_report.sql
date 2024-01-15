USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[sp_Ghana_FIC_Report_test]    Script Date: 1/8/2024 8:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_Ghana_FIC_Report_test]
@AsAtDate date = NULL  
as

--DECLARE @xml varchar(max) = ''
DECLARE @fileName VARCHAR(50)
DECLARE @sqlStr VARCHAR(2000)
DECLARE @sqlCmd VARCHAR(1000)
DECLARE @DateStr VARCHAR(8) 
 

SET @DateStr = REPLACE(CONVERT(VARCHAR(12), DateAdd("d", -1, GETDATE()),102),'.','');
 
--SET @fileName = 'c:\Ghana FIC XML\FIC_XML_Export_' + CONVERT(CHAR(10),  GETDATE(), 120) + '.xml'
--'C:\Users\MaxwellBoakye\Documents\FIC xml folder\XML_Export_Test_1.xml'
--
 



CREATE TABLE #Save
(
schema_version varchar(255),
rentity_branch varchar(255),
submission_code varchar(255),
report_code varchar(255),
report_date datetime,
currency_code_local varchar(255),
reporting_user varchar(255),

address_type varchar(255),
additional_address_line1 varchar(255),
additional_address_line2 varchar(255),
city varchar(255),
town varchar(255),
zip varchar(255),
country_code varchar(255),
transactionnumber varchar(255),
transaction_is_suspicious varchar(15),
agent_name varchar(255),
transaction_location varchar(255),
transaction_description varchar(255),
date_transaction datetime,
value_date datetime,
teller varchar(255),
authorized varchar(255),
transaction_type_code varchar(255),
transmode_code varchar(255),
transmode_comment varchar(255),
amount_local money,
transaction_status varchar(255),
[name] varchar(255),
commercial_name varchar(255),
incorporation_legal_form varchar(255),
incorporation_number varchar(255),
business varchar(255),
entity_status varchar(255),
entity_status_date datetime,
tph_contact_type varchar(255),
tph_communication_type varchar(255),
tph_country_prefix varchar(255),
tph_number varchar(255),
[address] varchar(255),
device_number varchar(255),
ipv4 varchar(255),

t_from_my_client varchar(255),
from_funds_code varchar(255),
from_funds_comment varchar(255),
from_transaction_additional_info varchar(255),
from_foreign_currency varchar(255),
from_country varchar(255),
institution_name varchar(255),
institution_code varchar(255),
swift varchar(255),
institution_country varchar(255),
branch varchar(255),
account_category varchar(255),
account varchar(255),
currency_code varchar(255),
account_funds varchar(255),
account_fund varchar(255),
account_name varchar(255),
iban varchar(255),
client_number varchar(255),
personal_account_type varchar(255),
account_type varchar(255),
[role] varchar(255),
balance money,
date_balance date,
status_code varchar(255),
t_person_my_client varchar(255),
gender varchar(255),
first_name varchar(255),
middle_name varchar(255),
last_name varchar(255),
birthdate date,
passport_number varchar(255),
nationality1 varchar(255),
residence varchar(255),
occupation varchar(255),
employer_name varchar(255),
employment varchar(255),
email varchar(255),
t_person_identification varchar(255),
[type] varchar(255),
number varchar(255),
issue_date date,
[expiry_date] date,
issued_by varchar(255),
issue_country varchar(255),
social_account_type varchar(255),
[platform] varchar(255),
[user_name] varchar(255),
report_type varchar(255)

)

INSERT INTO #Save


SELECT 
        '5.0.1' as schema_version,
       [Company Branch] as rentity_branch,
                   'E' as submission_code,
                   'CTR' as report_code,
                   CAST([Date Effective] as datetime) as report_date,
                   'GHS' as currency_code_local,
                   'EdithMina' as reporting_user,
                   '-' as address_type,
                   '-' as additional_address_line1,
                   '-' as additional_address_line2,
                   city as city,
                   city as town,
                   '' as zip,
                   'GH' as country_code,
                   [Voucher No] as transactionnumber,
                   'false' as transaction_is_suspicious,
                   [Agent Name] as agent_name,
                   '' as transaction_location,
                   Narration as transaction_description,
                   CAST([Date Captured] as datetime) as  date_transaction,
                   CAST([Date Captured] as datetime) as  value_date,
                  [Captured By] as teller,
                  [Captured By] as authorized,
                   '-' as transaction_type_code,
                   'A' as transmode_code,
                   '-' as transmode_comment,
                   sum(Amount)*-1 as amount_local,
                   'C' as transaction_status,
                   case when [Client_Type] = 'Corporate' Then Surname ELSE Firstname + ' ' + Surname  end as [name],
                   '-' as commercial_name,
                   '-' as incorporation_legal_form,
                   '-' as incorporation_number,
                   '-' as business,
                   '---' as entity_status,
                   '' as entity_status_date,
                   '-' as tph_contact_type,
                   '-' as tph_communication_type,
                   '-' as tph_country_prefix,
                   '-' as tph_number,
                   '---' as [address],
                   '' as device_number,
                   '172.18.18.81' as ipv4,

                   '' as t_from_my_client,
                   '' as from_funds_code,
                   '' as from_funds_comment,
                   '' as from_transaction_additional_info,
                   '' as from_foreign_currency,
                   '' as from_country,
                   isnull([Bank Name],'') as institution_name,
                   isnull([Branch Number],'') as institution_code,
                   '' as swift,
                   case when [Client_Type] = 'Corporate' THEN 'GH' Else '' end as institution_country,
                   [Company Branch] as branch,
                   '' as account_category,
                   b.[Account No] as account,
                   'GHC' as currency_code,
                   '' as account_funds,
                   '' as account_fund,
                   case when [Client_Type] = 'Corporate' THEN Surname ELSE Surname + '' + FirstName end as account_name,
                   '' as iban,
                   [client No] as client_number,
                   'C' as personal_account_type,
                   'C' as account_type,
                   '-' as [role],
                   sum([current Bal]) *-1  as balance,
                   [Date Captured] as date_balance,
                   'A' as status_code,
                   '' as t_person_my_client,
                   '' as gender,
                   Firstname as first_name,
                   MiddleName as middle_name,
                   Surname as last_name,
                   isnull([Birth Date],'') as birthdate,
                   '' as passport_number,
                   'GH' as nationality1,
                   'GH' as residence,
                  [Occupation Type] as occupation,
                  '' as employer_name,
                  '' as employment,
                  '' as email,
                  '' as t_person_identification,
                  case when [ID Type]='Ghana Card' THEN 'A' 
                  when [ID Type]='Voter ID' THEN 'AA'
                  When [ID Type]= 'Drivers License' THEN 'D'
                  else 'H' end as [type],
                  [ID Number] as number,
                  '' as issue_date,
                  '' as [expiry_date],
                  '' as issued_by,
                  '' as issue_country,
                  '' as social_account_type,
                  '' as [platform],
                  '' as [user_name],
                   'CTR' as report_type
      
 FROM [Izwe_Reporting_Ghana].[dbo].[tblTransactionsDataWarehouseReport_Ghana_Savings] a inner join  
 [Izwe_Reporting_Ghana].[dbo].tblApplicationsDataWarehouseReport_Ghana_Savings b ON
a.[Account No] = b.[Account No]
where  [Transaction Code] in (7,3,5,15,8,4,40,6)
and Narration not like '%Staff loan%'
and Firstname <> 'Receipts Suspense Account'
and b.[Account Status] = 'active'
and [Date Effective] = dateadd(day,-1, cast(getdate() as date))
group by [Client_Type],Surname,Firstname,[Bank Name],[Branch Number],[ID Number],[Mobile Number],b.[Account No],
[Start Date],[Date Effective],Narration,[Birth Date],[Occupation Type],[ID Type],[Res Address Line 1],[Res Address Line 2],City,Province,
[Date Captured],[Voucher No],[Captured By], [Agent Name], [Client No],MiddleName, [Company Branch]


DROP TABLE IF EXISTS ##AuditLogTempTable



SELECT A.MyXML
INTO ##AuditLogTempTable
FROM
(SELECT CONVERT(nvarchar(max),
(
SELECT
(SELECT DISTINCT
schema_version,
439 rentity_id,
439 rentity_branch,
submission_code,
report_code,
report_date,
currency_code_local,
'EdithMina' reporting_user_code
from #Save
where amount_local >= 20000
FOR XML path(''),type),

--(SELECT
(SELECT  DISTINCT address_type,
'PMB GP 158Accra Central'[address],
--CASE WHEN town ='' THEN '-' ELSE town end as town, CASE WHEN city ='' THEN '-' ELSE city end as city,
'Accra'town,
'Accra'city,
--zip,
country_code
--for xml path(''),type)
from #Save
where amount_local >= 20000
for xml path('location'), type),

(SELECT
(SELECT transactionnumber, 
transaction_is_suspicious,
agent_name ,transaction_location ,transaction_description,date_transaction,teller,authorized,value_date,
transaction_type_code ,transmode_code,transmode_comment ,amount_local ,transaction_status,

(SELECT [role],
(Select [name], commercial_name, incorporation_legal_form, incorporation_number, business, entity_status, entity_status_date,
(Select tph_contact_type, tph_communication_type, tph_country_prefix, tph_number for xml path('phone'), root('phones'), type),
(SELECT address_type, [address], additional_address_line1, additional_address_line2, '---'city,zip, country_code for xml path('address'), root('addresses'), type),
(SELECT device_number,
(SELECT ipv4 for xml path('ip_address'), type)
for xml path('network_device'), root('network_devices'), type),
''email,''[url],''incorporation_state,'-'incorporation_country_code,
(SELECT '-' gender, '' title,'-'first_name,'-'middle_name,'-'prefix,'-'last_name, CAST(''  as datetime)birthdate,''birth_place,'-'country_of_birth,
''mothers_name,''alias,'-'full_name_frn,
(SELECT '-'first_name, '-'last_name for xml path('previous_name'), root('previous_names'), type),
''ssn,'-'passport_number,'-'passport_country,''id_number,'-'nationality1, '-'nationality2,'-'nationality3,'-'residence,
CAST(''  as datetime)residence_since, ''phones,''addresses,
(SELECT device_number,
(SELECT ipv4 for xml path('ip_address'), type)
for xml path('network_device'), root('network_devices'), type),
'-'email,'-'email,'-'email,'-'email,'-'email,
(SELECT ''[platform],''[user_name] for xml path ('social_account'), root('social_media'), type),
'-'occupation,'-'employer_name,
(SELECT address_type, [address],additional_address_line1,additional_address_line2,'-'city,zip,country_code for xml path('employer_address_id'), type),
(SELECT tph_contact_type,tph_communication_type,tph_country_prefix,tph_number for xml path('employer_phone_id'), type),
(SELECT '-'[type], ''number,''issued_by,'-'issue_country for xml path('identification'), root('identifications'),type),
''deceased,CAST('' as datetime)date_deceased,'-'tax_number,'-'tax_reg_number,''source_of_wealth,
(SELECT '-'pep_country for xml path('pep'),root('peps'), type),
'true'is_protected,
(SELECT ''[provider],''sanction_list_name for xml path('sanction_list'), root('sanctions'), type),
(SELECT '-'person_person_relation,
(SELECT '-'gender,''title,'-'first_name,'-'middle_name,'-'prefix,'-'last_name for xml path('person'), type)
for xml path('person_related_person'), root('related_persons'), type),
(SELECT CAST('' as datetime)valid_from for xml path('relationship_date_range'), root('re_relationship'), type),
(SELECT '-'info_subject for xml path('additional_info'), root('additional_information'), type),
''comments,'-'[role]
for xml path('director_id'), type),
(SELECT ''entity_entity_relation,
(SELECT '-'[name] for xml path('entity') , type)
for xml path('entity_related_entity'), root('related_entities'), type),
CAST('' as datetime)incorporation_date
for xml path('entity_my_client'), type),
(SELECT '-'foreign_currency_code,0 foreign_amount,0 foreign_exchange_rate for xml path('foreign_currency'),  type),
'-'country

for xml path('party'), root('involved_parties'), type)
for xml path(''),type)

from #Save
where amount_local >= 20000
for xml path('transaction'),type),

--(SELECT
(SELECT DISTINCT '-'indicator
--for xml path(''),type)
from #Save
where amount_local >= 20000
for xml path('report_indicators'),type),


--(SELECT
(SELECT DISTINCT '-'info_subject 
--for xml path(''),type)
from #Save
where amount_local >= 20000
for xml path('additional_info'), root('additional_information'),type)


FOR XML path(''), ROOT('report')

)
)AS MyXML

)A

select @sqlStr =
 'bcp "SELECT MyXML FROM ##AuditLogTempTable" queryout'+' "c:\Ghana FIC XML\FIC_XML_Export_'+@DateStr+'.xml"  -T -c -t,' 
EXEC xp_cmdshell @sqlStr

--'bcp "SELECT MyXML FROM ##AuditLogTempTable" queryout "C:\XML_Export_Test_1.xml" -T -c -t,' 

--Exec sp_Ghana_FIC_Report_test @AsAtDate 

--print dateadd(DAY,-1, cast(getdate() AS DATE))
  