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
c = 1;
r = 0.5;

F  = @(t,y) r*(1-y/c)*y;
%     			 
%
%
tInitial    = 0.0;                      % Initial time
tFinal      = 20.0;                      % Final time
yInitial    = 0.1;                      % Initial value of y
N           = 200               % Number of timesteps taken

h           = (tFinal - tInitial)/N;    % Timestep determination
y           = zeros(N+1,1);             % Arrays to hold solution values
t           = zeros(N+1,1); 
%
%////////////////////////////////////////////////////////
%     Computing the solution using Euler's method    
%////////////////////////////////////////////////////////
%
t(1)  = tInitial;
y(1)  = yInitial;     

for(i = 1:N)
        t(i+1) = t(i) + h;
        y(i+1) = y(i) + h*F(t(i),y(i));
end     
%
%    Set plot limits 
%
tPlotMin =     tInitial;
tPlotMax =     tFinal;
yPlotMin =     0.0;
yPlotMax =     2.0;

% plot, then scale by calling axis command 

plot(t,y);
axis([tPlotMin,tPlotMax,yPlotMin,yPlotMax]);

title('Approximate solution for c=1 r=0.5 h=0.1 obtained with Euler''s method ')
xlabel('t') 
ylabel('y(t)')
