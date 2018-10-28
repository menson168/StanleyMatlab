% Setup file for vehicle_animation_sim.slx which is a simple 2D steering
% vehicle model and animation. See Readme.mdc.txt for more.
%
% This file should always be run before the simulation.
%
% Marc Compere
% comperem@erau.edu
% created : 30 July 2011
% modified: 17 Jan 2016

clear; clear all ; clear functions

% Path Description
%pathX = [1:80];
%pathY = [[1:20],20.*ones(1,30),[21:50]];

% Joey's Path
AX = [0,20,40,60,70,80,90,100,120,130,140,150,160,170];
AY = [0,4,0,3,3,3,10,10,15,15,15,15,15,15];
interval = length(0:0.1:100);
pathX = linspace(0,max(AX),interval);
pathY = spline(AX,AY,pathX);

% ----------------------------------------------
% -------  swarm and control parameters  -------
% ----------------------------------------------
vehicle_length = 2.5; % (m) %5m
%vehicle_length = 0.1; % (m)
vehicle_width  = 1.7; % (m) %2m

index = 1;

X_ic = pathX(1); % (m) random ICs on X position, note: rand() is on [0 1]
Y_ic = pathY(1); % (m) random ICs on Y position
%yaw_ic = 2*pi*(rand(nAgents,1)-0.5); % (rad) random ICs for yaw, or heading
yaw_ic = atan2((pathY(2)-pathY(1)),(pathX(2)-pathX(1))); % (rad) random ICs for yaw, or heading

% Path Description
%pathX = [2.82203149737370e-10,0.487401788450235,0.974803576618267,1.46220536478630,1.94960715295433,2.43700894112236,2.92441072929040,3.41181251745843,3.89921430562646,4.38661609379449,4.87401788196252,5.28963954759204,5.70526121322155,6.12088287885106,6.53650454448057,6.95212621011009,7.36774787573960,7.78336954136911,8.19899120699862,8.61461287262814,9.03023453825765,9.35103460437341,9.67183467048917,9.99263473660494,10.3134348027207,10.6342348688365,10.9550349349522,11.2758350010680,11.5966350671837,11.9174351332995,12.2382351994153,12.4996610889923,12.7610869785693,13.0225128681463,13.2839387577233,13.5453646473003,13.8067905368773,14.0682164264544,14.3296423160314,14.5910682056084,14.8524940951854];
%pathY = [0.764759771593376,-0.280669520960682,-1.32609881351474,-2.37152810606880,-3.41695739862285,-4.46238669117691,-5.50781598373097,-6.55324527628503,-7.59867456883908,-8.64410386139314,-9.68953315394720,-10.6252568071946,-11.5609804604420,-12.4967041136894,-13.4324277669368,-14.3681514201842,-15.3038750734316,-16.2395987266790,-17.1753223799264,-18.1110460331738,-19.0467696864211,-19.6533766222504,-20.2599835580797,-20.8665904939089,-21.4731974297382,-22.0798043655674,-22.6864113013967,-23.2930182372259,-23.8996251730552,-24.5062321088844,-25.1128390447137,-25.6897609694739,-26.2666828942341,-26.8436048189943,-27.4205267437545,-27.9974486685147,-28.5743705932749,-29.1512925180351,-29.7282144427953,-30.3051363675555,-30.8820582923156];


% ---------------------------------------------
% -----  solver and animation parameters  -----
% ---------------------------------------------
h_fixed = 0.05; % (s) fixed solver simulation stepsize

plotAxisLimitMode = 0; % 0->auto, 1->fixed, use Axes Limits in 'plotAxisLimits'
%plotAxisLimits = [-3 5 -3 6]*20; % [xmin xmax ymin ymax]
plotAxisLimits = [-3 5 -3 6]*3; % [xmin xmax ymin ymax]

%anim_fps=20; % (animation frames / second)
anim_fps=10; % (animation frames / second)
%anim_fps=2; % (animation frames / second)
enable_CG_trace=1;       % (0/1) plot animation trace from vehicle CG, or geometric center
enable_rearAxle_trace=1; % (0/1) enable animation trace from rear axle

save_anim_frames=0; % (0/1) save animation frames? this slows the simulation considerably
                    %       when writing a .jpeg image to file at each animation interval. 
                    %       see writeVideo() at this link for converting into .avi movies:
                    %       http://www.mathworks.com/help/matlab/examples/convert-between-image-sequences-and-video.html)

% animation update rate assuming Simulink clock advances very nearly the wall clock
C = round(1/(anim_fps*h_fixed)); % see notes below
animation_update_interval=C*h_fixed; % (s) This parameter controls three things:
                                              %     (1) The animation update to the screen is updated at this
                                              %         rate which needs to be an integer multiple of fixed stepsize integration. 
                                              %     (2) A frame is saved on this interval during movie makin (i.e. when movie_parm.save_frames=1)
                                              %     (3) how close to (or how much faster than) real-time the simulation runs.
                                              %         See timing_notes.txt for more information on run speeds.


%radius = abs( vehicle_length / (-0.5) ); % (m) turn radius = L / R
%circumference = 2*pi*radius; % (m) distance traveled around the circle, once
%note: at v_x = 1(m/s), time for 1 revolution is circumference, or t=dist/vel 
                                              
% bring up the simulink model
vehicle_animation_sim



