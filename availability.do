// Determining availability

clear
clear matrix
set more off

/* Change current working directory */
cd "/current/working/directory"

/* Read the data into stata -- Using ACS 2011-2013 */
use acs133yr.dta, clear
svyset [pw = pwgtp]


//************************* General Cleaning of Data *************************//


/* Keep the following counties [County, PUMA00&PUMA10 Code]:
	Dutchess, (3202 / 3201)
	Ulster, (3101 / 3102)
	Orange, (3301 / 3302 / 3303)
	Putnam, (3506)
	Columbia, (2500)
*/ 
keep if puma00 == 3202 | puma00 == 3201 | puma00 == 3301 | puma00 == 3101 | ///
		puma00 == 3303 | puma00 == 3506 | puma00 == 2500 | puma00 == 3102 | ///
		puma00 == 3302 | ///
		puma10 == 3202 | puma10 == 3201 | puma10 == 3301 | puma10 == 3101 | ///
		puma10 == 3303 | puma10 == 3506 | puma10 == 2500 | puma10 == 3102 | ///
		puma10 == 3302 
		

// Drop if not between age 18 and 65
drop if age < 18 | age > 65

// Drop if not a citizen 
drop if cit == 5

// Drop if not in the labor force or in military
drop if esr == 5 


//*************************** Generating Variables ***************************//

// Generate county identifiers (0/1)
gen dutchess = puma00 == 3201 | puma00 == 3202 | puma10 == 3201 | puma10 == 3202
gen ulster = puma00 == 3101 | puma10 == 3101 | puma00 == 3102 | puma10 == 3102
gen orange = puma00 == 3301 | puma00 == 3302 | puma00 == 3303 | ///
			 puma10 == 3301 | puma10 == 3302 | puma10 == 3303
gen putnam = puma00 == 3506 | puma10 == 3506
gen columbia = puma00 == 2500 | puma10 == 2500

global counties dutchess ulster orange putnam columbia

// Generate binary variable == 1 if white
gen white = rac1p == 1
gen nonwhite = (white == 0)

// Generate binary variable == 1 if male
gen male = sex == 1
gen female = (male == 0)

// Creating variables indicating whether degree requirements are satisfied (0/1)
	// Group 1
gen degreeG1 = fod1p == 1904 | fod1p == 1901 | fod1p == 2301 | ///
			   fod1p == 5401 | fod1p == 5403 | fod1p == 5404 | ///
			   fod1p == 6103 | fod1p == 6203 | fod1p == 6209 | ///
			   fod2p == 1904 | fod2p == 1901 | fod2p == 2301 | ///
			   fod2p == 5401 | fod2p == 5403 | fod2p == 5404 | ///
			   fod2p == 6103 | fod2p == 6203 | fod2p == 6209
	// Group 2	   
gen degreeG2 = fod1p == 1901 | fod1p == 1904 | fod1p == 2301 | ///
			   fod1p == 5202 | fod1p == 5203 | fod1p == 5206 | ///
			   fod1p == 5401 | fod1p == 5403 | fod1p == 6103 | ///
			   fod1p == 6108 | fod1p == 6203 | ///
			   fod2p == 1901 | fod2p == 1904 | fod2p == 2301 | ///
			   fod2p == 5202 | fod2p == 5203 | fod2p == 5206 | ///
			   fod2p == 5401 | fod2p == 5403 | fod2p == 6103 | ///
			   fod2p == 6108 | fod2p == 6203
	// Group 3
gen degreeG3 = fod1p == 2303 | fod1p == 5202 | fod1p == 5203 | ///
			   fod1p == 5205 | fod1p == 5206 | fod1p == 5299 | ///
			   fod1p == 5403 | fod1p == 5404 | fod1p == 6100 | ///
			   fod1p == 6103 | fod1p == 6104 | fod1p == 6105 | ///
			   fod1p == 6107 | fod1p == 6109 | fod1p == 6110 | ///
			   fod2p == 2303 | fod2p == 5202 | fod2p == 5203 | ///
			   fod2p == 5205 | fod2p == 5206 | fod2p == 5299 | ///
			   fod2p == 5403 | fod2p == 5404 | fod2p == 6100 | ///
			   fod2p == 6103 | fod2p == 6104 | fod2p == 6105 | ///
			   fod2p == 6107 | fod2p == 6109 | fod2p == 6110

