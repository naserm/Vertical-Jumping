%---------------------- Vertica Jumping Problem --------------------------%
%   A saggital stick figure model of human with 12 states and 3 inputs    %
%   Three spheres-on-plane contacts are used for foot-ground contact      %
%                             By Naser Mehrabi                            %
%-------------------------------------------------------------------------%
clc
clearvars
% addpath('C:/Users/nmehrabi/Dropbox/Projects/Jump/Commonfiles')
% delete('JumpContinuousADiGatorGrd.m', 'JumpEndpointADiGatorGrd.m', 'JumpContinuousADiGatorGrd.mat','JumpEndpointADiGatorGrd.mat')
auxdata=[];
load('DO_200')
%-------------------------------------------------------------------------%
%------------------ Provide Auxiliary Data for Problem -------------------%
%-------------------------------------------------------------------------%

ProblemBounds

%-------------------------------------------------------------------------%
%---------------------- Provide Guess of Solution ------------------------%
%-------------------------------------------------------------------------%

guess.phase(1).integral = 0;
guess.phase(1).state    =[(bounds.phase(1).initialstate.lower+bounds.phase(1).initialstate.upper)/2;
                          (bounds.phase(1).initialstate.lower+bounds.phase(1).initialstate.upper)/2;
                          (bounds.phase(1).finalstate.lower+bounds.phase(1).finalstate.upper)/2];% [bounds.phase.initialstate.lower; bounds.phase.finalstate.lower;bounds.phase.initialstate.lower];% ones(2,1)*x0(:)';
guess.phase(1).control  = [ 0,0,0;
                            0,0,0;
                            0,0,0;];
guess.phase(1).time     = [0.;.35;0.7];

guess.phase(2).integral = 0;
guess.phase(2).state    =[(bounds.phase(2).initialstate.lower+bounds.phase(2).initialstate.upper)/2;
                          (bounds.phase(2).initialstate.lower+bounds.phase(2).initialstate.upper)/2;
                          (bounds.phase(2).finalstate.lower+bounds.phase(2).finalstate.upper)/2];% [bounds.phase.initialstate.lower; bounds.phase.finalstate.lower;bounds.phase.initialstate.lower];% ones(2,1)*x0(:)';
guess.phase(2).control  = [ 0,0,0;
                            0,0,0;
                            0,0,0;];
guess.phase(2).time     = [0.7;.8;0.9];


guess.phase(1).state=state1;
guess.phase(2).state=state2;
guess.phase(1).control  =control1;
guess.phase(2).control  =control2;
guess.phase(1).time     = time1;
guess.phase(2).time     = time2;


j=4;k=1;

%%
%-------------------------------------------------------------------------%
%----------Provide Mesh Refinement Method and Initial Mesh ---------------%
%-------------------------------------------------------------------------%
methods={'hp-LiuRao-Legendre';'hp-LiuRao';'hp-PattersonRao';'hp-DarbyRao'};
mesh.method          =methods{3};
mesh.tolerance       = 1e-6;
mesh.maxiterations   = 20;%5;
mesh.colpointsmin    = 2;
mesh.colpointsmax    = 25;
N                    = 1;
mesh.phase(1).colpoints = 25*ones(1,N);
mesh.phase(1).fraction  = ones(1,N)/N;

mesh.phase(2).colpoints = 25*ones(1,N);
mesh.phase(2).fraction  = ones(1,N)/N;

mesh.phase(1).colpoints = output.meshhistory(end).result.setup.mesh.phase(1).colpoints;% 3*ones(1,N);
mesh.phase(1).fraction  = output.meshhistory(end).result.setup.mesh.phase(1).fraction;%  ones(1,N)/N;

mesh.phase(2).colpoints = output.meshhistory(end).result.setup.mesh.phase(2).colpoints;% 3*ones(1,N);
mesh.phase(2).fraction  = output.meshhistory(end).result.setup.mesh.phase(2).fraction;%  ones(1,N)/N;

%-------------------------------------------------------------------------%
%------------- Assemble Information into Problem Structure ---------------%
%-------------------------------------------------------------------------%
setup.mesh                            = mesh;
setup.name                            = 'Jumping-Problem_THREE';
setup.functions.endpoint              = @JumpEndpoint;
setup.functions.continuous            = @JumpContinuous;
setup.displaylevel                    = 2;
setup.auxdata                         = auxdata;
setup.bounds                          = bounds;
setup.guess                           = guess;
solver={'snopt','ipopt'};
setup.nlp.solver                      = solver{2};
setup.nlp.snoptoptions.tolerance      = 1e-11;
setup.nlp.snoptoptions.maxiterations  = 10000000;

setup.nlp.ipoptoptions.tolerance      = 1e-11;
setup.nlp.ipoptoptions.linear_solver  = 'ma57';%'mumps';%
setup.nlp.ipoptoptions.maxiterations  = 100000;

setup.derivatives.supplier            = 'sparseCD';%'adigator';%'analytic'%'sparseBD';%'sparseFD';%
% setup.derivatives.derivativelevel     = 'first';%'second';%
% setup.derivatives.dependencies        = 'sparse'%'full';% or  'sparseNaN';%



setup.method                          = 'RPM-Integration';%'RPM-Differentiation';%
setup.mesh                            = mesh;
scales={'automatic-guessUpdate';'automatic-bounds';'automatic-guess';'automatic-hybridUpdate';'automatic-hybrid';};%'none';
setup.scales.method                   = scales{j}; % I get the+ results by {1}

%-------------------------------------------------------------------------%
%----------------------- Solve Problem Using GPOPS2 ----------------------%
%-------------------------------------------------------------------------%
%%
tic
output = gpops2(setup);
timer=toc;
t_hms = datevec(timer./(60*60*24))         % Express ‘t’ As Fraction Of A Day, Then Use ‘datevec’ To Convert

%%
JumpPlot
drawnow
save('DO_200b_d15'); 