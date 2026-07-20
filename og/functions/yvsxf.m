function fhandle=yvsxf(xdata,ydata)
% Returns function handle giving linear interpolation using XDATA and YDATA as parameters. 
%
% Builds a function MYFUNC that uses interp1 to return y value(s)
% corresponding to any requested x value(s), using the provided YDATA and
% XDATA. MYFUNC returns zero and provides a warning if an x value outsite
% of the range of XDATA is requested. Some cleanup is performed to deal
% with any repeated XDATA values, which normally breaks interp1. 
%
% The function MYFUNC will always return a column vector of y values if a
% vector of x values is passed to it. If a matrix of x values is passed, it
% will return a matrix of y values with the same shape. x values do not
% have to be in any order and may be repeated.
%
% Example:
% absorbance_function = yvsxf(wavelengths,absorbances)
% my_abs = absorbance_function(450);    ... get absorbance at 450 nm
%   my_abs = 0.5
% 
% See also qysetup

% ensures vector shape interp1 will like
xdata=reshape(xdata,length(xdata),1);

% Deal with possible multivalued xdata: unique() returns a sorted list of
% unique values in xdata
[xdata_clean,ia,ic]=unique(xdata);
% indices ic indicate the positions in xdata that correspond to each
% position in xdata_clean. We will average the y values corresponding to
% all such positions.
ydata_clean=zeros(size(xdata_clean));
for(k=1:length(xdata_clean))
    ydata_clean(k)=mean(ydata(ic==k));
end

% put a handle to myfunc into fhandle
fhandle=@myfunc;

% here is the function we will prepare, and return a handle for to the
% caller
function out=myfunc(x)
    % If x is a vector (or scalar), we will always return a COLUMN vector
    % of y values. If x is a matrix, we will return a matrix of y values of
    % the same dimensions by modeling out after x, and using linear
    % addressing.
    if(isvector(x)) % note isvector returns true for scalars
        x=reshape(x,length(x),1); 
    end
    out=zeros(size(x)); 
    for(i=1:length(x(:)))
        if((x(i) < min(xdata_clean)) || x(i) > max(xdata_clean))
            out(i)=0;
            notify_abg('Value outside of xdata range was requested.',1);
        else
    %        out(i)=ydata(dsearchn(xdata,x(i)));
            out(i)=interp1(xdata_clean,ydata_clean,x(i));
        end
    end

end


end
