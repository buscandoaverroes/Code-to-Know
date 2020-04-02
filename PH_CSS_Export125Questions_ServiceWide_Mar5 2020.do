

*===============================================================================================
use "$data\6. Constructed_Data\PH_CSS_125Questions_DashBoard_Mar5.dta", clear 


* collapse to get averages and number of respondents for the whole sample	
	 
		*gen number of respondents for the whole sample
		foreach  i  in                                                                                                         /// 
		dwh_s1_q1h dwh_s1_q1l dwh_s1_q1l_10 dwh_s2_q1_2 dwh_s2_q1_3 dwh_s2_q1_4 perm_a_s1_q2 perm_a_s1_q3 perm_a_s1_q5                       ///
		 /*transparency and accountability*/ perm_a_s2_q9c perm_a_s2_q9d perm_b_s1_q1 perm_b_s1_q2 perm_b_s1_q3                ///
		perm_b_s1_q4 perm_b_s1_q5_1 perm_b_s1_q7_3 perm_b_s1_q8a perm_b_s1_q8b perm_b_s1_q8c perm_b_s1_q8d                     ///
		perm_b_s1_q8e perm_b_s1_q9_1 perm_b_s1_q9_2 perm_b_s1_q9_3 perm_b_s1_q9_4 perm_b_s2_q4                                 ///
		perm_b_s2_q5 perm_b_s2_q6 perm_b_s2_q7_1 perm_b_s2_q7_2 perm_b_s2_q7_3 perm_b_s2_q8_1 perm_b_s2_q8_2                   /// 
		perm_b_s2_q8_3 perm_b_s2_q8_4 perm_b_s2_q10a perm_b_s2_q10b perm_b_s2_q10c perm_b_s2_q10e perm_b_s2_q10f               ///
		perm_b_s2_q10g perm_b_s3_q2_1 perm_b_s4_q1 perm_b_s4_q2 perm_b_s4_q7 ras_s1_q1_1                        ///
		ras_s1_q1_2 ras_s1_q2_1 ras_s1_q3_3 ras_s1_q3_6 ras_s1_q3_8 /*direct elicitation*/ mot_s1_q1 mot_s1_q3                 ///
		/* Current position and intended arc of career */ mot_s3_q1 mot_s3_q2_1 mot_s3_q7 mot_s3_q11 mot_s3_q12_1              ///
		mot_s3_q12_3 mot_s3_q12_5 mot_s3_q12_6 mot_s3_q12_7 /*environment, social norms and the narrative*/ mot_s4_q2          ///
		mot_s4_q3 mot_s4_q4 mot_s4_q6 mot_s4_q7 mot_s4_q8 /* innovative environment */ mot_s5_q1a mot_s5_q1b                   ///
		mot_s5_q1c mot_s5_q1d mot_s5_q1e /*General bottlenecks*/ tub_s3_q1_2 tub_s3_q1_3 tub_s3_q1_4 tub_s3_q1_5               ///
		tub_s3_q1_6 tub_s3_q1_7 tub_s3_q1_8 tub_s3_q1_10 tub_s3_q1_11 tub_s3_q1_13 tub_s3_q2 tub_s3_q3a tub_s3_q3e             ///
		tub_s3_q3f tub_s3_q3g tub_s3_q3h tub_s3_q3i /* Skills */ ska_s1_q1a ska_s1_q1b ska_s1_q1c ska_s1_q1d 				   ///
		ska_s1_q2 /*Capacity building */ ska_s2_q4_1 ska_s2_q0 ska_s2_q5a ska_s2_q5b ska_s2_q5c ska_s2_q5d      			   ///
		ska_s2_q5g ska_s2_q8 ska_s2_q12b ska_s2_q13a ska_s2_q13b /*source of information*/ inf_s1_q2b /*info      		       ///
		& communication bottlenecks */ inf_s2_q1c inf_s2_q1d inf_s2_q1e /*Political interference*/ int_s2_q7          		   ///
		/*PBB*/ ref_s2_1_q1a ref_s2_1_q1b ref_s2_1_q1c ref_s2_1_q1d ref_s2_2_q1b ref_s2_2_q1e ref_s2_2_q1g                     /// 
		ref_s2_2_q1h /* Perceptions and experiences  */ eth_s1_q1_3 eth_s1_q3 eth_s2_q1a eth_s2_q1b eth_s2_q1c    {
		
		
		count    if m_`i'!=.
		egen     obvs`i'  = count(m_`i')
		rename   m_`i'    agree`i'
		}
		
		collapse (mean)  agreedwh_s1_q1h agreedwh_s1_q1l agreedwh_s1_q1l_10 agreeperm_a_s1_q2 agreeperm_a_s1_q3 agreeperm_a_s1_q5 agreeperm_a_s2_q9c ///  taking averages 
		agreeperm_a_s2_q9d agreeperm_b_s1_q1 agreeperm_b_s1_q2 agreeperm_b_s1_q3 agreeperm_b_s1_q4 agreeperm_b_s2_q4              ///
		agreeperm_b_s2_q5 agreeperm_b_s2_q6 agreeperm_b_s2_q10a agreeperm_b_s2_q10b agreeperm_b_s2_q10c agreeperm_b_s2_q10e       ///
		agreeperm_b_s2_q10f agreeperm_b_s2_q10g agreeperm_b_s4_q1 agreeperm_b_s4_q2 agreeperm_b_s4_q7 agreemot_s1_q1              ///
		agreemot_s1_q3 agreemot_s3_q1 agreemot_s3_q2_1 agreemot_s3_q7 agreemot_s3_q11 agreemot_s4_q2 agreemot_s4_q3               ///
		agreemot_s4_q4 agreemot_s4_q6 agreemot_s4_q7 agreemot_s4_q8 agreemot_s5_q1a agreemot_s5_q1b agreemot_s5_q1c               ///
		agreemot_s5_q1d agreemot_s5_q1e agreetub_s3_q1_2 agreetub_s3_q1_3 agreetub_s3_q1_4 agreetub_s3_q1_5 agreetub_s3_q1_6      ///
		agreetub_s3_q1_7 agreetub_s3_q1_8 agreetub_s3_q1_10 agreetub_s3_q1_11 agreetub_s3_q1_13 agreetub_s3_q2 agreetub_s3_q3a agreetub_s3_q3e     ///
		agreetub_s3_q3f agreetub_s3_q3g agreetub_s3_q3h agreetub_s3_q3i agreeska_s1_q1a agreeska_s1_q1b agreeska_s1_q1c           ///
		agreeska_s1_q1d agreeska_s1_q2 agreeska_s2_q5a agreeska_s2_q5b agreeska_s2_q5c agreeska_s2_q5d agreeska_s2_q5g            ///
		agreeska_s2_q8 agreeska_s2_q12b agreeska_s2_q13a agreeska_s2_q13b agreeinf_s1_q2b agreeinf_s2_q1c agreeinf_s2_q1d         ///
		agreeinf_s2_q1e agreeint_s2_q7 agreeref_s2_1_q1a agreeref_s2_1_q1b agreeref_s2_1_q1c agreeref_s2_1_q1d agreeref_s2_2_q1b  ///
		agreeref_s2_2_q1e agreeref_s2_2_q1g agreeref_s2_2_q1h agreeeth_s1_q3 agreeeth_s2_q1a agreeeth_s2_q1b agreeeth_s2_q1c      ///
		agreeperm_b_s1_q5_1 agreeperm_b_s1_q8a agreeperm_b_s1_q8b agreeperm_b_s1_q8c agreeperm_b_s1_q8d                           ///
		agreeperm_b_s1_q8e agreeperm_b_s1_q9_1 agreeperm_b_s1_q9_2 agreeperm_b_s1_q9_3 agreeperm_b_s1_q9_4 agreeperm_b_s2_q7_1    ///
		agreeperm_b_s2_q7_2 agreeperm_b_s2_q7_3 agreeperm_b_s2_q8_1 agreeperm_b_s2_q8_2 agreeperm_b_s2_q8_3 agreeperm_b_s2_q8_4   ///
		agreeperm_b_s3_q2_1 agreeras_s1_q2_1 agreeska_s2_q4_1 agreemot_s3_q12_3 agreemot_s3_q12_5 agreemot_s3_q12_6               ///
		agreemot_s3_q12_7 agreemot_s3_q12_1 agreedwh_s2_q1_2 agreedwh_s2_q1_3 agreedwh_s2_q1_4 agreeperm_b_s1_q7_3                ///
		 agreeras_s1_q1_1 agreeras_s1_q1_2 agreeras_s1_q3_3 agreeras_s1_q3_6 agreeras_s1_q3_8 agreeska_s2_q0   ///
		agreeeth_s1_q1_3                                                                                                          ///
		(first) obvsdwh_s1_q1h obvsdwh_s1_q1l obvsdwh_s1_q1l_10 obvsdwh_s2_q1_2 obvsdwh_s2_q1_3 obvsdwh_s2_q1_4 obvseth_s1_q1_3 obvseth_s1_q3       ///  taking numbers of respondents 
		obvseth_s2_q1a obvseth_s2_q1b obvseth_s2_q1c obvsinf_s1_q2b obvsinf_s2_q1c obvsinf_s2_q1d obvsinf_s2_q1e obvsint_s2_q7    ///
		obvsmot_s1_q1 obvsmot_s1_q3 obvsmot_s3_q1 obvsmot_s3_q11 obvsmot_s3_q12_1 obvsmot_s3_q12_3 obvsmot_s3_q12_5               ///
		obvsmot_s3_q12_6 obvsmot_s3_q12_7 obvsmot_s3_q2_1 obvsmot_s3_q7 obvsmot_s4_q2 obvsmot_s4_q3 obvsmot_s4_q4 obvsmot_s4_q6   ///
		obvsmot_s4_q7 obvsmot_s4_q8 obvsmot_s5_q1a obvsmot_s5_q1b obvsmot_s5_q1c obvsmot_s5_q1d obvsmot_s5_q1e obvsperm_a_s1_q2   ///
		obvsperm_a_s1_q3 obvsperm_a_s1_q5 obvsperm_a_s2_q9c obvsperm_a_s2_q9d obvsperm_b_s1_q1 obvsperm_b_s1_q2 obvsperm_b_s1_q3  ///
		obvsperm_b_s1_q4 obvsperm_b_s1_q5_1 obvsperm_b_s1_q7_3 obvsperm_b_s1_q8a obvsperm_b_s1_q8b obvsperm_b_s1_q8c              ///
		obvsperm_b_s1_q8d obvsperm_b_s1_q8e obvsperm_b_s1_q9_1 obvsperm_b_s1_q9_2 obvsperm_b_s1_q9_3                              ///
		obvsperm_b_s1_q9_4 obvsperm_b_s2_q10a obvsperm_b_s2_q10b obvsperm_b_s2_q10c obvsperm_b_s2_q10e obvsperm_b_s2_q10f         ///
		obvsperm_b_s2_q10g obvsperm_b_s2_q4 obvsperm_b_s2_q5 obvsperm_b_s2_q6 obvsperm_b_s2_q7_1 obvsperm_b_s2_q7_2               ///
		obvsperm_b_s2_q7_3 obvsperm_b_s2_q8_1 obvsperm_b_s2_q8_2 obvsperm_b_s2_q8_3 obvsperm_b_s2_q8_4 obvsperm_b_s3_q2_1         ///
		obvsperm_b_s4_q1 obvsperm_b_s4_q2  obvsperm_b_s4_q7 obvsras_s1_q1_1 obvsras_s1_q1_2 obvsras_s1_q2_1     ///
		obvsras_s1_q3_3 obvsras_s1_q3_6 obvsras_s1_q3_8 obvsref_s2_1_q1a obvsref_s2_1_q1b obvsref_s2_1_q1c obvsref_s2_1_q1d       ///
		obvsref_s2_2_q1b obvsref_s2_2_q1e obvsref_s2_2_q1g obvsref_s2_2_q1h obvsska_s1_q1a obvsska_s1_q1b obvsska_s1_q1c          ///
		obvsska_s1_q1d obvsska_s1_q2 obvsska_s2_q0 obvsska_s2_q12b obvsska_s2_q13a obvsska_s2_q13b obvsska_s2_q4_1 obvsska_s2_q5a ///
		obvsska_s2_q5b obvsska_s2_q5c obvsska_s2_q5d obvsska_s2_q5g obvsska_s2_q8 obvstub_s3_q1_10 obvstub_s3_q1_11               ///
		obvstub_s3_q1_13 obvstub_s3_q1_2 obvstub_s3_q1_3 obvstub_s3_q1_4 obvstub_s3_q1_5 obvstub_s3_q1_6 obvstub_s3_q1_7          ///
		obvstub_s3_q1_8  obvstub_s3_q2 obvstub_s3_q3a obvstub_s3_q3e obvstub_s3_q3f obvstub_s3_q3g obvstub_s3_q3h obvstub_s3_q3i
		gen dpt_full = 0
		tempfile sample_avg
		
		save "$data\6. Constructed_Data\PH_CSS_DashBoard_ServiceAVG_Mar5.dta", replace 
  

		reshape long agree obvs, i(dpt_full) j(VarName, string)         // reshape to long data format   
		replace agree  =   round(agree,1)                               // round to the nearest integer 
		
	*9.1. label variables 
		label var agree    "% of respondents agreed to the question"    
		label var obvs     "number of respondents answered the question"
		label var VarName  "Variable name shown in the survey"

	*9.2. generate question text 
		gen  	  QuestionText = "What is your age?" if VarName == "dwh_s1_q1h"
		replace   QuestionText = "How many years have you been in the civil service?" if VarName == "dwh_s1_q1l"
		
		replace   QuestionText = "Percentage of the civil service are recent recruits (less than 10 years in the service)" if VarName == "dwh_s1_q1l_10"
		replace   QuestionText = "Hold bachelor's degree" if VarName == "dwh_s2_q1_2"
		replace   QuestionText = "Hold master's degree" if VarName == "dwh_s2_q1_3"
		replace   QuestionText = "Hold Ph.D." if VarName == "dwh_s2_q1_4"
		replace   QuestionText = "Not right to ask or accept gifts in exchange for favor" if VarName == "eth_s1_q1_3"
		replace   QuestionText = "It is acceptable to report a colleague you think is not behaving ethically" if VarName == "eth_s1_q3"
		replace   QuestionText = "Petty corruption does not have an impact on my ability to effectively perform" if VarName == "eth_s2_q1a"
		replace   QuestionText = "Petty corruption does not have an impact on the ability of the division to effectively deliver services" if VarName == "eth_s2_q1b"
		replace   QuestionText = "My division does not have a practice of collecting informal fees" if VarName == "eth_s2_q1c"
		replace   QuestionText = "I possess the necessary skills to make best use of the technology that is available to me" if VarName == "inf_s1_q2b"
		replace   QuestionText = "Information regarding the state of operations and services in the jurisdiction makes it easier for me to know where to allocate my effort/time" if VarName == "inf_s2_q1c"
		replace   QuestionText = "Information is gathered and aggregated in an accessible way" if VarName == "inf_s2_q1d"
		replace   QuestionText = "Information flows effectively between individuals in the same organization" if VarName == "inf_s2_q1e"
		replace   QuestionText = "Employees within your division generally feel their Ministers trust and respect them" if VarName == "int_s2_q7"
		replace   QuestionText = "Satisfed with civil service experience" if VarName == "mot_s1_q1"
		replace   QuestionText = "Average levels of motivation compared to when they first entered the service" if VarName == "mot_s1_q3"
		replace   QuestionText = "Confident or very confident in the promotion system" if VarName == "mot_s3_q1"
		replace   QuestionText = "Working in the public sector is better than working in the private sector" if VarName == "mot_s3_q11"
		replace   QuestionText = "Salary is an advantage of working in the public sector compared to the private sector" if VarName == "mot_s3_q12_1"
		replace   QuestionText = "Career opportunity is an advantage of working in the public sector compared to the private sector" if VarName == "mot_s3_q12_3"
		replace   QuestionText = "Reasonable workload is an advantage of working in the public sector compared to the private sector" if VarName == "mot_s3_q12_5"
		replace   QuestionText = "Good work hours is an advantage of working in the public sector compared to the private sector" if VarName == "mot_s3_q12_6"
		replace   QuestionText = "Prestige is an advantage of working in the public sector compared to the private sector" if VarName == "mot_s3_q12_7"
		replace   QuestionText = "Promotion decisions are based on merit and education background" if VarName == "mot_s3_q2_1"
		replace   QuestionText = "In the next two years would you want to stay on the job" if VarName == "mot_s3_q7"
				
		replace   QuestionText = "Department's mission is relatively or strongly aligned to one's personal mission" if VarName == "mot_s4_q2"
		replace   QuestionText = "Division's mission is relatively or strongly aligned to one's personal mission" if VarName == "mot_s4_q3"
		replace   QuestionText = "Tasks and activities are aligned with one's personal mission regularly or daily" if VarName == "mot_s4_q4"
		replace   QuestionText = "The percentage of tasks/projects  your division fulfils its mission" if VarName == "mot_s4_q6"
		replace   QuestionText = "The percentage of tasks/projects your Department fulfil its mission" if VarName == "mot_s4_q7"
		replace   QuestionText = "The civil service is performing well or very well in terms of the mission you see for it" if VarName == "mot_s4_q8"
		replace   QuestionText = "Creativity and innovation are rewarded in my organization" if VarName == "mot_s5_q1a"
		replace   QuestionText = "I am encouraged to be innovative or to take initiative in my work" if VarName == "mot_s5_q1b"
		replace   QuestionText = "My immediate supervisor encourages innovation" if VarName == "mot_s5_q1c"
		replace   QuestionText = "People in the Division are always searching for new ways of looking at problems" if VarName == "mot_s5_q1d"
		replace   QuestionText = "The Division is very flexible: it can quickly change procedures to meet new conditions and solve problems as they arise" if VarName == "mot_s5_q1e"
		replace   QuestionText = "Your organization has well-defined performance goals" if VarName == "perm_a_s1_q2"
		replace   QuestionText = "You are involved in the performance review for your division" if VarName == "perm_a_s1_q3"
		replace   QuestionText = "You fully understand your role in the context of your division’s objectives" if VarName == "perm_a_s1_q5"
		replace   QuestionText = "Policies/guidelines/regulations of your division do not require an excessive number of administrative steps" if VarName == "perm_a_s2_q9c"
		replace   QuestionText = "Policies/guidelines/regulations of your division are well supervised (managers make sure that the rules are followed)" if VarName == "perm_a_s2_q9d"
		replace   QuestionText = "My performance have been formally evaluated during the last two years" if VarName == "perm_b_s1_q1"
		replace   QuestionText = "My performance objectives have been set and discussed with me before my last performance evaluation" if VarName == "perm_b_s1_q2"
		replace   QuestionText = "My superior discussed the results of my last performance evaluation with me after filling in my performance evaluation report" if VarName == "perm_b_s1_q3"
		replace   QuestionText = "My superior discussed with me my performance informally at other occasions throughout the year" if VarName == "perm_b_s1_q4"
		replace   QuestionText = "HR division members informally discussed your performance with you and provided feedback and advice on improving your performance" if VarName == "perm_b_s1_q5_1"
		replace   QuestionText = "Performance rating accurately reflected my performance" if VarName == "perm_b_s1_q7_3"
		replace   QuestionText = "My performance evaluation results been used to help me keep track of my performance" if VarName == "perm_b_s1_q9_1"
		replace   QuestionText = "The annual performance appraisal process identifies individuals that do not contribute" if VarName == "perm_b_s1_q8a"
		replace   QuestionText = "The rating process for individual PBB is transparent" if VarName == "perm_b_s1_q8b"
		replace   QuestionText = "Management and staff in your division are working together to set clear, achievable targets" if VarName == "perm_b_s1_q8c"
		replace   QuestionText = "You had direct input in defining your own performance goals" if VarName == "perm_b_s1_q8d"
		replace   QuestionText = "You know the individual performance targets of others at your level" if VarName == "perm_b_s1_q8e"				
		replace   QuestionText = "My performance evaluation results been used to help me improve performance" if VarName == "perm_b_s1_q9_2"
		
		replace   QuestionText = "My performance evaluation results been used to assess what type of trainings I should receive" if VarName == "perm_b_s1_q9_3"		
		replace   QuestionText = "My performance evaluation results been used to motivate me to work hard" if VarName == "perm_b_s1_q9_4"		
		replace   QuestionText = "The introduction of SPMS has led to the establishment of goals that are aligned to agency mandate and organizational priorities" if VarName == "perm_b_s2_q10a"
		replace   QuestionText = "The introduction of SPMS has established a system that's outcome-oriented" if VarName == "perm_b_s2_q10b"		
		replace   QuestionText = "The introduction of SPMS has resulted in a team-based approach to performance management" if VarName == "perm_b_s2_q10c"		
		replace   QuestionText = "The introduction of SPMS has shown alignment of individual and organizational goals" if VarName == "perm_b_s2_q10e"
		replace   QuestionText = "The introduction of SPMS has provided information systems that support monitoring and evaluation" if VarName == "perm_b_s2_q10f"
		replace   QuestionText = "The introduction of SPMS has provided a good communication plan" if VarName == "perm_b_s2_q10g"
		replace   QuestionText = "Tasks are cascaded from the SPMS’s organization-level objectives" if VarName == "perm_b_s2_q4"
		replace   QuestionText = "Evaluations are conducted based on the SPMS indicators and targets" if VarName == "perm_b_s2_q5"
		replace   QuestionText = "You have clear guidance on rewards based on your SPMS evaluation results" if VarName == "perm_b_s2_q6"
		replace   QuestionText = "Your organization rewards employees who receive very good SPMS evaluation results with financial incentives" if VarName == "perm_b_s2_q7_1"
		replace   QuestionText = "Your organization rewards employees who receive very good SPMS evaluation results with travel opportunities" if VarName == "perm_b_s2_q7_2"
		replace   QuestionText = "Your organization rewards employees who receive very good SPMS evaluation results with training opportunities" if VarName == "perm_b_s2_q7_3"
		replace   QuestionText = "Your organization provide employees who receive very bad SPMS evaluation results with trainings" if VarName == "perm_b_s2_q8_1"
		replace   QuestionText = "Your organization warns employees who receive very bad SPMS evaluation results" if VarName == "perm_b_s2_q8_2"
		replace   QuestionText = "Your organization dismisses employees who receive very bad SPMS evaluation results" if VarName == "perm_b_s2_q8_3"
		replace   QuestionText = "Your organization relocates employees who receive very bad SPMS evaluation results" if VarName == "perm_b_s2_q8_4"
		replace   QuestionText = "Rewards are given based on job performance" if VarName == "perm_b_s3_q2_1"
		replace   QuestionText = "The reward system is fair" if VarName == "perm_b_s4_q1"
		replace   QuestionText = "The incentive system improves the performance of your colleagues" if VarName == "perm_b_s4_q2"

		replace   QuestionText = "Rewards in the department are justified" if VarName == "perm_b_s4_q7"
		replace   QuestionText = "You hear about the job from adverts on radio, newspaper, TV, and job board" if VarName == "ras_s1_q1_1"
		replace   QuestionText = "You hear about the job from adverts on internet" if VarName == "ras_s1_q1_2"
		replace   QuestionText = "I have been through a formal selection process" if VarName == "ras_s1_q2_1"
		replace   QuestionText = "I am attracted to the job because I want to serve the public" if VarName == "ras_s1_q3_3"
		replace   QuestionText = "I am attracted to the job because it provides future career ambitions" if VarName == "ras_s1_q3_6"
		replace   QuestionText = "I am attracted to the job because it challenges me" if VarName == "ras_s1_q3_8"
		replace   QuestionText = "The PBB system is a good idea overall" if VarName == "ref_s2_1_q1a"
		replace   QuestionText = "PBB has led others of the same level in your Division to contribute more than is expected of them on their jobs." if VarName == "ref_s2_1_q1b"
		replace   QuestionText = "PBB rewards go to those who work hard to further the goals of the Division" if VarName == "ref_s2_1_q1c"
		replace   QuestionText = "The bonuses associated with the PBB system are a substantial component of your compensation" if VarName == "ref_s2_1_q1d"
		replace   QuestionText = "Since the introduction of PBB, the pay system has become fair" if VarName == "ref_s2_2_q1b"
		replace   QuestionText = "Since the introduction of PBB, you have been more likely to trust people in your division" if VarName == "ref_s2_2_q1e"
		replace   QuestionText = "Since the introduction of PBB, the performance appraisal process has significantly improved" if VarName == "ref_s2_2_q1g"
		replace   QuestionText = "Since the introduction of PBB, the staff in your division has been working together better to achieve targets for your division" if VarName == "ref_s2_2_q1h"
		replace   QuestionText = "Since the introduction of PBB, the staff in your division has been working together better to achieve targets for your division" if VarName == "ref_s2_2_q1h"
		replace   QuestionText = "My professional skills and capabilities have improved since joining the public service" if VarName == "ska_s1_q1a"
		replace   QuestionText = "I am given a real opportunity to improve my skills in my Division" if VarName == "ska_s1_q1b"
		replace   QuestionText = "The skill level in my work division has improved in the last 12 months" if VarName == "ska_s1_q1c"
		replace   QuestionText = "Staff in this Division has the job–relevant knowledge and skills necessary to accomplish the Division’s goals" if VarName == "ska_s1_q1d"
		replace   QuestionText = "I received training in the last 12 months" if VarName == "ska_s2_q0"
		replace   QuestionText = "Training opportunities are based on merit" if VarName == "ska_s2_q12b"
		replace   QuestionText = "In the last 12 months in your division training programmes contributed to the achievement of objectives" if VarName == "ska_s2_q13a"
		replace   QuestionText = "In the last 12 months professional development and capacity-building are promoted among employees" if VarName == "ska_s2_q13b"
		replace   QuestionText = "HR identies my training needs" if VarName == "ska_s2_q4_1"
		replace   QuestionText = "Training is relevant for the work civil servants do" if VarName == "ska_s2_q5a"
		replace   QuestionText = "Trainings are adequately provided" if VarName == "ska_s2_q5b"
		replace   QuestionText = "Trainings provide adequate management skills" if VarName == "ska_s2_q5c"
		replace   QuestionText = "Trainings are not general" if VarName == "ska_s2_q5d"
		replace   QuestionText = "Trainings match the specific needs of my job" if VarName == "ska_s2_q5g"
		replace   QuestionText = "Training needs are adequately assessed and addressed" if VarName == "ska_s2_q8"
		replace   QuestionText = "Guidelines/rules/proclamations are adequate for me to perform my task effectively" if VarName == "tub_s3_q1_10"
		replace   QuestionText = "Corruption in my organization is not an obstacle to me performing my task effectively" if VarName == "tub_s3_q1_11"
		replace   QuestionText = "I can get required inputs from other in a timely manner" if VarName == "tub_s3_q1_13"
		replace   QuestionText = "Last-minute requests are not an obstacle to me performing my tasks effectively" if VarName == "tub_s3_q1_2"
		replace   QuestionText = "Schedule conflict is not an obstacle to me performing my tasks effectively" if VarName == "tub_s3_q1_3"
		replace   QuestionText = "Leadership in my organization is adequate for me to perform my tasks effectively" if VarName == "tub_s3_q1_4"
		replace   QuestionText = "My tasks have deadlines so I know what I am supposed to do" if VarName == "tub_s3_q1_5"
		replace   QuestionText = "Communication on the team is not an obstacle to me performing my tasks effectively" if VarName == "tub_s3_q1_6"
		replace   QuestionText = "I am motivated to perform my tasks effectively" if VarName == "tub_s3_q1_8"
		replace   QuestionText = "I have the right skills to perform my tasks effectively" if VarName == "tub_s3_q1_7"
		replace   QuestionText = "Percentage of time is used for main tasks" if VarName == "tub_s3_q2"
		replace   QuestionText = "I have sufficient knowledge to effectively perform my tasks" if VarName == "tub_s3_q3a"
		replace   QuestionText = "I have sufficient knowledge to effectively perform my tasks" if VarName == "tub_s3_q3a"
		replace   QuestionText = "Rules and regulations are not very complex" if VarName == "tub_s3_q3e"
		replace   QuestionText = "A civil servant can't interpret the rules and regulations in his or her own way" if VarName == "tub_s3_q3f"
		replace   QuestionText = "I am not afraid of making a decision" if VarName == "tub_s3_q3g"
		replace   QuestionText = "My training was sufficiently strong on theoretical aspects" if VarName == "tub_s3_q3h"
		replace   QuestionText = "My training was sufficiently strong on practical aspects" if VarName == "tub_s3_q3i"
		replace   QuestionText = "I am satisfied with the training I receive for my present job" if VarName == "ska_s1_q2"

	
	*9.3. reorder variables, set uppercase, change "_" to ".", and export to excel dashboard 
		drop dpt_full
		order VarName QuestionText obvs agree
		replace VarName = upper(VarName)
		replace VarName = subinstr(VarName, "_", ".", .) 
		save "$data\6. Constructed_Data\PH_CSS_Export125Questions_DashBoard_ServiceWide_Mar5.dta", replace 
		export excel using "$data\5. Dashboard\ART_PROTOTYPE Philippines_4MAR 2020_UNLOCKED.xlsx", sheet("ServiceWide") cell(A3) sheetmodify 

