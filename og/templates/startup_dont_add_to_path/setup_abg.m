function out=setup_abg(varargin)
% attempts to add "functions" folder from specified custom toolbox name(s) to
% your Matlab path. No affect if they have already been added.
%
% syntax: setup_abg('custom_toolbox1','customtoolbox2')
%
% Dependencies
% - Will attempt to grab path to toolboxes from 'customtoolboxpath'
%   preference in 'greytaklab' preference group, asks user to set if absent

% 'isfolder' doesn't exist before 2017b (9.2): create a function handle
% that points to either 'isfolder' or 'isdir' as needed.
if(verLessThan('matlab','9.3'))
    foldercheck=@(c) isdir(c);
else
    foldercheck=@(c) isfolder(c);
end

if(~ispref('greytaklab','customtoolboxpath'))
    customtoolboxpath=uigetdir(userpath,'Choose parent directory for greytaklab custom toolboxes');
    setpref('greytaklab','customtoolboxpath',customtoolboxpath);
else
    customtoolboxpath=getpref('greytaklab','customtoolboxpath');
    if(~foldercheck(customtoolboxpath))
        customtoolboxpath=uigetdir(userpath,'Invalid customtoolboxpath preference, please select new');
        setpref('greytaklab','customtoolboxpath',customtoolboxpath);
    end
end
    
% If no input arguments, quit here. Running setup_abg() will ensure 'customtoolboxpath' preference
% is set, but does not do anything else.	
if(nargin==0)
	return
end
	
for(i=1:nargin)

	thistoolboxpath=fullfile(customtoolboxpath,varargin{i});

	if(foldercheck(fullfile(thistoolboxpath,'functions')))
		addpath(fullfile(thistoolboxpath,'functions'));
		disp(['Added functions for ' varargin{i} ' to path'])
	else
		disp(['Failed to find functions for toolbox ' varargin{i}]);
	end

    if(foldercheck(fullfile(thistoolboxpath,'functions/colormaps')))
		addpath(fullfile(thistoolboxpath,'functions/colormaps'));
		disp(['Added colormaps for ' varargin{i} ' to path'])
    end

end