function varargout=constants_assign()
% fundamental constants in SI units 
%
% Provides values of fundamental constants in SI units. When called with an
% output argument, returns a structure with fields corresponding to
% constants. With no output argument, assigns constants as variables in the
% caller's workspace.
%
% Example:
% constants_assign()
% hbar = getfield(constants_assign,'hbar')
% constants = constants_assign()
%       constants = struct with fields
%              h: 6.6261e-34
%           hbar: 1.0546e-34
%             m0: 9.1094e-31
%             mp: 1.6726e-27
%             kB: 1.3807e-23
%             e0: 8.8542e-12
%              q: 1.6022e-19
%            N_A: 6.0221e+23
%              F: 9.6485e+04
%              c: 299792458
%              R: 8.3145
%       J_per_eV: 1.6022e-19
%     J_per_Latm: 101.3250

out.h=6.62607015e-34; % J-s
out.hbar=out.h/(2*pi()); % J-s
out.m0=9.1093837015e-31; % kg
out.mp=1.672622e-27; % proton mass, kg
out.kB=1.3806503e-23; % J/K
out.e0=8.8541878128e-12; % SI units = F/m or C/(V*m) or C^2/(J*m)
out.q=1.602176634e-19; % C
% TODO: A new value has been found for q
out.N_A=6.02214076e23; % mol^-1
out.F=out.q*out.N_A; % C/mol
out.c=299792458; % m/s
out.R=out.N_A*out.kB; % J / mol-K = Pa*m^3 / mol-K
out.J_per_eV=out.q;
out.J_per_Latm=8.31447/8.20574e-2;

if(nargout==0)
    foo=fieldnames(out);
    for(k=1:length(foo))
        assignin('caller',foo{k},out.(foo{k}))
    end
else
    varargout{1}=out;
end

% % possible option to enable user to select the units for R
%
% assignin('caller','R',N_A*kB); % J / mol-K = Pa*m^3 / mol-K
% 
% if(nargin==1)
%     switch unit_option
%         case 'L-atm'
%             assignin('caller','R',8.20574e-2)
%         case 'L-bar'
%             assignin('caller','R',8.31447e-2)
%         case 'L-Torr'
%             assignin('caller','R',6.23637e1)
%         otherwise
%             assignin('caller','R',N_A*kB)
%     end
% end
