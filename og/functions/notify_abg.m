function out=notify_abg(varargin)
% conditional reporting of status/debug messages
%
% out=notify_abg('message',notification_level)
% prints messages if notification_level is >= the 'log_level' preference in 'greytaklab'
% group. Levels: 0: oversharing, 1: debug (default), 2: info, 3: near-warning-level
% Example:
% notify_abg('Value of K should not be negative.',1)
%
% See also disp warning error setpref

if( ispref('greytaklab','log_level') )
    log_level=getpref('greytaklab','log_level');
else
    log_level=2;
    setpref('greytaklab','log_level',2);
    notify_abg('Setting log_level preference to 2="info"',2)
end

if(nargin==0)
    log_level=getpref('greytaklab','log_level');
    out=log_level;
    notify_abg(sprintf('Reporting log level=%d',log_level),0)
    return
end

notification_string=varargin{1};

if(nargin>1)
    notification_level=varargin{2};
else
    notification_level=1;
end

if(notification_level>=log_level)
    disp(notification_string)
end