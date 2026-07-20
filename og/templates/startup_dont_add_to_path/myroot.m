function out=myroot()
% returns your customized home directory
%
% Dependencies:
% - Will attempt to grab your home directory from 'myroot' preference in
% 'greytaklab' preference group, asks user to set if absent or invalid

% 'isfolder' doesn't exist before 2017b (9.2): create a function handle
% that points to either 'isfolder' or 'isdir' as needed.
if(verLessThan('matlab','9.3'))
    foldercheck=@(c) isdir(c);
else
    foldercheck=@(c) isfolder(c);
end

% new way: flexible and backward-compatible
if(~ispref('greytaklab','myroot'))
    out=uigetdir(userpath,'Choose you preferred home directory (myroot)');
    setpref('greytaklab','myroot',out);
else
    out=getpref('greytaklab','myroot');
    if(~foldercheck(out))
        out=uigetdir(userpath,'Invalid myroot folder preference, please select new');
        setpref('greytaklab','myroot',out);
    end
end

% old way: simple
% out='E:\andrew\aaa_svn';

