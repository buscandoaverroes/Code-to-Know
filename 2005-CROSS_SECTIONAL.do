
clear 
capture log close
set more off
version 15.1
set linesize 250
set varabbrev off

local log_file "CrossSectional_05" 
global csv_path "D:\Public sector wages\EUSILC\Cross\Personal Data" 
local stata_file "D:\Public sector wages\EUSILC\Data Constructed\SILC_Cross_05.dta" 



tempfile temp 
save `temp', emptyok 

cd "$csv_path" 
/*
* The following code combines all year dataset into .dta files by country
local i=0 
local files : dir . files "*.csv"  // Identifies Directly to pull raw CSV files from
foreach f of local files {  
	drop _all 
	import delimited "`f'", stringcols(_all)  
	if `i'>0 append using "D:\Public sector wages\EUSILC\Data Constructed\EUSILC_Cross_Raw(2004-2018).dta", force  
	save "D:\Public sector wages\EUSILC\Data Constructed\EUSILC_Cross_Raw(2004-2018).dta", replace  
	local i=1  
} 
*/

use "D:\Public sector wages\EUSILC\Data Constructed\EUSILC_Cross_Raw(2004-2018).dta", clear


rename pb020 ccode_eu // The raw files use a 2-character country identifier as opposed to WB ISO3

gen country_name = ""
	replace country_name = "Austria" 			if ccode_eu == "AT"
	replace country_name = "Belgium" 			if ccode_eu == "BE"
	replace country_name = "Bulgaria" 			if ccode_eu == "BG"
	replace country_name = "Switzerland" 		if ccode_eu == "CH"
	replace country_name = "Cyprus" 			if ccode_eu == "CY"
	replace country_name = "Czech Republic" 	if ccode_eu == "CZ"
	replace country_name = "Germany" 			if ccode_eu == "DE"
	replace country_name = "Denmark" 			if ccode_eu == "DK"
	replace country_name = "Estonia" 			if ccode_eu == "EE"
	replace country_name = "Spain" 				if ccode_eu == "ES"
	replace country_name = "Finland" 			if ccode_eu == "FI"
	replace country_name = "France"				if ccode_eu == "FR"
	replace country_name = "Greece" 			if ccode_eu == "GR"
	replace country_name = "Greece" 			if ccode_eu == "EL"
	replace country_name = "Croatia" 			if ccode_eu == "HR"
	replace country_name = "Hungary" 			if ccode_eu == "HU"
	replace country_name = "Ireland"			if ccode_eu == "IE"
	replace country_name = "Iceland" 			if ccode_eu == "IS"
	replace country_name = "Italy" 				if ccode_eu == "IT"
	replace country_name = "Lithuania" 			if ccode_eu == "LT"
	replace country_name = "Luxembourg" 		if ccode_eu == "LU"
	replace country_name = "Latvia" 			if ccode_eu == "LV"
	replace country_name = "Malta" 				if ccode_eu == "MT"
	replace country_name = "Netherlands" 		if ccode_eu == "NL"
	replace country_name = "Norway" 			if ccode_eu == "NO"
	replace country_name = "Poland" 			if ccode_eu == "PL"
	replace country_name = "Portugal" 			if ccode_eu == "PT"
	replace country_name = "Romania" 			if ccode_eu == "RO"
	replace country_name = "Sweden" 			if ccode_eu == "SE"
	replace country_name = "Slovenia" 			if ccode_eu == "SI"
	replace country_name = "Serbia" 			if ccode_eu == "RS"
	replace country_name = "Slovakia" 			if ccode_eu == "SK"
	replace country_name = "United Kingdom" 	if ccode_eu == "UK"
	lab var country_name "Country Name"

gen ccode = ""
	replace ccode = "AUT" if ccode_eu == "AT"
	replace ccode = "BEL" if ccode_eu == "BE"
	replace ccode = "BGR" if ccode_eu == "BG"
	replace ccode = "CHE" if ccode_eu == "CH"
	replace ccode = "CYP" if ccode_eu == "CY"
	replace ccode = "CZE" if ccode_eu == "CZ"
	replace ccode = "DEU" if ccode_eu == "DE"
	replace ccode = "DNK" if ccode_eu == "DK"
	replace ccode = "EST" if ccode_eu == "EE"
	replace ccode = "ESP" if ccode_eu == "ES"
	replace ccode = "FIN" if ccode_eu == "FI"
	replace ccode = "FRA" if ccode_eu == "FR"
	replace ccode = "GRC" if ccode_eu == "GR"
	replace ccode = "GRC" if ccode_eu == "EL"
	replace ccode = "HRV" if ccode_eu == "HR"
	replace ccode = "HUN" if ccode_eu == "HU"
	replace ccode = "IRL" if ccode_eu == "IE"
	replace ccode = "ISL" if ccode_eu == "IS"
	replace ccode = "ITA" if ccode_eu == "IT"
	replace ccode = "LTU" if ccode_eu == "LT"
	replace ccode = "LUX" if ccode_eu == "LU"
	replace ccode = "LVA" if ccode_eu == "LV"
	replace ccode = "MLT" if ccode_eu == "MT"
	replace ccode = "NLD" if ccode_eu == "NL"
	replace ccode = "NOR" if ccode_eu == "NO"
	replace ccode = "POL" if ccode_eu == "PL"
	replace ccode = "PRT" if ccode_eu == "PT"
	replace ccode = "ROM" if ccode_eu == "RO"
	replace ccode = "SRB" if ccode_eu == "RS"
	replace ccode = "SWE" if ccode_eu == "SE"
	replace ccode = "SVN" if ccode_eu == "SI"
	replace ccode = "SVK" if ccode_eu == "SK"
	replace ccode = "GBR" if ccode_eu == "UK"
	lab var ccode "ISO3 Country Code"

gen year = pb010
	destring year, replace
	
gen sample = ccode+"_"+pb010+"_"+"EU-SILC"+".dta"
	encode sample, gen(sample1)

**DEMOGRAPHIC MODULE
	
rename	pb030 idp

rename	pb040 wgt
	destring wgt, replace
	
rename	pb150 gender

gen year_survey = pb110
	destring year_survey, replace
	
gen birth_year = pb140
	destring birth_year, replace
	
gen age = year_survey-birth_year

destring pe040, replace

** EDUCATION MODULE

gen educy = pe040 if year < 2014
	replace educy = floor(pe040/100) if year > 2013
	replace educy = . if pe040_f == "-2"        
	replace educy = 5 if educy > 5 & educy != .
	
gen edulevel1 = 1 		if pe040_f == "-2"	            	//No education
	replace edulevel1 = 2	if pe040 == 0    				//Primary incomplete
	replace edulevel1 = 3	if pe040 == 1					//Primary complete
	replace edulevel1 = 4	if pe040 == 2					//secondary incomplete
	replace edulevel1 = 5	if pe040 == 3					//secondary complete
	replace edulevel1 = 6	if pe040 == 4					//>secondary but not university 
	replace edulevel1 = 7	if pe040 == 5					//University incomplete or complete 
	replace edulevel1 = 9	if pe040_f == "-1"				//Unstated
	
gen edulevel2 = 1 if pe040_f == "-2"						//No education
	replace edulevel2 = 2	if pe040 == 0					//Primary incomplete
	replace edulevel2 = 3	if pe040 == 1 | pe040 == 2		//Primary complete but not secondary
	replace edulevel2 = 4	if pe040 == 3					//secondary complete
	replace edulevel2 = 5	if pe040 == 4 | pe040 == 5		//Some teritary/Post-secondary
	
gen edulevel3 = 1 if pe040_f == "-2" | pe040 == 0			//No education
	replace edulevel3 = 2	if pe040 == 1 | pe040 == 2		//Primary
	replace edulevel3 = 3	if pe040 == 3 					//Secondary
	replace edulevel3 = 4	if pe040 == 4 | pe0404 == 5		//Post-secondary
	label def edulevel3 1 "No education" 2 "Primary" 3 "Secondary" 4 "Tertiary"
	label val edulevel3 edulevel3 

**** LABOR MODULE

gen	lb_mod_age = 16

gen lstatus = .
	destring pl030, replace
	destring pl031, replace
	replace lstatus = 1 if pl030 == 1 | pl030 ==2
	replace lstatus = 1 if pl031 >= 1 & pl031 <5	
	replace lstatus = 2 if pl030 == 3 
	replace lstatus = 2 if pl031 == 5
	replace lstatus = 2 if pl020 == "1" & pl025 == "1"
	replace lstatus = 3 if pl030 > 3 & pl030 != .
	replace lstatus = 3 if pl031 > 5 & pl031 != .
	replace lstatus = 3 if pl020 == "2" | pl025 == "2"

destring incdecil, replace
	gen wage = incdecil
	replace wage = . if wage == 99
	
	
gen empstat = .
	replace empstat = 1 if pl040 == "3" & wage != .
	replace empstat = 2 if pl040 == "3" & wage == .
	replace empstat = 3 if pl040 == "1"
	replace empstat = 4 if pl040 == "2"
	replace empstat = 5 if pl040 == "4"
	lab def emp 1 "Paid employee" 2 "Non-paid employee" 3 "Employer" 4 "Self-employeed" 5 "Other"
	lab val empstat emp

// build an ISCO variable streching from 92 to 2018
gen occup = "1" if pl050 == "1" | pl050 == "10" | pl050 == "11" | pl050 == "12" | pl050 == "13"
	replace occup = "2"  if pl050 == "2" | pl050 == "21" | pl050 == "22" | pl050 == "23" | pl050 == "24"
	replace occup = "3"  if pl050 == "3" | pl050 == "31" | pl050 == "32" | pl050 == "33" | pl050 == "34"
	replace occup = "4"  if pl050 == "4" | pl050 == "41" | pl050 == "42"
	replace occup = "5"  if pl050 == "5" | pl050 == "51" | pl050 == "52"
	replace occup = "6"  if pl050 == "6" | pl050 == "61"
	replace occup = "7"  if pl050 == "7" | pl050 == "71" | pl050 == "72" | pl050 == "73" | pl050 == "74"
	replace occup = "8"  if pl050 == "8" | pl050 == "81" | pl050 == "82" | pl050 == "83"
	replace occup = "9"  if pl050 == "9" | pl050 == "91" | pl050 == "92" | pl050 == "93"


	replace occup = "1" if pl051 == "1" | pl051 == "10" | pl051 == "11" | pl051 == "12" | pl051 == "13" | pl051 == "14"
	replace occup = "2"  if pl051 == "2" | pl051 == "21" | pl051 == "22" | pl051 == "23" | pl051 == "24" | pl051 == "25" | pl051 == "26"
	replace occup = "3"  if pl051 == "3" | pl051 == "31" | pl051 == "32" | pl051 == "33" | pl051 == "34" | pl051 == "35"
	replace occup = "4"  if pl051 == "4" | pl051 == "41" | pl051 == "42" | pl051 == "43" | pl051 == "44"
	replace occup = "5"  if pl051 == "5" | pl051 == "51" | pl051 == "52" | pl051 == "53" | pl051 == "54"
	replace occup = "6"  if pl051 == "6" | pl051 == "61" | pl051 == "62" | pl051 == "63"
	replace occup = "7"  if pl051 == "7" | pl051 == "71" | pl051 == "72" | pl051 == "73" | pl051 == "74" | pl051 == "75
	replace occup = "8"  if pl051 == "8" | pl051 == "81" | pl051 == "82" | pl051 == "83"
	replace occup = "9"  if pl051 == "9" | pl051 == "91" | pl051 == "92" | pl051 == "93" | pl051 == "94" | pl051 == "95" | pl051 == "96"
	replace occup = "10"  if pl051 == "0"
	
	lab def occ 1 "Managers" ///
				2 "Professionals" ///
				3 "Technicians and associate professionals" ///
				4 "Clerical support workers" ///
				5 "Service and sales workers" ///
				6 "skilled agriculatural, forestry and faisher workers" ///
				7 "Craft and related trade workers" ///
				8 "Plant and machine operations, and assemblers" ///
				9 "Elementary occuptions" ///
				10 "Armed forces occupations"
				99 "Other/unspecified"
	lab val occup occ

rename	isco occup
	destring occup, replace
*	replace occup = . if occup == 999


destring temp, replace
	gen contract = 1 if temp == 1            // changed to 1 
	replace contract = 2 if temp == 2        // changed to 2

destring stapro, replace
destring sizefirm, replace





destring wstator, replace
destring ilostat, replace


replace nace1d = "" if nace1d == "9"
replace na111d = "" if na111d == "9"

// build an ISIC variable streching from 92 to 2018
gen na1d     = "A"     if nace1d == "A" |  na111d =="A"  | na111d =="B"        // Agriculture, Hunting, Forestry, and Fishing 
	replace na1d = "B" if nace1d == "B" |  na111d =="C"                        // Minng and quarrying 
	replace na1d = "C" if nace1d == "C" |  na111d =="D"                        // Manufacturing
	replace na1d = "D" if nace1d == "D" |  nace1d =="E"  | na111d =="E"        // Electricity, gas, steam/water and air-conditioning supply
	replace na1d = "F" if nace1d == "F" |  na111d =="F"                        // Construction 
	replace na1d = "G" if nace1d == "G" |  na111d =="G"                        // Wholesale and retail trade, repair of motor vehicles and motorcycles 	
	replace na1d = "I" if nace1d == "I" |  na111d =="H"                        // Accommodation and food service activities 
	replace na1d = "H" if nace1d == "H" |  na111d =="I"                        // Transportation, storage and communication
	replace na1d = "J" if nace1d == "J" |  nace1d =="K"  | na111d =="J"        // Financial and insurance activities
	replace na1d = "L" if nace1d == "L" |  nace1d =="M"  | nace1d =="N"        ///
	| na111d =="K"                                                             // Real estate & business activities
	replace na1d = "O" if nace1d == "O" |  na111d =="L"                        // Public administration and defence; compulsory social security 
	replace na1d = "P" if nace1d == "P" |  na111d =="M"                        // Education
	replace na1d = "Q" if nace1d == "Q" |  na111d =="N"                        // Human health and social work activities 
	replace na1d = "R" if nace1d == "R" |  nace1d =="S"  | na111d =="O"        // Arts/entertainment, and Other community, social, and  personal service activities
	replace na1d = "T" if nace1d == "T" |  na111d =="P"                        // Private households with employed persons
	replace na1d = "U" if nace1d == "U" |  na111d =="Q"                        // Extraterritorial org and bodies 
	
	
	
gen industry = 1 if na1d == "A"
	replace industry = 2 if na1d == "B"
	replace industry = 3 if na1d == "C"
	replace industry = 4 if na1d == "D" 
	replace industry = 5 if na1d == "F"
	replace industry = 6 if na1d == "G" | na1d == "I"
	replace industry = 7 if na1d == "H" 
	replace industry = 8 if na1d == "J"| na1d == "L" 
	replace industry = 9 if na1d == "O"
	replace industry = 10 if na1d == "P"| na1d == "Q"| na1d == "R"| na1d == "T"| na1d == "U"
	
gen ocusec = 1 if na1d == "O" | na1d == "P"| na1d == "Q"
	replace ocusec = 2 if ocusec != 1 & na1d != ""



	
gen unitwage = 5 if wage != .
gen whours = 40 if wage != .

gen world_region = "European Union"

egen hhsize = count(idp), by (idh year ccode)

destring degurba, replace
	gen urb = 1 if degurba == 1 | degurba == 2
	replace urb = 2 if degurba == 3


destring year, replace
destring age, replace
destring gender, replace




lab var year "Year of the survey"
lab var idp "Personal ID"
lab var wgt "Personal cross-sectional weight"
lab var year_survey "Year of the personal interview"
lab var pb140 "Year of birth (Bottom coding: year of survey -80 and below)"
lab var pb140_f "Flag"
lab var pb150 "Sex"
lab var pb150_f "Flag"
lab var pb160 "Father ID"
lab var pb160_f "Flag"
lab var pb170 "Mother ID"
lab var pb170_f "Flag"
lab var pb180 "Spouse/Partner ID"
lab var pb180_f "Flag"
lab var pb190 "Marital status"
lab var pb190_f "Flag"
lab var pb200 "Consensual union"
lab var pb200_f "Flag"
lab var pe020 "ISCED level currently attended"
lab var pe040 "Highest ISCED level attained"
lab var pe040_f "Flag"
lab var pl030 "Self-defined current economic status"
lab var pl030_f "Flag"
lab var pl020 "Actively looking for a job"
lab var pl020_f "Flag"
lab var pl025 "Available for work"
lab var pl025_f "Flag"
lab var pl040 "Status in employment"
lab var pl040_f "Flag"
lab var pl050 "Occupation (ISCO-88 (Com))"
lab var pl050_f "Flag"
lab var pl060 "Number of hours usually worked per week in main job"
lab var pl060_f "Flag"
lab var pl110 "NACE"
lab var pl140 "Type of contract"
lab var pl140_f "Flag"
lab var pl160 "Change of job since last year"
lab var pl160_f "Flag"
lab var pl170 "Reason for change"
lab var pl170_f "Flag"
lab var pl180 "Most recent change in the individuals activity status"
lab var pl180_f "Flag"
lab var pl190 "When began regular first job"
lab var pl190_f "Flag"
lab var pl200 "Number of years spent in paid work"
lab var pl200_f "Flag"
lab var pl210a "Main activity on January"
lab var pl210a_f "Flag"
lab var pl210b "Main activity on February"
lab var pl210b_f "Flag"
lab var pl210c "Main activity on March"
lab var pl210c_f "Flag"
lab var pl210d "Main activity on April"
lab var pl210d_f "Flag"
lab var pl210e "Main activity on May"
lab var pl210e_f "Flag"
lab var pl210f "Main activity on June"
lab var pl210f_f "Flag"
lab var pl210g "Main activity on July"
lab var pl210g_f "Flag"
lab var pl210h "Main activity on August"
lab var pl210h_f "Flag"
lab var pl210i "Main activity on September"
lab var pl210i_f "Flag"
lab var pl210j "Main activity on October"
lab var pl210j_f "Flag"
lab var pl210k "Main activity on November"
lab var pl210k_f "Flag"
lab var pl210l "Main activity on December"
lab var pl210l_f "Flag"
lab var ph010 "General health"
lab var ph010_f "Flag"
lab var ph020 "Suffer from a chronic(long-standing) illness or condition"
lab var ph020_f "Flag"
lab var ph030 "Limitation in activities because of health problems"
lab var ph030_f "Flag"
lab var py010n "Employee cash or near cash income(net)"
lab var py010n_f "Flag"
lab var py010n_i "Imputation factor"
lab var py020n "Non-Cash employee income(net)"
lab var py020n_f "Flag"
lab var py020n_i "Imputation Factor"
lab var py035n "Contributions to individual private pension plans(net)"
lab var py035n_f "Flag"
lab var py035n_i "Imputation Factor"
lab var py050n "Cash benefits or losses from self-employment(net)"
lab var py050n_f "Flag"
lab var py050n_i "Imputation Factor"
lab var py070n "Value of goods produced by own-consumption (net)"
lab var py070n_f "Flag"
lab var py070n_i "Imputation factor"
lab var py080n "Pension from individual private plans(net)"
lab var py080n_f "Flag"
lab var py080n_i "Imputation factor"
lab var py090n "Unemployment benefits(net)"
lab var py090n_f "Flag"
lab var py090n_i "Imputation Factor"
lab var py100n "Old-age benefits(net)"
lab var py100n_f "Flag"
lab var py100n_i "Imputation Factor"
lab var py110n "Survivors Benefits (net)"
lab var py110n_f "Flag"
lab var py110n_i "Imputation Factor"
lab var py120n "Sickness benefits(net)"
lab var py120n_f "Flag"
lab var py120n_i "Imputation Factor"
lab var py130n "Disability benefits(net)"
lab var py130n_f "Flag"
lab var py130n_i "Imputation Factor"
lab var py140n "Education-related allowances"
lab var py140n_f "Flag"
lab var py140n_i "Imputation factor"
lab var py010g "Employee Cash or near cash income(gross)"
lab var py010g_f "Flag"
lab var py010g_i "Imputation Factor"
lab var py020g "Non-Cash employee income(gross)"
lab var py020g_f "Flag"
lab var py020g_i "Imputation"
lab var py035g "Contributions to individual private pension plans(gross)"
lab var py035g_f "Flag"
lab var py035g_i "Imputation Factor"
lab var py050g "Cash benefits or losses from self-employment (gross)"
lab var py050g_f "Flag"
lab var py050g_i "Imputation Factor"
lab var py070g "Value of goods produced by own-consumption(gross)"
lab var py070g_f "Flag"
lab var py070g_i "Imputation Factor"
lab var py080g "Pension from individual private plans(gross)"
lab var py080g_f "Flag"
lab var py080g_i "Imputation Factor"
lab var py090g "Unemployment benefits (gross)"
lab var py090g_f "Flag"
lab var py090g_i "Imputation Factor"
lab var py100g "Old-age benefits(gross)"
lab var py100g_f "Flag"
lab var py100g_i "Imputation Factor"
lab var py110g "Survivors benefits"
lab var py110g_f "Flag"
lab var py110g_i "Imputation factor"
lab var py120g "Sickness Benefits(gross)"
lab var py120g_f "Flag"
lab var py120g_i "Imputation Factor"
lab var py130g "Disability benefits(gross)"
lab var py130g_f "Flag"
lab var py130g_i "Imputation Factor"
lab var py140g "Education-related allowances(gross)"
lab var py140g_f "Flag"
lab var py140g_i "Imputation factor"
lab var px030 "Household ID"
lab var px040 "Respondent status"
lab var px020 "Age at the end of the income reference period"
lab var px010 "Exchange rate"

-;

save "D:\Public sector wages\EULFS\CountryData\Intermediate_Data\EU-LFS_`c'_intermediate.dta", replace
	
