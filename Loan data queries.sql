# LOAN APPLICATIONS ANALYSIS OF A FINANCE COMPANY 

use loan_Project;
select * from financial_loan;

# KEY PERFORMANCE INDICATORS

#1. TOTAL APPLICATIONS
SELECT COUNT(DISTINCT ID) AS TOTAL_APPLICATIONS 
FROM financial_loan;

# 2. Average Loan Amount: This KPI gives insight into the average loan size issued.

SELECT AVG(LOAN_AMOUNT) AS AVERAGE_LOAN FROM financial_loan;

#3 Average Annual Income: This KPI shows the average annual income of borrowers.

SELECT AVG(ANNUAL_INCOME) AS AVERAGE_LOAN FROM financial_loan;

# 4 TOTAL MONTH TO DATE APPLICATIONS 
SELECT COUNT(DISTINCT ID) AS MTD_APPLICATIONS  FROM financial_loan 
WHERE MONTH(issue_date) = 12

#5 TOTAL LOAN AMOUNT ISSUED 
SELECT SUM(loan_AMOUNT) AS TOTAL_LOAN FROM financial_loan;

#6 TOTAL LOAN AMOUNT ISSUED MTD
SELECT SUM(loan_AMOUNT) AS MTD_TOTAL_LOAN FROM financial_loan
WHERE MONTH(issue_date) = 12;

#7 Average Interest Rate: This KPI gives insight into the average interest rate charged on loans.

SELECT ROUND(AVG(INT_RATE)*100, 2) AS AVG_INTEREST FROM financial_loan;

# Average Debt-to-Income Ratio (DTI): This KPI represents the average debt-to-income ratio of borrowers.



# TOTAL PAYMENT 
SELECT SUM(TOTAL_PAYMENT) AS TOTAL_RECEIVED_FUNDS
FROM financial_loan;

SELECT SUM(TOTAL_PAYMENT) AS MTD_TOTAL_PAYMENT FROM financial_loan
WHERE MONTH(issue_date) = 12;

# SELECT AVG(DTI)*100 AS DTI FROM financial_loan

SELECT AVG(DTI)*100 AS MTD_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

# ideal loan percentage ;


SELECT (SELECT COUNT(ID) FROM financial_loan WHERE loan_status = 'Fully Paid' or loan_status = 'Current') * 100.0 /
       (SELECT COUNT(DISTINCT ID) FROM financial_loan) AS idealloanpercentage;

# ideal loan applications 

SELECT COUNT(ID) FROM financial_loan WHERE loan_status = 'Fully Paid' or loan_status = 'Current' 

# bad loan applications

SELECT COUNT(ID) as bad_appilcants FROM financial_loan WHERE loan_status = 'Charged Off'

# bad loan amount sanctioned 
select sum(loan_amount) as totalbadloan from financial_loan WHERE loan_status = 'Charged Off'

# total amount received from bad loaners 
select sum(total_payment) as totalbadloan from financial_loan WHERE loan_status = 'Charged Off'

# select loan_status, count(id) as total_applications, sum(total_payment) as totalreceivedpayment, 
sum(loan_amount) as total_sanctioned from financial_loan group by loan_status

# select * from financial_loan;
select 
	
	datename(month, issue_date) as Month,
	count(id) as total_applciations,
	sum(loan_amount) as total_sanctioned_amount,
	sum(total_payment) as total_payments
	from  financial_loan group by datename(month, issue_date) order by month

	select 
	address_state as state,
	count(id) as total_applciations,
	sum(loan_amount) as total_sanctioned_amount,
	sum(total_payment) as total_payments
	from  financial_loan group by address_state
	
	select 
	term,
	count(id) as total_applciations,
	sum(loan_amount) as total_sanctioned_amount,
	sum(total_payment) as total_payments
	from  financial_loan group by term 

	select 
	emp_length,
	count(id) as total_applciations,
	sum(loan_amount) as total_sanctioned_amount,
	sum(total_payment) as total_payments
	from  financial_loan group by emp_length 
\

	select 
	purpose,
	count(id) as total_applciations,
	sum(loan_amount) as total_sanctioned_amount,
	sum(total_payment) as total_payments
	from  financial_loan group by purpose 