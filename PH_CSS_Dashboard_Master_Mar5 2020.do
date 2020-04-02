/*______________________________________________________________________________
File Name: 2_Dofile for generation of dashboard to Department heads in Gov't 
of Philippines 
Date: Feb, 2020
Author: Zihao Wang
_____________________________________________________________________________*/

	clear		all
	cls
	set more 	off
	pause on
	*macro drop _all
	
*/
*__Set Macros___________________________________________________________________

	set more off

	*user 1 
	global tw 1 

	*user 2 
	global kk 0

	if $tw {
		global data "C:\Users\WB516607\Desktop\Bureaucracy Lab\Philippines 2019\5. Data" 
		global do   "C:\Users\WB516607\Desktop\Bureaucracy Lab\Philippines 2019\5. Data\5. Dashboard\dofile"
		}

	if $kk {
		global data "D\"
	}	
	
*__File Execution______________________________________________________________

	do "$do/PH_CSS_Selecting125Questions_Mar5 2020.do"
	do "$do/PH_CSS_Export125Questions_ServiceWide_Mar5 2020.do"
	do "$do/PH_CSS_Export125Questions_DepartmentLevel_Mar5 2020.do"
	
	
	
