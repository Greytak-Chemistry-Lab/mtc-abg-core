# matlab toolbox for chemists (mtc) -- mtc-abg-core -- og variation

This repo contains essential tools on which other components of the Greytak lab MTC will depend. 
These include the functions and custom colormap in functions and functions/colormaps, and several 
files in templates/startup_dont_add_to_path that you will want to copy into your MATLAB settings folder,
rather than calling from this repo. The startup_template.m file will need to be renamed to startup.m 
after copying there, and modified as necessary to suit your Matlab installation and the file layout on your
computer.

## We are revising our approach to code management, and you can help!

If you are reading this elsewhere, please be aware this guide is now maintained directly in the mtc-abg-core repository on our Github site: all edits should be made there. 

The Greytak lab uses Matlab for a variety of purposes, such as rapid plotting and analysis of UV-visible absorbance and photoluminescence emission spectra.

This guide describes how we use revision control to manage, improve, and distribute Matlab code developed for use with our group. 
- For a more general introduction to using Matlab for plotting, calculations, and programming (using built-in Matlab commands), please see the tutorial [here](github.com/Greytak-Chemistry-Lab/matlab-chemists-tutorial).
- For a general discussion of repository organization within the [Greytak Chemistry Lab](https://greytak-chemistry-lab.github.io) on GitHub, see the README.md at the root level of this repository. 

## What we have: mtc toolboxes

-  _mtc-abg-core_: (this repo) includes startup script template, illustrates layout, hosts some overall documentation, and includes some low-level functions like ev() and yvsxf() as a starting point and as a demonstration of our approach. Also includes custom colormap definitions used by several of the other repos.
-  _mtc-abs-emis_: (coming soon) UV-vis and PL spectroscopy tools based on structures returned by qysetup() that have fields for absorbance and emission data, and several metadata fields including a flexible "extra" field.
-  _mtc-itc_: (coming soon) Tools for predicting and fitting isothermal titration calorimetry isotherms
-  _mtc-getpKa_: (coming soon) Tools for determining equilibrium constants from UV-vis data, especially for determining pKa and conjugate acid/base form spectra. Depends on mtc-abs-emis.


## Initial setup

### Install and activate Matlab, and start it, if you haven’t done so already. 

The first time you run it, it will create a folder called "MATLAB" (appears in your Documents folder in Windows: its location on disk is returned by “userpath” within Matlab). This is your personal matlab startup folder and is automatically added to your matlab path (search path it uses to look for functions when you type a command). 

- Matlab install tips here: Go to the UofSC affiliated MathWorks link. Click the ‘Sign in to get started’ button, it will lead to a page where you can provide your UofSC credentials and sign in. Upon completion this, it will tell you to ‘Sign in to your existing MathWorks Account’. If you have not created a MathWorks account yet, create your own Mathworks account. Then return to the previous page and ‘Sign in to your existing MathWorks Account’ using your email and the password that you used to open your MathWorks account. Then it will give you the option to download the MATLAB versions released in recent and previous years. In general, R2022a = MATLAB version released in Spring 2022, R2022b = MATLAB version released in Fall 2022.  
- Once you have setup and linked your account, you may download, install, and activate any previous version of Matlab. Particularly useful ones are Matlab 2015b (last 32 bit release, needed for ActiveX controls for Thorlabs motors using APT), and Matlab 2021a (64-bit, last release that had both “increment and run” and the Help reports in the current folder drop-down menu).

### Install Git

If you simply want to try out our tools, you can download any repo directly from Github as a .zip file, expand it, and off you go. But you probably want to follow the following procedure, especially if you are part of our group:

1. Create a GitHub account. It will ask for an email address and username. Your email address and username will be associated with any commits you make in the future. If you are a member of the Greytak research group, ask to be invited as a member of our Greytak-Chemistry-Lab organization. It's not a bad idea to use Google Authenticator for two-factor authentication on your GitHub account.

2. Download and install the basic git tools from [git-scm](https://git-scm.com): for Windows, this will be [Git for Windows](https://git-scm.com/install/windows), which will install Git-bash (a command-line tool using the bash shell) and Git-GUI (a graphical user interface, though many find it to be clunky compared to the command line or other tools listed below). You don't need to actually run it at this moment.

3. Download and install GitHub Desktop. This is the primary way we will clone new repositories and manage access. Once you've installed it, make sure you have your default web browser open and logged into GitHub with your account. Choose File &rarr; Clone repository and see if you can clone one of our repos, such as this one. Choose the "main" branch if it asks. Decide where, on your computer, to save your clone. Particularly for our Matlab tools, it will be helpful to have one folder where all of the Matlab repos from the Greytak lab will live. (This will become your "customtoolboxpath" setting in the "greytaklab" Matlab preferences group). For there, you are mostly all set with Git. You can Fetch or Pull updates from the Origin repo (on github.com), and commit changes to the origin (always add a commit message) if you are authorized to do that. We will not try to explain all usage of Github Desktop here, but you may decide you want to continue to step 4 below.

4. (Optional) If you are using Windows, consider installing [TortoiseGit](https://tortoisegit.org), a Windows shell extension that works similarly to Tortoise SVN. It can make it easy to see, in Windows, what files have changed, and to fetch (check updates) or pull (apply updates) from origin on multiple clones at a time. You will want to make sure you have checked out a repository with Github Desktop (or the command line tool) first, so that the Github https authentication is working correctly. On the TortoiseGit Settings window, under Git Credential, set Config Type to Global, and click Apply, and it should work, if you have previously got authentication working through GitHub Desktop.

5. Text editors. It is good idea to install a text editor like Notepad++ or VScode as well, to be able to inspect text files outside of Matlab.

### Initial Matlab setup

The "Matlab Toolbox for Chemists" is not set up as a real Matlab Toolbox. Instead, it makes use of a function called setup_abg() that will add selected folders from the mtc repositories to your Matlab path, and several settings saved in the "greytaklab" Matlab preferences group. These can be configured on startup by creating a (or modifying an existing) startup.m script. A template for this script, along with two functions that need to live in your Matlab startup folder, are found in the templates/startup_dont_add_to_path folder of this repo. Directions:

1. Run Matlab if you have not already. This should automatically create a MATLAB startup folder for you, which in Windows, is Documents/MATLAB for your user. 

2. With Matlab running, copy the three files myroot.m, setup_abg.m, and startup_template.m into your MATLAB folder. If you do not already have a startup.m file, rename startup_template.m to startup.m. If you do, you can copy content out of there and add it to your startup folder as needed.

3. Open startup.m in the Matlab editor. The essential parts are that it will first call setup_abg() with no arguments, and then later call setup_abg('mtc-abg-core/og'), which will specify the 'og' variation of this repository. Finally, it will call "cd(myroot)", which will change directory to a location you specify. The template should be ready to go, but you may wish to later add other mtc toolboxes, or add other folders to your path manually. Save startup.m.

4. Having done this, either restart Matlab, or type "startup" on the Matlab command line. If you haven't used our stuff before, it will bring up two dialog boxes asking you to specify two folder locations, which will then be saved as preferences for the future (unless you manually clear them later): 

- "customtoolboxpath": the parent directory for your mtc repositories. All of the toolbox names passed to setup_abg() will be assumed to be relative paths from there.
- "myroot": a "home" directory in which you expect to find most of the data you will be working with. This is less important, but is nice as it gives you a consistent starting location and you can refer to it in scripts to find things by relative paths from there.
 
5. Now try quitting and restarting Matlab. Hopefully it will greet you with a startup message and will not bother you with the dialog boxes. Our core functions should now be found in your Matlab path, and you should be able to navigate to demo_for_eV_and_yvsxf.m and run the commands in there successfully.
 
## What is in here
 
When given the name of a mtc toolbox (which should be specified as toolboxname/variation-version, so mtc-abg-core/og or mtc-abg-core/og-0.1), setup_abg will automatically add the 'functions' and 'functions/colormaps' folders within it to your Matlab path. Let's explore what's in this mtc-abg-core repo specifically.
 
- functions
     - constants_assign.m: uses 'assignin' to assign a bunch of fundamental constants in your root workspace, in SI units. Check code for details.
     - ev.m: a very simple function that, in an elementwise manner, converts photon wavelengths in nanometers to energies in electron-volts.
     - notify_abg.m: a notification and logging tool that simplifies debugging. Instead of giving status messages using disp(), a program can call notify_abg with a specified notification level, and you will see the message or not depending on the log level you have set.
     - yvsxf.m: this is a very powerful little tool that accepts two vectors of X and Y data, and returns a function handle (essentially a custom function that lives in your workspace) that will subsequently give linear-interpolated Y value(s) for *any* X value(s) you pass to it later. This is very helpful for adding and subtracting spectra that might not have the same X range or data spacing.
     - functions/colormaps: a folder with a series of functions that return colormaps of a desired length (default=256 levels), with some useful properties. Type "help mtc-abg-core/og/functions/colormaps" to see a description. 'redbluemap' is great for color maps of data that might be positive or negative.
- templates: besides the startup files to copy, it contains:
     - demo_for_eV_and_yvsxf.m: a template illustrating how to use ev.m and yvsxf.m to work with a representative spectrum, here, a low-resolution spectrum of gas-phase hydrogen chloride at the first vibrational overtone. Our toolboxes will usually have a template script illustrating how to use some of its capabilities. We presume that you would copy this template *outside of the repository* and modify it as needed to look at particular samples and preparing the graphics you want, while continuing to call the functions from the repo(s), which should normally only need editing to fix bugs or add features.
- example_data: our toolboxes usually come with some representative data for the templates to look at
     - HCl_vibrational_overtone: A subfolder with a CSV file with data, and a README.txt accompanying to explain what it is. It's nice to contain the dataset in a subfolder, so that we could have multiple example data sets in the future without them getting mixed up.
    
## Getting help

To the extent possible, our tools are documented internally, using the help blocks (first N contiguous lines of comments) in the Matlab function files, and step-by-step explanatory comments in the templates. Note the Matlab command-line help system:

- For one function or script: "help functionname" will print the help block for the function, as long as it is somewhere in your path. "See also" lines can appear as hyperlinks. Try "help yvsxf" or help "redmap"
- You can also call help on a folder and it will print a list of all the .m files within it, and the first comment line (which should be a summary of what it is for): try "help 'mtc-abg-core/og/functions'"
- Earlier versions of Matlab includ the commands 'helprpt', 'dofixrpt', and 'deprpt' that can inspect help, comment lines flagging issues, and check dependencies on files or folders.
- Ask us! The worst we can do, if you are some random on the internet, is not respond. 





