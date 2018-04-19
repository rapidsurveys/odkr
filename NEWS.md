# odkr v0.1.3
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


# odkr v0.1.2
* Resolve issue in testing specifically the test to check whether the function 
`export_data()` produces the output `test.cscv`. Upon checking, logs show that 
indeed `test.csv` is produced but the way the test is structured is that depending 
on build parameters, the test doesn't look for the `test.csv` file in the appropriate
location. For this, I re-worked both the test call to the function to specify
clearly where the output goes and then worked on the actual test to check in the
correct directory for `test.csv`.

# odkr v0.1.1
* Resolve issues with how `download.file()` handles downloads under the Windows
platform.
* In previous version, the `mode` argument in download file was not
specified. This was fine for Linux and macOS as downloaded file worked accordingly.
* For Windows, without specifying mode, downloaded file is recognised as either
invalid or corrupted hence producing the errors noted on testing. Now, the
`mode` argument has been set to `"wb"` in the `get_briefcase()` function.

# odkr v0.1.0
Initial release of `odkr`
