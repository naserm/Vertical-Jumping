function phaseout = JumpContinuous(input)

% input
% input.phase(phasenumber).state
% input.phase(phasenumber).control
% input.phase(phasenumber).time
% input.phase(phasenumber).parameter
%
% input.auxdata = auxiliary information
%
% output
% phaseout(phasenumber).dynamics
% phaseout(phasenumber).path
% phaseout(phasenumber).integrand

t1 = input.phase(1).time;
y1 = input.phase(1).state;
v1 = input.phase(1).control;

x1=y1(:,1:8);
u1=y1(:,9:11);

dy1=Dynamics_k1(t1,x1,u1);
dx1=[dy1 v1];
phaseout(1).dynamics=dx1;
phaseout(1).integrand=sum((v1/100).^2,2);
%% phase 2
t2 = input.phase(2).time;
y2 = input.phase(2).state;
v2 = input.phase(2).control;

x2=y2(:,1:12);
u2=y2(:,13:15);

dy2=Dynamics_k2(t2,x2,u2);
dx2=[dy2 v2];
phaseout(2).dynamics=dx2;
phaseout(2).integrand=sum((v2/100).^2,2);


