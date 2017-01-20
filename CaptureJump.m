sim('Resample1')
sim('Resample2')
time1=state1Resampled(:,1);
state1=state1Resampled(:,2:end);
control1=control1Resampled(:,2:end);

time2=state2Resampled(:,1)+time1(end);
state2=state2Resampled(:,2:end);
control2=control2Resampled(:,2:end);
%%
figure(100), hold on,clf
v = VideoWriter('jump_flip10.avi');
open(v);
set(gca,'nextplot','replacechildren');
mass=61.9;
thighmassp=0.1478;
shankmassp=0.0481;
footmassp=0.0129;

for i=1:1:size(time1,1)
    x=state1(i,:);
    P=positions(x);
clf
% plot([foot1(i,1),foot2(i,1)],[foot1(i,2),foot2(i,2)],'b'), hold on
plot(P(1),P(2),'O','MarkerSize',30,'MarkerFaceColor','k'), hold on
plot([P(9),P(11)],[P(10),P(12)],'g','Linewidth',8), hold on
plot([P(7),P(11)],[P(8),P(12)],'g','Linewidth',8), hold on
plot([P(7),P(9)],[P(8),P(10)],'g','Linewidth',8), hold on
% plot([P(7),0],[P(8),0],'b','Linewidth',8), hold on
plot([P(7),P(5)],[P(8),P(6)],'b','Linewidth',8), hold on
plot([P(5) ,P(3)], [P(6), P(4)],'r','Linewidth',8), hold on
plot([P(3) ,P(1)], [P(4), P(2)],'k','Linewidth',8), hold on
PCM=positionsCM(x);
plot(PCM(1),PCM(2),'o','MarkerSize',15,'MarkerFaceColor','k')
plot(PCM(3),PCM(4),'o','MarkerSize',15,'MarkerFaceColor','r')
plot(PCM(5),PCM(6),'o','MarkerSize',15,'MarkerFaceColor','b')
plot(PCM(7),PCM(8),'o','MarkerSize',15,'MarkerFaceColor','g')
CMx=(PCM(1)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(3)*thighmassp+...
    PCM(5)*shankmassp+...
    PCM(7)*footmassp);
CMy=(PCM(2)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(4)*thighmassp+...
    PCM(6)*shankmassp+...
    PCM(8)*footmassp);
plot(CMx,CMy,'o','MarkerSize',15,'MarkerFaceColor','b')
xlim([-1 1])
ylim([0 2])

% dt=time1(i+1)-time1(i);
% pause(dt/1)
drawnow
   frame = getframe;
   writeVideo(v,frame);
end

for i=1:1:size(time2,1)
    x=state2(i,:);
    P=positions(x);
    xP=state2(i,9);
    yP=state2(i,11);
clf
plot(xP+P(1),yP+P(2),'O','MarkerSize',30,'MarkerFaceColor','k'), hold on
plot([xP+P(9),xP+P(11)],[yP+P(10),yP+P(12)],'g','Linewidth',8), hold on
plot([xP+P(7),xP+P(11)],[yP+P(8),yP+P(12)],'g','Linewidth',8), hold on
plot([xP+P(7),xP+P(9)], [yP+P(8),yP+P(10)],'g','Linewidth',8), hold on
% plot([xP+P(7), xP+0]   , [yP+P(8), yP+0]   ,'b','Linewidth',8), hold on
plot([xP+P(7) ,xP+P(5)], [yP+P(8), yP+P(6)],'b','Linewidth',8), hold on
plot([xP+P(5) ,xP+P(3)], [yP+P(6), yP+P(4)],'r','Linewidth',8), hold on
plot([xP+P(3) ,xP+P(1)], [yP+P(4), yP+P(2)],'k','Linewidth',8), hold on
PCM=positionsCM(x);
plot(xP+PCM(1),yP+PCM(2),'o','MarkerSize',15,'MarkerFaceColor','k')
plot(xP+PCM(3),yP+PCM(4),'o','MarkerSize',15,'MarkerFaceColor','r')
plot(xP+PCM(5),yP+PCM(6),'o','MarkerSize',15,'MarkerFaceColor','b')
plot(xP+PCM(7),yP+PCM(8),'o','MarkerSize',15,'MarkerFaceColor','g')
CMx=(PCM(1)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(3)*thighmassp+...
    PCM(5)*shankmassp+...
    PCM(7)*footmassp);
CMy=(PCM(2)*(1-thighmassp-shankmassp-footmassp)+...
    PCM(4)*thighmassp+...
    PCM(6)*shankmassp+...
    PCM(8)*footmassp);
plot(xP+CMx,yP+CMy,'o','MarkerSize',15,'MarkerFaceColor','b')
xlim([-1 1])
ylim([0 2])

% dt=time2(i+1)-time2(i);
% pause(dt/10)
drawnow
   frame = getframe;
   writeVideo(v,frame);
end
close(v)

JumpPlot