// Creating variables indicating whether occupation requirements are met (0/1)
gen occp102 = real(occp10)
gen occp122 = real(occp12)
drop occp10
drop occp12
gen occp10 = occp102
gen occp12 = occp122

	// Group 1
gen occG1 = occp10 == 0010 | occp10 == 0230 | occp10 == 0350 | ///
			occp10 == 0420 | ///
			occp12 == 0010 | occp12 == 0230 | occp12 == 0350 | ///
			occp12 == 0420
	// Group 2		
gen occG2 = occp10 == 0020 | occp10 == 0060 | occp10 == 0100 | ///
			occp10 == 0120 | occp10 == 0126 | occp10 == 0137 | ///
			occp10 == 0350 | occp10 == 0420 | /// 
			occp12 == 0020 | occp12 == 0060 | occp12 == 0100 | ///
			occp12 == 0120 | occp12 == 0126 | occp12 == 0137 | ///
			occp12 == 0350 | occp12 == 0420

	// Group 3 
gen occG3 = occp10 == 2000 | occp10 == 2010 | occp10 == 2015 | ///
			occp10 == 2016 | occp10 == 2025 | occp10 == 3255 | ///
			occp10 == 2500 | occp10 == 2600 | ///
			occp12 == 2000 | occp12 == 2010 | occp12 == 2015 | ///
			occp12 == 2016 | occp12 == 2025 | occp12 == 3255 | ///
			occp12 == 2500 | occp12 == 2600
	// Group 5
gen occG5 = occp10 == 4220 | occp10 == 4230 | occp10 == 4250 | ///
			occp12 == 4220 | occp12 == 4230 | occp12 == 4250 | ///
			occp10 == 3930 | occp12 == 3930

			
//***************************** Group Parameters *****************************//


// // // // // // // // // // // // // // // // // // // // // // // // // // //


//      Group 1: Executive/Senior Level Officials and Managers
//		Criteria: 	- Masters
// 					- Degree in *relevant field* (see notes at bottom)
//					- OR working in *relevant occupation* (see notes)
//					- Age > 35
// 							--> Avg age masters = 32
// 							--> + 3 yrs experience @ higher level = 36
//					
gen group1 = (occG1 == 1 | degreeG1 == 1) & age > 35 & schl > 21


// // // // // // // // // // // // // // // // // // // // // // // // // // //


//  	Group 2: First/Mid-Level Officials and Managers
//		Criteria: 	- Masters
//					- Degree in *relevant field* (see notes)
//					- OR working in *relevant occupation* (see notes)
// 					- Age > 29 (proxy for experience)		
// 							--> Avg age masters = 32, avg age MBA = 28
//							--> Assumed work experience prior to masters/MBA
gen group2 = (occG2 == 1 | degreeG2 == 1) & age > 39 & schl > 21


// // // // // // // // // // // // // // // // // // // // // // // // // // //


//      Group 3a: Professionals (a)
//		Criteria: - Masters
// 				- Degree in *relevant field* (see notes)
//				- OR working in *relevant occupation* (see notes)
//				- Age > 31
// 						--> Avg age masters = 32
// 						--> Assumed work experience prior to masters
//					
gen group3a = (occG3 == 1 | degreeG3 == 1) & age > 31 & schl > 21


//**    Group 3b: Professionals (b)
//		Criteria: - Bachelor's
//				- Degree in *relevant field* (see notes)
//				- OR working in *relevant occupation* (see notes)
//				- And/or MSW, MHC, Masters human services
//				- Age > 24
// 						--> Avg age bachelors = 22
// 						--> + 3 years experience = 25
gen group3b = (occG3 == 1 | degreeG3 == 1) & age > 24 & schl > 20


// // // // // // // // // // // // // // // // // // // // // // // // // // //


//      Group 4: Administrative Support Workers
//		Criteria: - High school grad & Age > 21 (4 yrs experience)
//				- Associates & age > 21 (2 yrs experience)
//				- Bachelors degree (0 yrs experience)
//				- Less than masters degree
gen group4 = ((schl > 15 & age > 21) | (schl > 19 & age > 21) | schl > 20) ///
			 & schl < 23


// // // // // // // // // // // // // // // // // // // // // // // // // // //


//     Group 5: Service Workers
//		Criteria: - High school grad
//				- Age > 21 (4 yrs experience)
//				- Less than bachelor's degree
//				- OR relevant occupation
gen group5 = ((schl > 15 & schl < 21) | occG5 == 1) & age > 21


// // // // // // // // // // // // // // // // // // // // // // // // // // //

