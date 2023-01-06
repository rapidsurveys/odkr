# odkr (development version)

# odkr 0.3.2.9000

This is the fifth release of `odkr` (third development release). In this version,
the following have been implemented:

* updated the `pull_remote` and `push_data` functions to match new CLI syntax
for `ODK Briefcase`

* change license from `MIT` to `GPL3`

* removed hex logo as per feedback on ODK branding guidelines

* general package maintenance (documentation, external site)

* addressed issues raised by users with regard to package not installable; error
arising from a wrong .Rbuildignore specification

# odkr 0.3.1.9000

This is the fourth release of `odkr` (second development release).

# odkr 0.3.0.9000

This is the third release of `odkr`. This is a developmental release. `odkr` has
been archived in CRAN (see previous release). Current plan is to continue 
development of odkr outside of CRAN.

# odkr 0.2.0

In this version, I have implemented changes to respond to package issues from
[CRAN check results](https://cran.r-project.org/web/checks/check_results_odkr.html).

* The `get_briefcase()` function, I changed the download url for ODK Briefcase to
the permanent download url provided by the developers at https://github.com/opendatakit/briefcase.
This now resolves the issue of apparent download of corrupt jar file.

* All briefcase-related functions now include a check on runtime of Java availability
and Java version checking for a minimum Java version of Java 8. I followed the testing
script specified by CRAN in the *Writing R Extensions* manual.


# odkr 0.1.3

In this version, I have implemented the following changes:

* In the DESCRIPTION, all mention of Open Data Kit or ODK I have put in single quotes. In addition,
I put in single quotes mentions of ODK software derivatives such as ODK Briefcase
and ODK Aggregate to be consistent with format.

* In the DESCRIPTION, all mention of Java has been put in single quotes consistent
with format for software names.

* In the DESCRIPTION, added URL of Open Data Kit in angle brackets for auto-linking

* In the various functions, I have corrected mistake of specifying a default
write/save directory path. Instead, as advised, I have kept these as empty arguments
that user need to specify and placed check statements when user forgets to input
directory paths needed.

* As consequence of previous, I have re-coded the examples to use `tempdir()` as
suggested to specify a test location for arguments needing directory path inputs

* As consequence of previous, I have re-coded tests such that they use the new
specified syntax of no default write/save directories.


# odkr 0.1.2

* Resolve issue in testing specifically the test to check whether the function 
`export_data()` produces the output `test.cscv`. Upon checking, logs show that 
indeed `test.csv` is produced but the way the test is structured is that depending 
on build parameters, the test doesn't look for the `test.csv` file in the appropriate
location. For this, I re-worked both the test call to the function to specify
clearly where the output goes and then worked on the actual test to check in the
correct directory for `test.csv`.

# odkr 0.1.1

* Resolve issues with how `download.file()` handles downloads under the Windows
platform.

* In previous version, the `mode` argument in download file was not
specified. This was fine for Linux and macOS as downloaded file worked accordingly.

* For Windows, without specifying mode, downloaded file is recognised as either
invalid or corrupted hence producing the errors noted on testing. Now, the
`mode` argument has been set to `"wb"` in the `get_briefcase()` function.

# odkr 0.1.0

Initial release of `odkr`
