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
