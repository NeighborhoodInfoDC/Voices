
**add loop loop through whole thing for each of 5 geographies - add create 5 excel files - ***

svy,vce(jackknife):mean Q39A_7plus Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus if geo==1

*get mean
mata b=st_matrix("e(b)")'
mata b

mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se

* Send b, se back to stata
mata st_matrix("b",b)
mata st_matrix("se",se) 

*could create another mata var to calculate CI here then output all three


mata res=b,se

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:

putexcel set d:\dcdata\libraries\voices\prog\temp\test, sheet(testsheet) modify
putexcel b1=("DC") /*need to edit for loop*/
putexcel c1=("se")
putexcel b2=matrix(result[.,1..2])

mata: mata clear

*for region output on each file

svy,vce(jackknife):mean Q39A_7plus Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus 

*get mean
mata b=st_matrix("e(b)")'
mata b

mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se

* Send b, se back to stata
mata st_matrix("b",b)
mata st_matrix("se",se) 


mata res=b,se

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:

putexcel set d:\dcdata\libraries\voices\prog\temp\test, sheet(testsheet) modify
putexcel e1=("DMV")
putexcel f1=("se")
putexcel e2=matrix(result[.,1..2])

mata: mata clear

***end the loop here
