% Demo script for loading data and using yvsxf
%
% This script relies on functions in mtc-abg-core. 

% Uncomment below to ensure those functions are added to your path, though,
% they should already be there if you've set up your startup.m file
% according to the template. If it is already set up, leave commented so we
% don't mess with the path search order specified in your startup.m.
% Calling this will bring the mtc-abg-core functions directory to the
% top:
% setup_abg('mtc-abg-core')

% use this approach to load example data in a platform-independent way
datadir=fullfile(getpref('greytaklab','customtoolboxpath'), ...
    'mtc-abg-core/og','example_data','HCl_vibrational_overtone');
filename='HCl-cary-overtone-spec-group2-spring-2020-sbw-0p6.csv';

A=importdata(fullfile(datadir,filename));

% so happens our data is in columns 3 and 4: can use manual ImportData
% wizard to inspect if desired
my_wavelengths=A.data(:,3);
my_absorbances=A.data(:,4);

% Let's plot the data and see how to use a couple of simple core functions,
% ev.m and yvsxf.m

subplot(4,1,1)
% straight-up raw data
plot(my_wavelengths,my_absorbances)
title('Absorbance vs wavelength')

subplot(4,1,2)
% get a function handle that will give us the absorbance for ANY wavelength
% without having to know which index of the my_absorbances vector it is:
my_abs_vs_nm_f=yvsxf(my_wavelengths,my_absorbances);
% try typing: my_abs_vs_nm_f(1750) 
% to see the absorbance at 1750 nm! (it
% does a linear interpolation, and warns us if we ask for a wavelength
% outside our data range)
plot(1720:1830,my_abs_vs_nm_f(1720:1830))
title('Absorbance vs selected wavelengths')

subplot(4,1,3)
% make the plot versus energy instead by using ev to get the energy for
% each wavelength value
plot(ev(my_wavelengths),my_absorbances)
title('Absorbance vs energy')

subplot(4,1,4)
% get a function handle that will give us the absorbance for ANY energy
% without having to know which index of the my_absorbances vector it is:
my_energies=ev(my_wavelengths);
my_abs_vs_eV_f=yvsxf(my_energies,my_absorbances);
plot([0.68:0.0001:0.72],my_abs_vs_eV_f([0.68:0.0001:0.72]))
title('Absorbance vs selected energies')
