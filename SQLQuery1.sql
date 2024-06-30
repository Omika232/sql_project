use Project1;
select * from bank;
--What is the total number of customers in the dataset?
select count(contact) from bank;
--Answer is 4521
--How many customers have an account balance greater than $10,000?
Select count(balance) from bank where balance >= 10000;
--Answer is 92
--What is the average account balance of all customers?
Select avg(balance) From bank; 
--Answer is 1449
--How many customers have a loan?
Select count(loan) from bank
where loan='yes';
--Answer is 691
--What is the total balance of all accounts combined?
select sum(balance) from bank;
--Answer is 6552439
--Retrieve all details of customers who have a balance greater than $5,000.
select * from bank
where balance > 5000;
--List the total number of customers in each job type.
select job,count(*) from bank
group by job;
--Find the average account balance for customers with and without loans.
select avg(balance) from bank 
where loan = 'yes';
--Answer is 974
--Retrieve the all custmore deatils of the top 5 customers with the highest account balances.
select * from bank 
order by balance desc
Limit 5;
--Count the number of customer behalf of martial status.
select marital,count(marital) from bank 
group by marital;
--Retrieve the details of customers who are older than 60 years and have a loan.
select count(age) from bank where age>= 60;
--Answer is 174
-- Calculate the total number of loans given out and the average loan amount.
select count(balance) from bank
where balance > (select avg(balance) from bank
                     where loan='yes');
--answer is loan count 1515
--Identify and count the number of duplicate customer records based on
select count(*) from bank
group by  balance 
having count(*)>1;
--
select * from bank;
--Update the account balance to 0 for customers with a negative balance
update bank
set balance = 0
where balance<0;
--Remove rows where the balance column is NULL.
delete from bank where balance is null;
--Create a new column account_status and set it to 'Active' if the account_balance is greater than 0, otherwise 'Inactive'.
Alter table bank
add  Account_status varchar(20);
update bank
set Account_status = case 
                     when balance>0 then 'active'
					 else 'non_active'
					 end;

--Calculate the total number of accounts and the total balance for each account_type
select Account_status , sum(balance) from bank
group by Account_status;