global groups group1 group2 group3a group3b group4 group5 

// Group x County 
foreach ggg of varlist $groups {
	foreach ccc of varlist $counties {
		gen `ggg'_`ccc'
	}
}

//************************ Determining Availability **************************//
//		- Take mean of nonwhites and females for each group

 
 foreach ggg of varlist $groups {
	sum `ggg'
	svy, subpop(`ggg'): mean nonwhite
	svy, subpop(`ggg'): mean female
 }
 




/*
//******************************* Notes **************************************//

"Relevant Occupation"

Group 1: Executive/Senior Level Officials and Managers
0010 .MGR-CHIEF EXECUTIVES AND LEGISLATORS
0020 .MGR-GENERAL AND OPERATIONS MANAGERS
0230 .MGR-EDUCATION ADMINISTRATORS
0350 .MGR-MEDICAL AND HEALTH SERVICES MANAGERS
0420 .MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS
			
Group 2: First/Mid-Level Officials and Managers
0020 .MGR-GENERAL AND OPERATIONS MANAGERS
0060 .MGR-PUBLIC RELATIONS AND FUNDRAISING MANAGERS
0100 .MGR-ADMINISTRATIVE SERVICES MANAGERS
0120 .MGR-FINANCIAL MANAGERS
0136 .MGR-HUMAN RESOURCES MANAGERS
0137 .MGR-TRAINING AND DEVELOPMENT MANAGERS
0350 .MGR-MEDICAL AND HEALTH SERVICES MANAGERS
0420 .MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS

			
Group 3: Professionals
2000 .CMS-COUNSELORS
2010 .CMS-SOCIAL WORKERS
2015 .CMS-PROBATION OFFICERS AND CORRECTIONAL TREATMENT SPECIALISTS
2016 .CMS-SOCIAL AND HUMAN SERVICE ASSISTANTS
2025 .CMS-MISCELLANEOUS COMMUNITY AND SOCIAL SERVICE SPECIALISTS,
          INCLUDING HEALTH EDUCATORS AND COMMUNITY HEALTH WORKERS
3255 .MED-REGISTERED NURSES
3500 .MED-LICENSED PRACTICAL AND LICENSED VOCATIONAL NURSES
3600 .HLS-NURSING, PSYCHIATRIC, AND HOME HEALTH AIDES


Group 4: 

			
Group 5:
4220 .CLN-JANITORS AND BUILDING CLEANERS
4230 .CLN-MAIDS AND HOUSEKEEPING CLEANERS
4250 .CLN-GROUNDS MAINTENANCE WORKERS
3930 .PRT-SECURITY GUARDS AND GAMING SURVEILLANCE OFFICERS





"Relevant Degree"

Group 1: Executive/Senior Level Officials and Managers
1904 .ADVERTISING AND PUBLIC RELATIONS
1901 .COMMUNICATIONS
2301 .EDUCATIONAL ADMINISTRATION AND SUPERVISION
5401 .PUBLIC ADMINISTRATION
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION
5404 .SOCIAL WORK
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES
6203 .BUSINESS MANAGEMENT AND ADMINISTRATION
6209 .HUMAN RESOURCES AND PERSONNEL MANAGEMENT

Group 2: First/Mid-Level Officials and Managers
1901 .COMMUNICATIONS
1904 .ADVERTISING AND PUBLIC RELATIONS
2301 .EDUCATIONAL ADMINISTRATION AND SUPERVISION
5202 .CLINICAL PSYCHOLOGY
5203 .COUNSELING PSYCHOLOGY
5206 .SOCIAL PSYCHOLOGY
5401 .PUBLIC ADMINISTRATION
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES
6108 .PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION
6203 .BUSINESS MANAGEMENT AND ADMINISTRATION

Group 3: Professionals
2303 .SCHOOL STUDENT COUNSELING
5202 .CLINICAL PSYCHOLOGY
5203 .COUNSELING PSYCHOLOGY
5205 .INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY
5206 .SOCIAL PSYCHOLOGY
5299 .MISCELLANEOUS PSYCHOLOGY
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION
5404 .SOCIAL WORK
6100 .GENERAL MEDICAL AND HEALTH SERVICES
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES
6104 .MEDICAL ASSISTING SERVICES
6105 .MEDICAL TECHNOLOGIES TECHNICIANS
6107 .NURSING
6109 .TREATMENT THERAPY PROFESSIONS
6110 .COMMUNITY AND PUBLIC HEALTH



*/


