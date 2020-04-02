	
* HIIII
*===============================================================================================
*2019 data 
	use "$data\3. Clean\Philippines_CSS_data_CLEAN_30 Dec.dta", clear 
	
		local keepvars = "m_dwh_s1_q1h m_dwh_s1_q1l m_dwh_s1_q1l_10 m_dwh_s2_q1_2 m_dwh_s2_q1_3 m_dwh_s2_q1_4 m_perm_a_s1_q2 m_perm_a_s1_q3 m_perm_a_s1_q5 m_perm_a_s2_q9c m_perm_a_s2_q9d m_perm_b_s1_q1 m_perm_b_s1_q2 m_perm_b_s1_q3       m_perm_b_s1_q4 m_perm_b_s1_q5_1 m_perm_b_s1_q7_3 m_perm_b_s1_q8a m_perm_b_s1_q8b m_perm_b_s1_q8c m_perm_b_s1_q8d        
		m_perm_b_s1_q8e m_perm_b_s1_q9_1 m_perm_b_s1_q9_2 m_perm_b_s1_q9_3 m_perm_b_s1_q9_4 m_perm_b_s2_q4                      
		m_perm_b_s2_q5 m_perm_b_s2_q6 m_perm_b_s2_q7_1 m_perm_b_s2_q7_2 m_perm_b_s2_q7_3 m_perm_b_s2_q8_1 m_perm_b_s2_q8_2       
		m_perm_b_s2_q8_3 m_perm_b_s2_q8_4 m_perm_b_s2_q10a m_perm_b_s2_q10b m_perm_b_s2_q10c m_perm_b_s2_q10e m_perm_b_s2_q10f  
		m_perm_b_s2_q10g m_perm_b_s3_q2_1 m_perm_b_s4_q1 m_perm_b_s4_q2 m_perm_b_s4_q7 m_ras_s1_q1_1           
		m_ras_s1_q1_2 m_ras_s1_q2_1 m_ras_s1_q3_3 m_ras_s1_q3_6 m_ras_s1_q3_8 /*direct elicitation*/ m_mot_s1_q1 m_mot_s1_q3    
		/* Current position and intended arc of career */ m_mot_s3_q1 m_mot_s3_q2_1 m_mot_s3_q7 m_mot_s3_q11 m_mot_s3_q12_1     
		m_mot_s3_q12_3 m_mot_s3_q12_5 m_mot_s3_q12_6 m_mot_s3_q12_7 /*environment, social norms and the narrative*/ m_mot_s4_q2 
		m_mot_s4_q3 m_mot_s4_q4 m_mot_s4_q6 m_mot_s4_q7 m_mot_s4_q8 /* innovative environment */ m_mot_s5_q1a m_mot_s5_q1b      
		m_mot_s5_q1c m_mot_s5_q1d m_mot_s5_q1e /*General bottlenecks*/ m_tub_s3_q1_2 m_tub_s3_q1_3 m_tub_s3_q1_4 m_tub_s3_q1_5  
		m_tub_s3_q1_6 m_tub_s3_q1_7 m_tub_s3_q1_8 m_tub_s3_q1_10 m_tub_s3_q1_11 m_tub_s3_q1_13 m_tub_s3_q2 m_tub_s3_q3a m_tub_s3_q3e           
		m_tub_s3_q3f m_tub_s3_q3g m_tub_s3_q3h m_tub_s3_q3i /* Skills */ m_ska_s1_q1a m_ska_s1_q1b m_ska_s1_q1c m_ska_s1_q1d    
		m_ska_s1_q2 /*Capacity building */ m_ska_s2_q4_1 m_ska_s2_q0 m_ska_s2_q5a m_ska_s2_q5b m_ska_s2_q5c m_ska_s2_q5d        
		m_ska_s2_q5g m_ska_s2_q8 m_ska_s2_q12b m_ska_s2_q13a m_ska_s2_q13b /*source of information*/ m_inf_s1_q2b /*info        
		& communication bottlenecks */ m_inf_s2_q1c m_inf_s2_q1d m_inf_s2_q1e /*Political interference*/ m_int_s2_q7            
		/*PBB*/ m_ref_s2_1_q1a m_ref_s2_1_q1b m_ref_s2_1_q1c m_ref_s2_1_q1d m_ref_s2_2_q1b m_ref_s2_2_q1e m_ref_s2_2_q1g         
		m_ref_s2_2_q1h /* Perceptions and experiences  */ m_eth_s1_q1_3 m_eth_s1_q3 m_eth_s2_q1a m_eth_s2_q1b m_eth_s2_q1c      
		m_piq_qii"
		
		levelsof `keepvars', clean // this does the list without puncutations
		local correct_n_vars = r(r)
		
	
	
*1. select all key questions. This serves as the raw data for cell reference in the dashboard
		*1.1 demographics 
		*Education background
		recode m_dwh_s2_q1 (4 5 = 5) 
		tab m_dwh_s2_q1, gen(m_dwh_s2_q1_)
		recode m_dwh_s2_q1_2 m_dwh_s2_q1_3 m_dwh_s2_q1_4 (1=100)
		label var m_dwh_s2_q1_2 "hold bachelor's degree"
		label var m_dwh_s2_q1_3 "hold master's degree"
		label var m_dwh_s2_q1_4 "hold Ph.D."
				
		gen m_dwh_s1_q1l_10       = . 
		replace m_dwh_s1_q1l_10   = 100 if m_dwh_s1_q1l<=10
		replace m_dwh_s1_q1l_10   = 0 if m_dwh_s1_q1l>10&m_dwh_s1_q1l~=.
		label var m_dwh_s1_q1l_10 "Civil service are recent recruits (less than 10 years in the service)"
		*keep m_dwh_s1_q1h m_dwh_s1_q1l m_dwh_s1_q1l_10 m_dwh_s2_q1_2 m_dwh_s2_q1_3 m_dwh_s2_q1_4
		
		*1.2 PERM.A.1 organizational planning and performance
		*keep m_perm_a_s1_q2 m_perm_a_s1_q3 m_perm_a_s1_q5
		
		*1.3 PERM.A.2 transparency and accountability 
		*keep m_perm_a_s2_q9c m_perm_a_s2_q9d
		
		*1.4 PERM.B.1 individual performance appraisal 
		tab m_perm_b_s1_q7, gen(m_perm_b_s1_q7_)
		recode m_perm_b_s1_q7_3 (1=100)
		*keep m_perm_b_s1_q1 m_perm_b_s1_q2 m_perm_b_s1_q3 m_perm_b_s1_q4 m_perm_b_s1_q5_1 m_perm_b_s1_q7_3 m_perm_b_s1_q8a   ///
		*m_perm_b_s1_q8b m_perm_b_s1_q8c m_perm_b_s1_q8d m_perm_b_s1_q8e m_perm_b_s1_q9_1 m_perm_b_s1_q9_2 m_perm_b_s1_q9_3   ///
		*m_perm_b_s1_q9_4
		
		*1.5 PERM.B.2 SPMS 
		*keep m_perm_b_s2_q4 m_perm_b_s2_q5 m_perm_b_s2_q6 m_perm_b_s2_q7_1 m_perm_b_s2_q7_2 m_perm_b_s2_q7_3 m_perm_b_s2_q8_1 ///
		*m_perm_b_s2_q8_2 m_perm_b_s2_q8_3 m_perm_b_s2_q8_4 m_perm_b_s2_q10a m_perm_b_s2_q10b m_perm_b_s2_q10c m_perm_b_s2_q10e///
		*m_perm_b_s2_q10f m_perm_b_s2_q10g
		
		*1.6 PERM.B.3 Recognition and incentives 
		*keep m_perm_b_s3_q2_1  
		label var m_perm_b_s3_q2_1 "Rewards are awarded based on merit"
		
		*1.7 PERM.B.4 Recognition and incentives 
		recode m_perm_b_s4_q1 (1 2 =100) (3=0)       
		label var m_perm_b_s4_q1 "reward system is fair or somewhat fair"	
		*keep m_perm_b_s4_q1 m_perm_b_s4_q2 m_perm_b_s4_q7
		
		*1.8 RAS.1: Recruitment and selection 
		recode m_ras_s1_q1 (1 3 5 6=1) (7 8 9=3)
		label def ras 1 "Ads-other" 2 "Ads-internet" 3 "Internal communication"
		label val m_ras_s1_q1 ras 	
		tab m_ras_s1_q1, gen(m_ras_s1_q1_)
		label var m_ras_s1_q1_1 "I heard about the job through other ads"
		label var m_ras_s1_q1_2 "I heard about the job on the internet"
		
		*recode no formal selection process to formal selection process is undertaken 
		recode m_ras_s1_q2_1 (0=100) (100=0) 
		label var m_ras_s1_q2_1 "I have been through a formal selection process"
		
		tab m_ras_s1_q3, gen(m_ras_s1_q3_)
		label var m_ras_s1_q3_6 "Future career ambitions attracts me to the job"
		label var m_ras_s1_q3_8 "I am attracted to the job because it fits my educational background"
		label var m_ras_s1_q3_3 "Public service is an attraction to the job"		
		
		recode m_ras_s1_q1_1 m_ras_s1_q1_2 m_ras_s1_q3_3 m_ras_s1_q3_6 m_ras_s1_q3_8 (1=100) (0=0)		
		*keep m_ras_s1_q1_1 m_ras_s1_q1_2 m_ras_s1_q2_1 m_ras_s1_q3_3 m_ras_s1_q3_6 m_ras_s1_q3_8
		
		*1.9 MOT.1: Direct elicitation 
		recode m_mot_s1_q1 (1 2=0) (3 4 =100) 
		label var m_mot_s1_q1 "Satisfed with civil service experience"
		label var m_mot_s1_q3 "Current motivation levels"
		*keep m_mot_s1_q3 m_mot_s1_q1
		
		*1.10 MOT.3: Current position and intended arc of career 
		recode m_mot_s3_q1 (4 5=100) (1 2 3=0)
		label var m_mot_s3_q1 "Confident or very confident in the promotion system"
		recode m_mot_s3_q7 (0=100) (100=0)    // negate it to make it positive
		label var m_mot_s3_q7 "In the next two years would you want to stay on the job"
		*keep m_mot_s3_q1 m_mot_s3_q2_1 m_mot_s3_q7 m_mot_s3_q11 m_mot_s3_q12_1 m_mot_s3_q12_3 m_mot_s3_q12_5 m_mot_s3_q12_6 m_mot_s3_q12_7
		
		*1.11 MOT4. The environment, social norms and the narrative 
		recode m_mot_s4_q2 m_mot_s4_q3 (4 5 =100) (1 2 3=0)
		label var m_mot_s4_q2 "Department's mission is relatively or strongly aligned to one's personal mission"
		label var m_mot_s4_q3 "Division's mission is relatively or strongly aligned to one's personal mission"
		
		recode m_mot_s4_q4 (3 4 =100) (1 2 =0)
		label var m_mot_s4_q4 "Tasks and activities are aligned with one's personal mission regularly or daily"
		label var m_mot_s4_q6 "On what percentage of tasks/projects  your division fulfils its mission"
		label var m_mot_s4_q7 "On what percentage of tasks/projects your Department fulfil its mission?"
		
		recode m_mot_s4_q8 (4 5 =100) (1 2 3=0) 
		label var m_mot_s4_q8 "the civil service is performing well or very well in terms of the mission you see for it"
		
		*keep m_mot_s4_q2 m_mot_s4_q3 m_mot_s4_q4 m_mot_s4_q6 m_mot_s4_q7 m_mot_s4_q8
		
		*1.12 MOT.5 innovative environment 
		*keep m_mot_s5_q1a m_mot_s5_q1b m_mot_s5_q1c m_mot_s5_q1d m_mot_s5_q1e
		
		*1.13 TUB.3 General bottlenecks 
		recode m_tub_s3_q1_2 m_tub_s3_q1_3 m_tub_s3_q1_4 m_tub_s3_q1_5 m_tub_s3_q1_6 m_tub_s3_q1_7 m_tub_s3_q1_8 m_tub_s3_q1_10 m_tub_s3_q1_11 m_tub_s3_q1_13 ///
		(0=100) (100=0)                       // negate it to make it positive
		label var m_tub_s3_q1_2 "Last-minute requests are not an obstacle to me performing my tasks effectively"
		label var m_tub_s3_q1_3 "Schedule conflict is not an obstacle to me performing my tasks effectively"
		label var m_tub_s3_q1_4 "Leadership in my organization is adequate for me to perform my tasks effectively"
		label var m_tub_s3_q1_5 "My tasks have deadlines so I know what I am supposed to do"
		label var m_tub_s3_q1_6 "Communication on the team is not an obstacle to me performing my tasks effectively"
		label var m_tub_s3_q1_7 "I have the right skills to perform my tasks effectively"
		label var m_tub_s3_q1_8 "I am motivated to perform my tasks effectively"
		label var m_tub_s3_q1_10 "guidelines/rules/proclamations are adequate for me to perform my task effectively"
		label var m_tub_s3_q1_11 "corruption in my organization is not an obstacle to me performing my task effectively"
		label var m_tub_s3_q1_13 "I can get required inputs from other in a timely manner"
		
		replace m_tub_s3_q2 = 100-m_tub_s3_q2
		label var m_tub_s3_q2 "percentage of time is used for main tasks?"
		
		recode m_tub_s3_q3e m_tub_s3_q3f m_tub_s3_q3g (0=100) (100=0)     // negate it to make it positive
		label var m_tub_s3_q3e "rules and regulations are not very complex"
		label var m_tub_s3_q3f "A civil servant can't interpret the rules and regulations in his or her own way"
		label var m_tub_s3_q3g "I am not afraid of making a decision"
		
		*keep m_tub_s3_q1_2 m_tub_s3_q1_3 m_tub_s3_q1_4 m_tub_s3_q1_5 m_tub_s3_q1_6 m_tub_s3_q1_8 m_tub_s3_q1_10 m_tub_s3_q1_11 m_tub_s3_q1_13 ///
		*m_tub_s3_q2 m_tub_s3_q3a m_tub_s3_q3e m_tub_s3_q3f m_tub_s3_q3g m_tub_s3_q3h m_tub_s3_q3i
			
		*1.14 SKA.1.: skills
		recode m_ska_s1_q2 (1 2 = 100) (3 4=0) 
		label var m_ska_s1_q2 "I am satisfied with the training I receive for my present job"
		*keep m_ska_s1_q1a m_ska_s1_q1b m_ska_s1_q1c m_ska_s1_q1d m_ska_s1_q2
		
		*1.15 SKA.2.: Capacity building
		gen     m_ska_s2_q0 = 100   if m_ska_s2_q1==100 |m_ska_s2_q6==100
		replace m_ska_s2_q0 =0      if m_ska_s2_q1==0   &m_ska_s2_q6==0
		
		recode m_ska_s2_q5b (0=100) (100=0)        // negate it to make it positive
		label var m_ska_s2_q5b "Trainings are adequately provided"
		recode m_ska_s2_q5d (0=100) (100=0)        // negate it to make it positive
		label var m_ska_s2_q5d "Trainings are not general"
		recode m_ska_s2_q5g (0=100) (100=0)        // negate it to make it positive
		label var m_ska_s2_q5g "Trainings match the specific needs of my job"
		
		
		label var m_ska_s2_q0   "I received training in the last 12 months"
		label var m_ska_s2_q4_1 "HR identies my training needs"
		*keep m_ska_s2_q4_1 m_ska_s2_q0 m_ska_s2_q5a m_ska_s2_q5b m_ska_s2_q5c m_ska_s2_q5d m_ska_s2_q5g m_ska_s2_q8 m_ska_s2_q12b m_ska_s2_q13a m_ska_s2_q13b
		
		*1.16 INF.1 source of information 
		*keep m_inf_s1_q2b
		
		*1.17 information and communication bottlenecks 
		*keep m_inf_s2_q1c m_inf_s2_q1d m_inf_s2_q1e
		
		*1.18 INF.2 Political interference
		*keep m_int_s2_q7
		
		*1.19 REF.2 PBB 
		*keep m_ref_s2_1_q1a m_ref_s2_1_q1b m_ref_s2_1_q1c m_ref_s2_1_q1d m_ref_s2_2_q1b m_ref_s2_2_q1e m_ref_s2_2_q1g m_ref_s2_2_q1h
		
		*1.20 ETH.1 Perceptions and experiences 
		tab m_eth_s1_q1, gen(m_eth_s1_q1_) 
		recode m_eth_s1_q1_3 (1=100)
		label var m_eth_s1_q1_3 "Not right to ask or accept gifts in exchange for favor"
		
		recode m_eth_s2_q1a m_eth_s2_q1b m_eth_s2_q1c (0=100) (100=0)       // negate it to make it positive
		label var m_eth_s2_q1a "Petty corruption does not have an impact on my ability to effectively perform"
		label var m_eth_s2_q1b "Petty corruption does not have an impact on the ability of the division to effectively deliver services"
		label var m_eth_s2_q1c "There isn't practice of collecting informal fees"

		*keep m_eth_s1_q1_3 m_eth_s1_q3 m_eth_s2_q1a m_eth_s2_q1b m_eth_s2_q1c
		
		*keep questions used for the dashboard
		keep `keepvars'
		
		ds
		local allvars = r(varlist)
		
		levelsof `allvars', clean // this gives you a variable list wihtout puncutations.
		return list
		local dis_vars_n = r(r)
		assert `dis_vars_n' == `correct_n_vars' 			// this checks that the number of distinct variables == the number of variablaes we know should be in the dataset.
		
		
		save "$data\6. Constructed_Data\PH_CSS_125Questions_DashBoard_Mar5.dta", replace 
		
				
				
		// list of locals
		local thing1 = 	18	// number i know that thing should be
		local thing2 = 687 	// that i know thing 2 should be.
		
		
		
				
				
		//  /*transparency and accountability*/
		
			levelsof `trans_acc'
			return list
			local n_trans_acc = r(N)  // == 74 
			
			
			
			assert `n_trans_acc' == `thing1' 	// because i know that there should be 74 elements in this list
			
			


		
		
		
		
		