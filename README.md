# Family-Services---Affirmative-Action
Report of EEO-1 information from FSNY.

AAvis.r contains R code to make graphs.

eeo.csv contains EEO-1 information.

affirmative.do contains Stata code to estimate workforce availability.

---
author: Tyler Hamashima, Human Resources Intern

date: February 24th, 2017
---

1: Introduction 
===============

Diversity, no matter the form, is a crucial component of workplace
productivity. Differing thoughts and backgrounds contribute to various
insights and perspectives otherwise untapped. It is therefore necessary
that hiring trends are inspected to ensure that workforce compositions
are optimal and fair. Before continuing, a common misconception of
opposers of affirmative action should be addressed. This is the idea
that affirmative action is unfair on the basis that workers should be
hired purely on skill, and not any characteristic like gender or race.
This view misses the mark on the purpose of affirmative action - it is
not to hire people based on any inherent characteristic, but rather it
is to ensure that a company is not mistakingly executing their hiring
process in a way that, intended or not, promotes biases and leaves out
certain groups.

This analysis examines internal information on Family Services’
employees to see whether their demographics align with those of the
available workers in the area. Both gender and ethnicity are taken into
consideration, and are examined across the different job groups:
Executive, Professionals, Mid-Level, Administrative Support, and Service
Workers. The following sections include the results, concluding
statements, and an appendix containing the methodology.

2: Results 
==========

The following figures and tables show the current state of demographics
of Family Services, both by itself and in relation to the surrounding
areas. The job groups are are defined as follows:

1.  Executive/Senior Level

2.  First/Mid Level

3.  Professionals

4.  Administrative Support

5.  Service Workers

Figure 1 shows the ethnic composition of workers within Family Services.
Figure 2 then takes this one step further and separates by gender, as
well.

