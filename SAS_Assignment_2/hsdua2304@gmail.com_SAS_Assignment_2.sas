/* SAS Assignment-2  */
/* Date : 20-07-2017 */
/* Submitted By : Harmandeep Singh */
/* Email : hsdua2304@gmail.com */

libname Asigmnt2 '/folders/myfolders/SAS Assignment 2';

/* Problem-1 */

proc import datafile='/folders/myfolders/SAS Assignment 2/grocery_coupons.xls'
			out=asigmnt2.grocery_coupons
			dbms=xls
			replace;
			range="Data$A1:P1405";
run;

/* proc contents data=asigmnt2.grocery_coupons; */
/* run; */

proc format library=Asigmnt2.formats fmtlib;
	Value StoreID;

	value HealthFoodStore
		0 = 'No'
		1 = 'Yes';
		
	Value SizeOfStore
	1='Small'
	2='Medium'
	3='Large';
	
	Value StoreOrganization
	1='Emphasizes Produce'
	2='Emphasizes deli'
	3='Emphasizes bakery'
	4='No emphasis';
	
	Value CustomerID;
	
	Value Gender
	0='Male'
	1='Female';
	
	Value WhoShoppingFor
	1='Self'
	2='Self and Spouse'
	3='Self and Family';
	
	Value Vegetarian
	0='No'
	1='Yes';
	
	Value ShoppingStyle
	1='Biweekly; In bulk'
	2='Weekly; Similar Items'
	3="Often; What's on Sale";
	
	Value UseCoupons
	1='No'
	2='From newspaper'
	3='From mailings'
	4='From both';
	
	Value Week;
	Value Sequence;
	
	Value CarryOver
	0='First Period'
	1='No Coupon'
	2='5 Percent'
	3='15 Percent'
	4='25 Percent';
	
	Value ValueOfCoupons
	1='No Value'
	2='5 Percent'
	3='15 Percent'
	4='25 Percent';
	
	Value AmountSpent;
run;

options fmtsearch=(asigmnt2.formats);

Data asigmnt2.grocery_coupons;
set asigmnt2.grocery_coupons;
format storeid StoreID. hlthfood HealthFoodStore. size SizeOfStore.
org StoreOrganization.
custid CustomerID.
gender Gender.
shopfor WhoShoppingFor.
veg Vegetarian.
style ShoppingStyle.
usecoup UseCoupons.
week Week.
seq Sequence.
carry CarryOver.
coupval ValueOfCoupons.
amtspent AmountSpent.;
run;

/* Problem-2 */

proc freq data=asigmnt2.grocery_coupons;
table coupval style;
run; 

proc sort data=asigmnt2.grocery_coupons;
by gender;
run;

proc freq data=asigmnt2.grocery_coupons;
table coupval style;
by gender;
run; 

/* Problem-3 */
Proc freq data=asigmnt2.grocery_coupons;
table size*org/crosslist nocol norow nopercent;
run;

Proc freq data=asigmnt2.grocery_coupons;
table size*org/crosslist nocol norow nofreq;
run;

/* Problem-4 */

Proc means data=asigmnt2.grocery_coupons mean max var sum maxdec=2;
var amtspent;
class size org;
run;	