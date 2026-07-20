# matlab toolbox for chemists: Greytak research group

This repository contains core functions and setup instructions for the Greytak lab's "matlab toolbox for chemists" (mtc), and some example data (an infrared spectrum of hydrogen chloride). It is designed to work alongside various other "mtc" toolboxes that expand it, such as "mtc-abs-emis" for (primarily UV-vis and PL) spectroscopy, and "mtc-itc" for isothermal titration calorimetry planning and data analysis (coming soon).

See also our "Matlab chemist's tutorial", which is meant as an introduction to Matlab and does not depend on the custom functions in the mtc.

For more information about our laboratory see the Greytak Chemisty Lab's [GitHub Pages site](https://greytak-chemistry-lab.github.io), or our group website.

## Our approach to toolbox layout

Each toolbox repo will contain one or more subfolders with **variations** of the toolbox itself (explained more below). One such folder is the "original" variation, "og". A user should only be using one variation at a time.

Within each such variation, the following folders should exist:

- **example_data** (example data sets to try out the program: each data set in a subfolder, usually)
- **functions** (programs that can be called: will be added to path)
- **templates** (scripts and setup: these may be simple, demonstrating the behavior of the functions, or complex, loading data and generating a series of figures etc, but it's expected that they would be sample dependent and the user would copy them outside of the repository to modify for analysis of real data on specific samples)
- **resources** (optional: non-code with background info, math derivations in Maple, etc)

Each variation should also include a README at its root level explaining what it does. The entire repo should also have a README at its root level (like this one) explaining the purpose of the toolbox, and referring to this one for a basic explanation of toolbox and repository layout.

## Our approach to git repositories

Our work will be reasonably compartmentalized into repositories (projects) that each serve some purpose. Some may depend on others: in particular, many Matlab projects will depend on our core tools.

Projects will be public, or private to our organization. Our planned mode of operation is that a project will be private until the first paper describing it is published, after which time it will be public. Development will continue in the public repo, rather than trying to maintain parallel construction. As a result, projects should receive names that are reasonably clear and descriptive. Comments and content in projects can be brief or informal, but should not be embarrassing or distracting once the code becomes publicly accessible.

Matlab projects will be designed to be collected within a particular folder (set as your "customtoolboxpath" preference in the greytaklab preference group), so that folders can be added to the Matlab path in a consistent manner.

Each project will proceed through "variations" and "versions". These will refer to subfolders that each include a replicate of the entire project. A user will only be using a single variation/version at a time. All variations and versions will live in the same ("main") branch of the git repo. This simplifies administration by not requiring all lab members to understand the details of git branching/merging/pull requests etc. The maintainer of the repo may still choose to use branches on a short-term basis for some kind of experiment or bug fix.

Each repo will have one or more maintainers who are able to commit changes. The number of maintainers will be small -- usually Greytak and one student -- for continuity of style within the project. Other fixes or additions can be made by first demoing it in your own repository (everyone will have a sandbox repo within our lab's Github organization, and you may host your own stuff elsewhere or statically on the Z: drive), and then asking the maintainer to copy it into the shared project.

"Variations" will refer to some major stage of development or intended features for a project. If you have something that was a collection of scripts and you are now making a GUI, or you want to make some significant changes that may break compatibility with older work, it might be time to make a new "variation". Variations will have a name to identify them -- but this can be a codename and need not specify what the variation is for, since that could be hard to describe and could evolve over time. For most projects, we will start with a special "variation": "og" (original / original gangster), representing the project as it was when it was set up (copied over from our Subversion repos, usually). We may also have a variation representing the latest stage of development of the project. If you are about to add a major new capability, or some big algorithm or data storage change that could affect compatibility, you will want to copy the latest variation to a new "variation" folder. You may later decide to copy successful developments back into the previous variation, but your new variation could also remove features and go in a different direction. Be sure to talk to the maintainer and your lab-mates. For some repos, "current" may exist as a variation, with previous variations (if any other than "og") carved off later.

"Versions" will refer to incremental development of a variation. Versions have a number. We will use them like "tags" in Subversion. Typically, the "current" version is just the folder with the variation name only. When we are about to implement an incremental change that could affect compatibility, or if we need to capture the project just as it was at the time of some publication, and for any situation where a program is to be used on laboratory hardware, we will copy the "current" variation folder to a folder with the same name, but with the version number appended. Version numbers will typically be 0.1, 0.2 etc until the variation is reasonably useful, and then 1.0, 1.1 etc. By the time you get to 2.0, maybe you want to start a new variation (or maybe not). Bug fixes and improved commenting can be applied (manually) to numbered "versions", but no changes should be made in them that will break compatibility. Usually, it will be preferable to do such things in the current version, rather than in a previous numbered one.

Folders will be named (within the repo) as: "variation-version" or just "variation" for the current version of each variation.

Example layout: (for our "matlab toolbox for chemists" core repo)

mtc-abg-core/og ... as it was set up
mtc-abg-core/fancy ... a variation with some improvements after bringing to Github (does not actually exist)
mtc-abg-core/fancy-1.0 ... a tagged "version" of fancy that will be reasonably static except for bug fixes



