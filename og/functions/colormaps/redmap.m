function [cm_data]=redmap(m)
% return a red colormap
%
% See also: colormap

if nargin < 1
    m=256;
end

notify_abg(sprintf('Creating colormap with %d values',m),0);

redmap=zeros(m,3);
redmap(:,1)=linspace(0,1,m);

cm_data=redmap;
