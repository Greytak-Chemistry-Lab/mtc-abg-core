function [cm_data]=bluemap(m)
% return a blue colormap
%
% See also: colormap

if nargin < 1
    m=256;
end

notify_abg(sprintf('Creating colormap with %d values',m),0);

bluemap=zeros(m,3);
bluemap(:,3)=linspace(0,1,m);

cm_data=bluemap;
