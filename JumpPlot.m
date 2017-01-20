%-------------------------------------------------------------------------%
%                             Extract Solution                            %
%-------------------------------------------------------------------------%
solution = output.result.solution;
time1 = solution.phase(1).time;
state1 = solution.phase(1).state;
control1 = solution.phase(1).control;

time2 = solution.phase(2).time;
state2 = solution.phase(2).state;
control2 = solution.phase(2).control;

%-------------------------------------------------------------------------%
%                              Plot Solution                              %
%-------------------------------------------------------------------------%
figure(1);clf
subplot(5,4,1);plot(time1,state1(:,[1])*180/pi,'-');title('ankle'),hold on, plot(time2,state2(:,[1])*180/pi,'-');hold on, 
subplot(5,4,2);plot(time1,state1(:,[2]),'-');hold on, plot(time2,state2(:,[2]),'-');hold on, 
subplot(5,4,3);plot(time1,state1(:,[3])*180/pi,'-');title('knee'),hold on, plot(time2,state2(:,[3])*180/pi,'-');hold on, 
subplot(5,4,4);plot(time1,state1(:,[4]),'-');hold on, plot(time2,state2(:,[4]),'-');hold on, 
subplot(5,4,5);plot(time1,state1(:,[5])*180/pi,'-');title('hip'),hold on, plot(time2,state2(:,[5])*180/pi,'-');hold on, 
subplot(5,4,6);plot(time1,state1(:,[6]),'-');hold on, plot(time2,state2(:,[6]),'-');hold on, 
subplot(5,4,7);plot(time1,state1(:,[7])*180/pi,'-');title('contact'),hold on, plot(time2,state2(:,[7])*180/pi,'-');hold on, 
subplot(5,4,8);plot(time1,state1(:,[8]),'-');hold on, plot(time2,state2(:,[8]),'-');hold on, 
% subplot(5,4,11);
% plot(time1,state1(:,[9]),'-');hold on,
% plot(time2,state2(:,[9]),'-');hold on,
% subplot(5,4,12);
% plot(time1,state1(:,[10]),'-');hold on,
% plot(time2,state2(:,[10]),'-');hold on,
% subplot(5,4,13);
% plot(time1,state1(:,[9]),'-');hold on,
% plot(time2,state2(:,[11]),'-');hold on,
% subplot(5,4,14);
% plot(time1,state1(:,[10]),'-');hold on,
% plot(time2,state2(:,[12]),'-');hold on,
v=headvel(state1);
subplot(5,4,11); plot(time1,v(:,1),'-');hold on,title('headVx'),
subplot(5,4,12); plot(time1,v(:,2),'-');hold on,title('headVy'),
subplot(5,4,13); plot(time1,control1,'-');hold on, plot(time2,control2,'-');
subplot(5,4,17); plot(time1,state1(:,[9:11]),'-');hold on, plot(time2,state2(:,[13:15]),'-')
%%
dx=xp_function_k1(time1,state1(:,1:8),state1(:,9:11));
ddx=dx(:,[2,4,6,8]);
Fs=Fs_k1(state1,ddx);
subplot(5,4,15); plot(time1,Fs(:,1),'-');hold on,title('Fx'),%ylim([-1100 1100])
subplot(5,4,16); plot(time1,Fs(:,2),'-');hold on,title('Fz'),%ylim([-100 1100])
%%
for i=1:1:size(time1,1)
    x=state1(i,:);
    P1(i,:)=positions(x);
    i=i+1;
end    
subplot(5,4,9);plot(time1,P1(:,1),'-');hold on
subplot(5,4,10);plot(time1,P1(:,2),'-'); hold on
for i=1:1:size(time2,1)
    x=state2(i,:);
    P2(i,:)=positions(x);
    i=i+1;
end    
subplot(5,4,9);plot(time2,P2(:,1)+state2(:,[9]),'-');hold on, title('headX'),% plot(time2,state2(:,[8]),'-');hold on, 
subplot(5,4,10);plot(time2,P2(:,2)+state2(:,[11]),'-');hold on, title('headZ'),% plot(time2,state2(:,[8]),'-');hold on, 