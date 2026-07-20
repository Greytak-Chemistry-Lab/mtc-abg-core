% Startup script template for greytaklab matlab setup_abg
% 
% If this script is re-named to "startup.m" and placed in your Matlab startup
% folder, which is "My Documents"\MATLAB as of R2008b, it will be run
% automatically when you start Matlab. You may want to customize it, 
% or add it to routines you already have.
% 
% You will also want to put the "setup_abg.m" and "myroot.m" functions in your 
% Matlab startup folder. These should not need to be changed.
%
% These functions will ask you to select a preferred "home directory" to be
% returned by myroot() in the future, and the parent directory for the
% Greytak lab's custom toolboxes (so the functions folders within can be
% added to your path), on first run. Preferences are set in the
% "greytaklab" preference group (run "getpref('greytaklab')" to see).

% First, we run setup_abg with no arguments, which will prompt you to specify the 
% parent directory for custom toolboxes ('customtoolboxpath' preference), if it 
% is not already set, since we need it here for adding legacy toolbox folders.
setup_abg()

%% legacy group toolboxes: add first, so new ones below will supercede
% by default, addpath adds these to the top, so the last specified is the
% first searched! Add any folders here that you want as a lower-priority
% fallback. If you don't have any, don't bother.

% functions developed by the Greytak lab for our group's research
% addpath(fullfile(getpref('greytaklab','customtoolboxpath'),'matlab-svn','toolbox'))


%% Our approach to adding custom Matlab projects developed by the group
% setup_abg will accept multiple strings specifying folders it should look
% for within your specified customtoolboxpath. Each is presumed to have a
% subfolder called 'functions' where executable functions live. It does not
% add subfolders, except for 'functions/colormaps'. If you want to add
% other custom folders, specify it as a separate toolbox string.
setup_abg('mtc-abg-core')

% setup_abg('mtc-abs-emis','mtc-itc')

% Modify and uncomment below to add a personal "sandbox" with your own
% additions and experiments.

% setup_abg('mtc-sandbox-andrew')

% We do this after the shared toolboxes so it's at the top of the search
% path, but it is best to not reuse names of functions from the shared
% toolboxes, or at least plan to merge in your changes soon.


%% Set default axes and label colors to BLACK
set(groot,{'DefaultAxesXColor','DefaultAxesYColor','DefaultAxesZColor'},{'k','k','k'})
disp('Set axes and labels default colors to black!')

%% Report current set of preferences
% Reports current preference settings. We hope to use preferences to
% replace certain literal values in functions such as limits for wavelength
% axis in uvvis display. Set using setpref or uisetpref. You can comment
% this out if you don't want to see it on startup.
disp('Greytak Lab Matlab Toolbox for Chemists ready to go. Current preferences:')
disp(getpref('greytaklab'))

%% change to our root directory for fun and profit
cd(myroot)
disp('Finished startup and switched to root directory.') 

