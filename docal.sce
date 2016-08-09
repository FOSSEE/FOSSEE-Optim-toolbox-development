ulink();
exec builder.sce
exec loader.sce

function y=f(x)
  y=-(x(1)+x(2)+x(3));
endfunction

function [c,ceq]=nlc(x)
  c=((x(2)-0.5)^2 + (x(3)-0.5)^2 - 0.25 );
  ceq = [];
endfunction

A = [1 -1 0 0;1 0 1 1;]
b = [0 2]';
lb =[0 0 0 0]
ub = [1 %inf %inf 5]
intcon = [1 4]
x0 = [0 0 0 0]
[x,fval,exitflag] =intfmincon(f, x0,intcon,A,b,[],[],lb,ub,nlc);