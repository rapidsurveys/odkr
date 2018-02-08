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
Iniial release of `odkr`
