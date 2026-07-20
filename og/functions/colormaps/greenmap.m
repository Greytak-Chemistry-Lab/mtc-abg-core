function [cm_data]=greenmap(m)
% return a green colormap
%
% See also: colormap

if nargin < 1
    m=256;
end

notify_abg(sprintf('Creating colormap with %d values',m),0);

greenmap=zeros(m,3);
greenmap(:,2)=linspace(0,1,m);

cm_data=greenmap;
