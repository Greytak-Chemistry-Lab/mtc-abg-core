function [cm_data]=ratiomap(m)
% return a colormap for ratio images, low=green, mid=yellow, hi=red, 0=black
%
% See also: colormap

if nargin < 1
    m=256;
end

m=round(m-mod(m,2));

notify_abg(sprintf('Creating colormap with %d values',m),0);

ratiomap=zeros(m,3);
ratiomap(1:m/2,1)=linspace(0,1,m/2);
ratiomap(m/2 + 1:m,1)=1;
ratiomap(1:m/2,2)=1;
ratiomap(m/2 + 1:m,2)=linspace(1,0,m/2);
ratiomap(1,:)=0;


cm_data=ratiomap;
