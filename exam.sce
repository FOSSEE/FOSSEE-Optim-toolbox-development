function y = fun(x) 
  y = 3*x(1)^2 + 2*x(1)*x(2) + x(2)^2 - 4*x(1) + 5*x(2) ;
endfunction

[xval, fval, status, gradient, hessian] = intfminunc(fun,[1 2],[2])

x1 = [0,-5];
x2 = [4,4];

[xval, fval, status, gradient, hessian] = intfminbnd(fun,[1],x1,x2)

		//Find x in R^6 such that it minimizes:
	    //f(x)= sin(x1) + sin(x2) + sin(x3) + sin(x4) + sin(x5) + sin(x6)
		//-2 <= x1,x2,x3,x4,x5,x6 <= 2
	    //Objective function to be minimised
	    function y=f(x)
			y=0
			for i =1:6
				y=y+sin(x(i));
			end	
		endfunction
		//Variable bounds  
		x1 = [-2, -2, -2, -2, -2, -2];
	  x2 = [2, 2, 2, 2, 2, 2];
    intcon = [];
		//Options
		[x,fval] =intfminbnd(f ,intcon, x1, x2)
