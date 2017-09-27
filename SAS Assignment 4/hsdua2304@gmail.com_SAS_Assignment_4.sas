/* Problem - 1 */

/* Part-1 */

Data Simple_interest;
	do year = 1 to 15;
		amount + 5000;
		interest = amount * (0.1);
		total_interest + interest;
		total_amount = amount + total_interest;
		output;
	end;
run;

/* Part-2 */
Data Compound_interest;
	Do year = 1 to 15;
		amount+5000+total_interest;
		interest = amount * (0.1);
		total_interest + interest;
		total_amount = amount + total_interest;
		output;
	end;
run;
		
/* Problem -2 */

Data distance;
	gallon = 1;
	do while (gallon <= 10 and Miles <= 250);
		Miles = gallon * 20;
		output;
		gallon + 1;
	end;
run;

/* Problem - 3 */

/* Part-1 */
Data Fixed_deposit_annually;
	retain year interest total_interest amount;
	amount = 500000;
	do year = 1 to 25;
		interest = amount * (0.07);
		amount + interest;
		output;
	end;
run;

/* Part-2 */
Data Fixed_deposit_monthly;
	retain Year month interest amount;
	amount=500000;
	do year = 1 to 25;
		do month = 1 to 12;
			interest = amount*(0.07/12);
			amount + interest;
			output;
		end;
/* 		output; */
	end;
run;