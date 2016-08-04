ulink();
exec builder.sce
exec loader.sce

  	  function y=f(x)
  			y=x(1)^2+x(2)^2;
  		endfunction
  		//Starting point, linear constraints and variable bounds  
  		x0=[3 , 3];
  		A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
  		b=[2;1;2;1;-1;2];
  		Aeq=[1,1];
  	 	beq=[2];
  	    //Calling Ipopt
      [x,fval] =intfmincon(f, [3 3],[1 2],[],[]);