order ccode country_name hhsize idh idp urb year age gender educy edulevel1 edulevel2 edulevel3 edulevel4 contract empstat3 industry lb_mod_age lstatus occup ocusec unitwage wage whours world_region wgt, first

keep ccode country_name hhsize idh idp urb year age gender educy edulevel1 edulevel2 edulevel3 edulevel4 contract empstat3 industry lb_mod_age lstatus occup ocusec unitwage wage whours world_region wgt 


keep if age >= 15

gen pemp = 1 if lstatus == 1 & empstat3 == 1   // employed and is an employee

*Public sector, considering only employees
	gen 		ps1 = ocusec
	recode 		ps1 2=0 3 4=1 5/.=.
	replace 	ps1 = . if lstatus ~= 1
	replace 	ps1 = . if empstat3 > 1
	label var 	ps1 "Employees working in public sector as a share of total number of employees"
	lab def lps1 1 "Employee/public sector" 0 "Employee/private sector"
	lab val ps1 lps1

*Public sector employees, considering all employed (only paid employees are considered as public sector)
	gen 		ps2 = ocusec
	recode 		ps2 2=0 3 4=1 5/.=.
	replace 	ps2 = . if lstatus ~= 1
	replace 	ps2 = 0 if lstatus == 1 & (empstat3 == 2 | empstat3 == 3 | empstat3 == 4|empstat3==5)
	label var 	ps2 "Employees in public sector as a share of total employed"
	lab def lps2 1 "Public sector employee" 0 "Employed, not public sector employee"
	lab val ps2 lps2
	
	*Formal employee
