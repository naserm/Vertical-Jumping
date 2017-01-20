function output = JumpEndpoint(input)
% Inputs
% input.phase(phasenumber).initialstate -- row
% input.phase(phasenumber).finalstate -- row
% input.phase(phasenumber).initialtime -- scalar
% input.phase(phasenumber).finaltime -- scalar
% input.phase(phasenumber).integral -- row
%
% input.parameter -- row
% input.auxdata = auxiliary information
%
% Output
% output.objective -- scalar
% output.eventgroup(eventnumber).event -- row


xf2=input.phase(1).finalstate;

[VCM, VCMT]=velocitiesCM(xf2); % Mass center velocity
dx=xp_function_k1(0,xf2(1:8),xf2(9:11));
ddx=dx(:,[2,4,6,8]);
Fs=Fs_k1(xf2(1:8),ddx); % Joint contact force
obj1 = -200*VCMT(2)+0*VCMT(1)^2+1*input.phase(1).integral;
%% phase2
xf3=input.phase(2).finalstate;
x03=input.phase(2).initialstate;
P=positions(xf3);

obj2 = -1000*(P(2)+xf3(:,11))+input.phase(2).integral;
% obj2 = -10000*(xf3(:,11))+input.phase(2).integral;
%%
output.objective=obj1+obj2;
%%
t02=input.phase(2).initialtime;
tf1=input.phase(1).finaltime;
% output.eventgroup(1).event=[VCMT(1) ];
output.eventgroup(1).event=sqrt(Fs(1)^2+Fs(2)^2);
output.eventgroup(2).event=[t02-tf1 x03([1:8,13:15])-xf2([1:8,9:11])];% -- row