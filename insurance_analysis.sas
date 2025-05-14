/* Import CSV into SAS */
FILENAME REFFILE '/home/u64181166/sasuser.v94/insurance_claims.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=insurance_claims;
	GETNAMES=YES;
RUN;


/* Generated Code (IMPORT) */
/* Source File: insurance_claims.csv */
/* Source Path: /home/u64181166/sasuser.v94 */
/* Code generated on: 3/8/25, 4:55 PM */


/* View dataset structure */
PROC CONTENTS DATA=insurance_claims;
RUN;

/* Summary Statistics */
PROC MEANS DATA=insurance_claims N MEAN STD MIN MAX;
    VAR Customer_Age Premium Claim_Amount Claim_Frequency Policy_Term Vehicle_Age;
RUN;

/* Frequency Distribution */
PROC FREQ DATA=insurance_claims;
    TABLES Accident_Severity Fraud_Flag;
RUN;

/* Fraud Analysis: Grouped Averages */
PROC MEANS DATA=insurance_claims MEAN;
    CLASS Fraud_Flag;
    VAR Claim_Amount Claim_Frequency;
RUN;

/* Linear Regression: Predicting Claim Amount */
PROC REG DATA=insurance_claims;
    MODEL Claim_Amount = Customer_Age Premium Claim_Frequency Vehicle_Age;
RUN;

/* Logistic Regression: Fraud Detection */
PROC LOGISTIC DATA=insurance_claims;
    CLASS Accident_Severity;
    MODEL Fraud_Flag (EVENT='1') = Claim_Amount Claim_Frequency Customer_Age Vehicle_Age / EXPB;
RUN;