gen fe=.
replace fe=1 if  contract==1
replace fe=0 if  contract==0
label variable fe "formal employee"

* Public employee as a share of formal employment 
gen ps3=.
replace ps3=1 if ps1==1&fe==1
replace ps3=0 if ps1==0&fe==1
label variable ps3 "Formal employee work in public sector"
lab def lps3 1 "Public sector formal employee" 0 "Private sector formal employee"
lab val ps3 lps3

* Proportion of total employment with tertiary education working in the public sector
gen ps4=. 
replace ps4=1 if ps1==1 & edulevel4==3                   // with    tertiary education in public sector     
replace ps4=0 if ps1==1 & (edulevel4==1 |edulevel4==2)   // without tertiary education in public sector           
label def ps4 1 "With tertiary education working in public sector" 0 "Without tertiary education in public sector"
label val ps4 ps4 

*Private sector, considering only employees
	gen 		pri_s1 = ocusec
	recode 		pri_s1 2=1 1 3 4=0 5/.=.
	replace 	pri_s1 = . if lstatus ~= 1
	replace 	pri_s1 = . if empstat3 > 1
	label var 	pri_s1 "Employees working in private sector as a share of total number of employees"
	lab def lpri_s1 1 "Employee/private sector" 0 "Employee/private sector"
	lab val pri_s1 lpri_s1

