%                        EulerSample.m
%
% A sample Matlab script that implements the Euler's method for 
% the ODE 
%
% dy/dt = F(t,y)
%
% where the function F(t,y) is specified using the anonymous function 
% specification. Note that in this sample, F(t,y), depends upon the 
% parameter lambda. F will use the value of lambda that precedes the
% declaration of F. If one wants to use different values of lambda 
% in the function F within the same program, the F must be redeclared
% after lambda is specified with the different values. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Target Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
format long

F  = @(t,y) 4*y*(1-y);
%     			 
%
%
tInitial    = 0.0;                      % Initial time
tFinal      = 1.0;                      % Final time
yInitial    = 0.1;                      % Initial value of y




%
%////////////////////////////////////////////////////////
%     Computing the solution using Euler's method    
%////////////////////////////////////////////////////////
%

for (k=0:9)
    N = 10*power(2,k)
    h  = (tFinal - tInitial)/N;    % Timestep determination
    y           = zeros(N+1,1);             % Arrays to hold solution values
    t           = zeros(N+1,1); 
    t(1)  = tInitial;
    y(1)  = yInitial;     
    for(i = 1:N)
            t(i+1) = t(i) + h;
            temp = y(i)+h*F(t(i),y(i));
            y(i+1) = y(i) + h/2*F(t(i),y(i)) + h/2*F(t(i),temp);
    end     
    y(N+1)
end
%
%    Set plot limits 
%