![aa_comp_eth](https://cloud.githubusercontent.com/assets/25534898/23561686/41ad9008-000d-11e7-99c7-1d102abe1fa1.png)
![aa_comp_eth_gen](https://cloud.githubusercontent.com/assets/25534898/23561678/39f1f4c6-000d-11e7-8f91-a9f5b904f9c2.png)

Table 1: Placement of Incumbents in Job Groups

￼Job Group|Total Number of Incumbents|Number of Females|Female Inmcumbency|Number of Non-Whites|Non-White Incumbency
---------|----------|----------|----------|----------|----------
￼1 | 8 | 4 | 50.0% | 0 | 0.0% 
2 | 19 | 18 | 94.7% | 3 | 15.8%
3 | 93 | 81 | 87.1% | 26 | 28%
4 | 43 | 42 | 97.7% | 13 | 30.2%
5 | 10 | 3 | 30.0% | 7 | 70.0%

These statistics can also be seen in Table 1, above. While these numbers
are helpful in summarizing the demographics of Family Services, they
alone can not determine whether there is need for affirmative action. To
determine this, the internal demographics need to be compared to the
available workers in the area, for the given job groups. Table 2, below,
shows the 95% confidence interval for both the non-white and female
availability, which is to say that there is a 95% chance that the true
proportion of non-white and female workers in the area fall somewhere
between the lower and upper bounds of this interval. 

Table 2: 95% Confidence Interval for Non-Whites and Females, by Job Group

  **Job Group**  |Non-White Lower|Non-White Upper|Female Lower|Female Upper                  
  ---------------|-------|-------|-------|-------
  1              |7.3%   |15.3%  |50.1%  |61.9%
  2              |7.2%   |16.3%  |43.9%  |57.8%
  3              |9.1%   |18.4%  |75.0%  |85.8%
  4              |12.1%  |13.6%  |50.3%  |52.3%
  5              |13.3%  |15.4%  |16.4%  |26.2%

Figures 4 and 5 visualize the estimates given in Table 2 and the demographics of Family Services workers presented in Table 1.

![aanonwhite](https://cloud.githubusercontent.com/assets/25534898/23561704/5a1e91aa-000d-11e7-9b14-048e7c249060.png)
![aafemale](https://cloud.githubusercontent.com/assets/25534898/23561701/541bd146-000d-11e7-8f3f-680f0584639c.png)

3: Concluding Remarks 
=====================

From Figures 4 and 5 it is easy to see that Family Services surpasses
the expected intervals for each job group, with the exception of the
Executive/Senior Level group. In this category there are zero people of
color and a percentage of women that just falls into the confidence
interval. While this may be cause for a slight concern, given the number
of executives that compose their group, the likelihood of an all white
group is not improbable. If one were to assume that applicants are
chosen randomly out of a group of equally qualified candidates, the
probability of an all white group is between 26% and 56%. Further
analysis may be necessary to investigate potential biases: there is room
to study the demographics of applicants, the callbacks, and the final
hires across positions.

4: Appendix: Methodology 
========================

The data used comes from the FSI and HVMH EEO-1 Reports from 9/30/2016
and the ACS 2011-2013 3-year estimates. Areas assumed for estimated
worker populations include the counties of Dutchess, Ulster, Orange,
Putnam, and Columbia. Individuals were classified as an “available
worker" if they were a citizen, in the workforce, between the ages of 18
and 65, and met the requirements for one of the job groups described
below:\
\
Group 1: Executive/Senior Level Officials and Managers\
Criteria:

-   Master’s degree

-   Degree in relevant fieldOR working in relevant occupation

-   Age greater than 35 (assumes the average age of masters degree is 32
    and they work upon completion, proxy for 3 years of experience)

Group 2: First/Mid-Level Officials and Managers\
Criteria:

-   Master’s degree

-   Degree in relevant fieldOR working in relevant occupation

-   Age greater than 29

Group 3: Professionals\
Criteria:

-   Master’s degree

-   Degree in relevant fieldOR working in relevant occupation

-   Age greater than 31

Group 4: Administrative Support Workers\
Criteria:

-   High school degree or GED or AA and older than 21 OR Bachelor’s
    degree and no minimum age

-   Less than Master’s Degree

Group 5: Service Workers\
Criteria:

-   High school degree or GED

-   Working in relevant occupation

-   Less than a Bachelor’s degree

**Relevant Degree Fields**\
Codes correspond to ACS degree codes\
\
Group 1: Executive/Senior Level Officials and Managers\n
1904 .ADVERTISING AND PUBLIC RELATIONS\n
1901 .COMMUNICATIONS\n
2301 .EDUCATIONAL ADMINISTRATION AND SUPERVISION\n
5401 .PUBLIC ADMINISTRATION\n
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION\n
5404 .SOCIAL WORK\n
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES\n
6203 .BUSINESS MANAGEMENT AND ADMINISTRATION\n
6209 .HUMAN RESOURCES AND PERSONNEL MANAGEMENT\n
\n
Group 2: First/Mid-Level Officials and Managers\n
1901 .COMMUNICATIONS\n
1904 .ADVERTISING AND PUBLIC RELATIONS\n
2301 .EDUCATIONAL ADMINISTRATION AND SUPERVISION\n
5202 .CLINICAL PSYCHOLOGY\n
5203 .COUNSELING PSYCHOLOGY\n
5206 .SOCIAL PSYCHOLOGY\n
5401 .PUBLIC ADMINISTRATION\n
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION\n
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES\n
6108 .PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION\n
6203 .BUSINESS MANAGEMENT AND ADMINISTRATION\n
\n
Group 3: Professionals\n
2303 .SCHOOL STUDENT COUNSELING\n
5202 .CLINICAL PSYCHOLOGY\n
5203 .COUNSELING PSYCHOLOGY\n
5205 .INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY\n
5206 .SOCIAL PSYCHOLOGY\n
5299 .MISCELLANEOUS PSYCHOLOGY\n
5403 .HUMAN SERVICES AND COMMUNITY ORGANIZATION\n
5404 .SOCIAL WORK\n
6100 .GENERAL MEDICAL AND HEALTH SERVICES\n
6103 .HEALTH AND MEDICAL ADMINISTRATIVE SERVICES\n
6104 .MEDICAL ASSISTING SERVICES\n
6105 .MEDICAL TECHNOLOGIES TECHNICIANS\n
6107 .NURSING\n
6109 .TREATMENT THERAPY PROFESSIONS\n
6110 .COMMUNITY AND PUBLIC HEALTH\n
\n
Group 4: Administrative Support Workers\n
N/A\n
\n
Group 5: Service Workers\n
N/A\n
\n
**Relevant Occupations**\n
Codes correspond to ACS occupation codes\n
\n
Group 1: Executive/Senior Level Officials and Managers\n
0010 .MGR-CHIEF EXECUTIVES AND LEGISLATORS\n
0020 .MGR-GENERAL AND OPERATIONS MANAGERS\n
0230 .MGR-EDUCATION ADMINISTRATORS\
0350 .MGR-MEDICAL AND HEALTH SERVICES MANAGERS\
0420 .MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS\
\
Group 2: First/Mid-Level Officials and Managers\
0020 .MGR-GENERAL AND OPERATIONS MANAGERS\
0060 .MGR-PUBLIC RELATIONS AND FUNDRAISING MANAGERS\
0100 .MGR-ADMINISTRATIVE SERVICES MANAGERS\
0120 .MGR-FINANCIAL MANAGERS\
0136 .MGR-HUMAN RESOURCES MANAGERS\
0137 .MGR-TRAINING AND DEVELOPMENT MANAGERS\
0350 .MGR-MEDICAL AND HEALTH SERVICES MANAGERS\
0420 .MGR-SOCIAL AND COMMUNITY SERVICE MANAGERS\
\
Group 3: Professionals\
2000 .CMS-COUNSELORS\
2010 .CMS-SOCIAL WORKERS\
2015 .CMS-PROBATION OFFICERS AND CORRECTIONAL TREATMENT SPECIALISTS\
2016 .CMS-SOCIAL AND HUMAN SERVICE ASSISTANTS\
2025 .CMS-MISCELLANEOUS COMMUNITY AND SOCIAL SERVICE SPECIALISTS\
INCLUDING HEALTH EDUCATORS AND COMMUNITY HEALTH WORKERS\
3255 .MED-REGISTERED NURSES\
3500 .MED-LICENSED PRACTICAL AND LICENSED VOCATIONAL NURSES\
3600 .HLS-NURSING, PSYCHIATRIC, AND HOME HEALTH AIDES\
\
Group 4:\
N/A\
\
Group 5:\
4220 .CLN-JANITORS AND BUILDING CLEANERS\
4230 .CLN-MAIDS AND HOUSEKEEPING CLEANERS\
4250 .CLN-GROUNDS MAINTENANCE WORKERS\
3930 .PRT-SECURITY GUARDS AND GAMING SURVEILLANCE OFFICERS\
\
\
\
Note: For complete Stata and R scripts to replicate this study, please
email .
