
%-------------------------------------------------------------------------%
%----------------- Provide All Bounds for Problem ------------------------%
%-------------------------------------------------------------------------%
t0 = 0.2; tf=0.9;
wmax=100;%35;

x10min=[ -pi/4,    -wmax,...  %ankle
       -0,    -wmax,...   %knee
       -0,    -wmax,...   %hip
       -pi/2,    -wmax];%   %contact
   
x10max=[0.15*pi/2,    wmax,...  %ankle
       0,    wmax,...   %knee
       0,    wmax,...   %hip
       0,    wmax];%   %contact;

x1min=[ -pi/4,    -wmax,...  %ankle
       -0,    -wmax,...   %knee
       -0,    -wmax,...   %hip
       -pi/2,    -wmax];%   %contact
   
x1max=[0.15*pi/2,    wmax,...  %ankle
       pi,    wmax,...   %knee
       pi,    wmax,...   %hip
       0,    wmax];%   %contact;
   
 x2min=[ -pi/4,    -wmax,...  %ankle
       -0,    -wmax,...   %knee
       -0,    -wmax,...   %hip
       -2*pi,    -wmax,...%   %contact
       -1, -100,...
       -1, -100];
   
x2max=[pi/2,    wmax,...  %ankle
       pi,    wmax,...   %knee
       pi,    wmax,...   %hip
       pi,    wmax,...%   %contact;
       1,100,...
       10,100];
     
xs=[0.75792877,0,...
     1.3519107688,0,...
     0.59398199,0,...
     0,0];
 
 x10=[0,0,...
     0,0,...
     0,0,...
     0,0];

% Inputs
Tmax=200;%100;
Tdmax=1e6;
% 
auxdata.Tmax=Tmax;
u1min = -Tdmax;  u1max =  Tdmax; %T
u2min = -Tdmax;  u2max =  Tdmax; %T
u3min = -Tdmax;  u3max =  Tdmax; %T

%-------------------------------------------------------------------------%
%----------------------- Setup for Problem Bounds ------------------------%
%-------------------------------------------------------------------------%
bounds.phase(1).initialtime.lower = 0.0; %0.2
bounds.phase(1).initialtime.upper = 0.0;
bounds.phase(1).finaltime.lower = 0.2;
bounds.phase(1).finaltime.upper = 1.1; %0.9
bounds.phase(1).initialstate.lower = [x10min -Tmax -Tmax -Tmax];
bounds.phase(1).initialstate.upper = [x10max Tmax Tmax Tmax];

bounds.phase(1).initialstate.lower([2,4,6,7,8])=[0,0,0,0,0];
bounds.phase(1).initialstate.upper([2,4,6,7,8])=[0,0,0,0,0];

bounds.phase(1).state.lower = [x1min -Tmax -Tmax -Tmax];
bounds.phase(1).state.upper = [x1max Tmax Tmax Tmax];

bounds.phase(1).finalstate.lower = [x1min -Tmax -Tmax -Tmax];
bounds.phase(1).finalstate.upper = [x1max Tmax Tmax Tmax];

% bounds.phase(1).finalstate.lower([1,3,5]) = [0,0,0];%x10;
% bounds.phase(1).finalstate.upper([1,3,5]) = [0,0,0];%x10;

bounds.phase(1).control.lower = [u1min,u2min,u3min];
bounds.phase(1).control.upper = [u1max,u2max,u3max];

bounds.phase(1).integral.lower     = -1e3;
bounds.phase(1).integral.upper     = 1e3;



%% phase 2
xj=[-0.290918702984401,-14.4095992784821,0.271188604893352,-13.5342850802736,0.244775227379985,-6.85214784963556,-0.459354274675276,-7.60306597078165];%,-142.975050863204,-148.855879614686,-65.8240564370534
 
bounds.phase(2).initialtime.lower = 0.3;
bounds.phase(2).initialtime.upper = 1.1;%0.9
bounds.phase(2).finaltime.lower = 0.8;
bounds.phase(2).finaltime.upper = 2.9;
bounds.phase(2).initialstate.lower = [x2min(1:8) 0 0 0 0 -Tmax -Tmax -Tmax];
bounds.phase(2).initialstate.upper = [x2max(1:8) 0 0 0 0 Tmax Tmax Tmax];
% bounds.phase(2).initialstate.lower = [xj 0 0 0 0 -Tmax -Tmax -Tmax];
% bounds.phase(2).initialstate.upper = [xj 0 0 0 0 Tmax Tmax Tmax];
bounds.phase(2).state.lower = [x2min -Tmax -Tmax -Tmax];
bounds.phase(2).state.upper = [x2max Tmax Tmax Tmax];

bounds.phase(2).finalstate.lower = [x2min -Tmax -Tmax -Tmax];
bounds.phase(2).finalstate.upper = [x2max Tmax Tmax Tmax];

% bounds.phase(1).finalstate.lower([1,3,5]) = [0,0,0];%x10;
% bounds.phase(1).finalstate.upper([1,3,5]) = [0,0,0];%x10;

bounds.phase(2).control.lower = [u1min,u2min,u3min];
bounds.phase(2).control.upper = [u1max,u2max,u3max];

bounds.phase(2).integral.lower     = -1e3;
bounds.phase(2).integral.upper     = 1e3;


%%
% bounds.eventgroup(1).lower=-1e-2*[1];
% bounds.eventgroup(1).upper=1e-2*[1];

bounds.eventgroup(1).lower=-1e+1*[1 ];
bounds.eventgroup(1).upper=1e+1*[1 ];

bounds.eventgroup(2).lower= -1e-3*ones(1,12);
bounds.eventgroup(2).upper= 1e-3*ones(1,12);