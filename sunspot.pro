

PRO READ_DATA
fname="/home/divya/Desktop/sunspot_number_daily_omni.txt"
ASTR=READ_ASCII(fname)
;print,ASTR
A=ASTR.(0)
year=A[0,*]
days=A[1,*]
ns=A[3,*]
a=0
b=29
sum=0
avg=0
mnar=[0.0,0.0]
meanarr=[0.0]
window, 3
iplot , findgen(8401),ns

while (b le 8401) do begin
   
    m=mean(ns[a:b])
   s=stddev(ns[a:b])
   mnar=[[mnar],[m,s]]
   a=b+1 
   b=a+29
   for j=0,29 do begin
   meanarr=[meanarr,m]
   endfor
   

endwhile
print, meanarr
iplot,findgen(8401),meanarr[1:*],color="green",thick=3,/overplot
print, size(meanarr)
;print, size(mnar,/n_elements)
X = findgen(9000/30)
;window, 0
;plot, x, mnar[0,1:*]
;window, 1
;plot,x, mnar[1,1:*]
;print,  mnar[1,1:*]

;print, sum/30.0
;print,mean (ns[a:b])
;print     
;plot,x,y
;print , mean(y[0:29])
;print, stddev(y[0:29])  
     

;OPENR,1,fname
;cols=4
;rows=8401
;if n_elements(cols) le 0 then cols=1
;if n_elements(rows) le 0 then rows=1000
;H=FLTARR(cols,rows) ;A big array to hold the data
;S=FLTARR(cols)      ;A small array to read a line
;ON_IOERROR,ers  
;n=0
;while n lt rows DO BEGIN
	;READF,1,S    ;Read a line of data
		   ;Print the line
	    ;H[*,n]=S     ;Store it in H
	    ;n=n+1
	;ENDWHILE
	;ers:CLOSE,1
	;H=H[*,0:n-1]
	;print, H
;-END 
;fname="/home/divya/Desktop/sunspot_number_daily_omni.txt"
;READ_DATA,A,fname

END
