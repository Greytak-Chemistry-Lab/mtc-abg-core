function out=ev(nm)
% return electron volts for input in nm: works on any size matrix
%
% Example:
% energies=ev([400 700])
% energies = 
% 3.0996 1.7712

h=4.135667696e-15;  % Planck's constant in eV-s
c=299792458;  % m/s

% using element-wise notation
lambda=nm*1e-9;
out=h*c./lambda;
