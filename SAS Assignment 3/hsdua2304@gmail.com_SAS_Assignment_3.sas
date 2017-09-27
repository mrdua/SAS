/* Date - 27-07-2017 */
/* Name - Harmandeep Singh */
/* Email - hsdua2304@gmail.com */
/* SAS Assignment 3 */


Libname Asigmnt3 "/folders/myfolders/SAS Assignment 3";

proc import datafile="/folders/myfolders/SAS Assignment 3/car_sales.csv" 
		out=Asigmnt3.car_sales;
run;

/* Problem-1 */
proc freq data=asigmnt3.car_sales;
	table Manufacturer;
run;

data cars_origin(keep=manufacturer model car_origin);
	set asigmnt3.car_sales;
	length Manufacturer $15. car_origin $20.;

	Select(manufacturer);
		when ("Acura") car_origin="Japan";
		when ("Audi") car_origin="Germany";
		When ("BMW") car_origin="Germany";
		When ("Buick") car_origin="United States";
		When ("Cadillac") car_origin="United States";
		When ("Chevrole") car_origin="United States";
		When ("Chrysler") car_origin="United States";
		When ("Dodge") car_origin="United States";
		When ("Ford") car_origin="United States";
		When ("Honda") car_origin="Japan";
		When ("Hyundai") car_origin="South Korea";
		When ("Ininiti") car_origin="Japan";
		When ("Jaguar") car_origin="United Kingdom";
		When ("Jeep") car_origin="United States";
		When ("Lexus") car_origin="Japan";
		When ("Lincoln") car_origin="United States";
		When ("Mitsuibishi") car_origin="Japan";
		When ("Mercury") car_origin="United States";
		When ("Saturn") car_origin="United States";
		When ("Subaru") car_origin="Japan";
		When ("Toyota") car_origin="Japan";
		When ("Valkswagen") car_origin="India";
		When ("Volvo") car_origin="United States";
		Otherwise car_origin="Other";
	end;
run;

/* Problem-2 */
Data asigmnt3.car_sales;
	set asigmnt3.car_sales;
	Unique_ID=Trim(Model)||'_'||Trim(Manufacturer);
run;

/* Problem-3 */
Data cars_sales_1 (keep=Unique_ID Manufacturer Model Latest_Launch 
		Sales_in_thousands _4_year_resale_value price_in_thousands) 
		cars_sales_2(Drop=Manufacturer Model Latest_Launch Sales_in_thousands 
		_4_year_resale_value price_in_thousands);
	set asigmnt3.car_sales;
run;

/* Problem-4 */
Data Hyundai;
	Input Manufacturer$ Model$ Sales_in_thousands _4_year_resale_value 
		Latest_Launch date7.;
	Format Latest_Launch date7.;
	datalines;
Hyundai Tuscon 16.919 16.36 2Feb12
Hyundai i45 39.384 19.875 3jun11
Hyundai Verna 14.114 18.225 4jan12
Hyundai Terracan 8.588 29.725 10Mar11
;
run;

data Hyundai;
	set Hyundai;
	Unique_ID=Trim(Manufacturer)||'_'||Trim(Model);
run;

/* Problem-5 */
data Total_Sales;
	set cars_sales_1 Hyundai;
run;

/* Problem-6 */
Proc sort data=Total_sales;
	by Unique_ID;
run;

Proc sort data=cars_sales_2;
	by Unique_ID;
run;

data MERGED;
	MERGE Total_sales cars_sales_2;
	by Unique_ID;
run;

/* Problem-7 */
Proc sort data=Total_sales;
	by Unique_ID;
run;

Proc sort data=cars_sales_2;
	by Unique_ID;
run;

Data Common_Merged;
	merge Total_Sales(in=temp_total_sales) cars_sales_2(in=temp_cars_sales_2);
	by Unique_ID;

	if temp_total_sales=1 and temp_cars_sales_2=1;
run;