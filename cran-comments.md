## Re-submission - 7 February 2018
This is a re-submission. In this version, I have resolved issues with how 
`download.file()` handles downloads under the Windows platform. In the previous
version, the `mode` argument in download file was not specified. This was fine 
for Linux and macOS as downloaded file worked accordingly. For Windows, without 
specifying `mode`, downloaded file is recognised as either invalid or corrupted 
hence producing the errors noted on testing. Now, the `mode` argument has been 
set to `"wb"` in the `get_briefcase()` function. Following are the results of
the various tests performed for this re-submission.

## Test environments
* local OS X install, R 3.4.3
* ubuntu 12.04 (on travis-ci), R 3.4.2
* local ubuntu 16.04 install, R 3.4.3
* win-builder (devel and release)
* local windows 7 install, R 3.4.3
* windows (on appveyor), R 3.4.3

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies
This is a new release, so there are no reverse/downstream dependencies.
