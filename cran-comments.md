## Release summary

This is the second CRAN release of `odkr`. In this version, I have implemented 
changes to respond to package issues from [CRAN check results](See https://cran.r-project.org/web/checks/check_results_odkr.html).

* The `get_briefcase()` function, I changed the download url for ODK Briefcase to
the permanent download url provided by the developers at https://github.com/opendatakit/briefcase.
This now resolves the issue of apparent download of corrupt jar file.

* All briefcase-releated functions now include a check on runtime of Java availability
and Java version checking for a minimum Java version of Java 8. I followed the testing
script specified by CRAN in the *Writing R Extensions* manual.

* In DESCRIPTION, I specified the minimum version of Java required for the package in
`SystemRequirements` (`Java (>= 8)`)

## Test environments
* local OS X install, R 3.5.0
* ubuntu 14.04.5 (on travis-ci), release, devel and oldrelease
* local ubuntu 16.04 install, R 3.5.0
* local windows, x64, R 3.5.0
* win-builder (devel and release)
* windows (on appveyor), x64 release and devel, i386 release and devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies
`odkr` doesn't have any downstream / reverse dependencies 
(see https://github.com/validmeasures/ppitables/tree/master/revdep)