*Private sector employees, considering all employed (only paid employees are considered as private sector)
	gen 		pri_s2 = ocusec
	recode 		pri_s2 2=1 1 3 4=0 5/.=.
	replace 	pri_s2 = . if lstatus ~= 1
	replace 	pri_s2 = 0 if lstatus == 1 & (empstat3 == 2 | empstat3 == 3 | empstat3 == 4|empstat3==5)
	label var 	pri_s2 "Employees in private sector as a share of total employed"
	lab def lpri_s2 1 "Private sector employee" 0 "Employed, not private sector employee"
	lab val pri_s2 lpri_s2
	
* Private employee as a share of formal employment 
gen pri_s3=.
replace pri_s3=1 if pri_s1==1&fe==1
replace pri_s3=0 if pri_s1==0&fe==1
label variable pri_s1 "Formal employee work in private sector"
lab def lpri_s3 1 "Private sector formal employee" 0 "Private sector formal employee"
lab val pri_s3 lpri_s3

* Proportion of total employment with tertiary education working in the private sector
gen pri_s4=. 
replace pri_s4=1 if pri_s1==1 & edulevel4==3                   // with    tertiary education in public sector     
replace pri_s4=0 if pri_s1==1 & (edulevel4==1 |edulevel4==2)   // without tertiary education in public sector           
label def lpri_s4 1 "With tertiary education working in private sector" 0 "Without tertiary education in private sector"
label val pri_s4 lpri_s4 

save "D:\Public sector wages\EULFS\CountryData\Data_constructed\EU-LFS_`c'_clean.dta", replace


}