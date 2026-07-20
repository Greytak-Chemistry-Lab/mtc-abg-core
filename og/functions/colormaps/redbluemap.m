function [cm_data]=redbluemap(m)
% return a colormap for images with positive and negative data values
%
% low = red, mid = white, hi = blue, 0 = black
% See also: colormap

if nargin < 1
    m=256;
end

m=round(m-mod(m,2));

notify_abg(sprintf('Creating colormap with %d values',m),0);

redbluemap=ones(m,3);
redbluemap(1:m/2,2)=linspace(0,1,m/2);
redbluemap(1:m/2,3)=linspace(0,1,m/2);
redbluemap(m/2 + 1:m,1)=linspace(1,0,m/2);
redbluemap(m/2 + 1:m,2)=linspace(1,0,m/2);
redbluemap(1,:)=0;

cm_data=redbluemap;
