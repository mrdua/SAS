/* Assignment-1  */
/* Date : 18-07-2017 */
/* Submitted By : Harmandeep Singh */
/* Email : hsdua2304@gmail.com */


Libname Asigmnt1 '/folders/myfolders/SAS Assignment 1';

/* Problem-1 */

proc import datafile='/folders/myfolders/SAS Assignment 1/Car_Sales.csv'
out=asigmnt1.car_sales
dbms=csv
replace;
run;

/* Problem-2 */

data asigmnt1.car_sales;
set asigmnt1.car_sales;
if _4_year_resale_value=. or price_in_thousands=. then delete;
run;

/* Problem-3 */

data low_to_15k _15k_to_20k _20k_to_30k _30k_to_40k _40k_to_high;
	set asigmnt1.car_sales;
	if(Price_in_thousands <= 15) then output low_to_15k;
	if(Price_in_thousands > 15 and Price_in_thousands <= 20) then output _15k_to_20k;
	if(Price_in_thousands > 20 and Price_in_thousands <= 30) then output _20k_to_30k;
	if(Price_in_thousands > 30 and Price_in_thousands <= 40) then output _30k_to_40k;
	if(Price_in_thousands > 40) then output _40k_to_high;
run;

/* Problem-4 */

data car_sales_4;
set asigmnt1.car_sales;
Keep Manufacturer Model Sales_in_thousands Price_in_thousands;
run;

/* Problem-5 */

data car_sales_passenger;
	set asigmnt1.car_sales;
	where Vehicle_type="Passenger" and latest_launch> '1-oct-2014'd;
run;

