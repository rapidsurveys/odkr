# Pull ODK forms from remote ODK Aggregate via ODK Briefcase

Pull ODK forms from remote ODK Aggregate via ODK Briefcase

## Usage

``` r
pull_remote(
  target = "",
  briefcase = "odkBriefcase_latest",
  sd = FALSE,
  id = "",
  to = "",
  from = "",
  include_incomplete = FALSE,
  max_http_connections = NULL,
  username,
  password
)
```

## Arguments

- target:

  Path to directory of ODK Briefcase `.jar` file. Directory path should
  match directory path used when calling
  [`get_briefcase()`](https://rapidsurveys.io/odkr/dev/reference/get_briefcase.md).
  If ODK Briefcase `.jar` file was downloaded manually from
  <https://opendatakit.org>, `target` should match the directory path
  where `.jar` file has been downloaded into.

- briefcase:

  Filename of the downloaded ODK Briefcase `.jar` file. Default is
  `odkBriefcase_latest` to match the default filename used by
  [`get_briefcase()`](https://rapidsurveys.io/odkr/dev/reference/get_briefcase.md).
  If ODK Briefcase `.jar` file was downloaded manually from
  <https://opendatakit.org>, filename should match the default filename
  used by Open Data Kit which is usually "ODK Briefcase vX.Y.Z
  Production.jar" where vX.Y.Z is the version number

- sd:

  Logical. If TRUE, create an ODK Briefcase Storage in the path
  specified by `to`. Default is FALSE.

- id:

  Form ID of form to be pulled

- to:

  Destination directory for pulled ODK forms

- from:

  URL of remote ODK Aggregate server to pull ODK forms data from

- include_incomplete:

  Logical. Should incomplete forms be pulled? Default to FALSE

- max_http_connections:

  Integer value for maximum simultaneous HTTP connections allowed.
  Defaults to NULL which will allow for the default 8 simultaneous HTTP
  connections. Specify this parameter if more simultaneous connections
  are required. Maximum value is 32.

- username:

  Username for account in remote ODK Aggregate server from which forms
  are to be pulled

- password:

  Password for account in remote ODK Aggregate server from which forms
  are to be pulled

## Value

Folder in destination directory named "ODK Briefcase Storage" containing
forms pulled from remote ODK Aggregate server

## Examples

``` r
  # Use latest ODK Briefcase and connect to a test
  # remote ODK Aggregate server from ONA (https://ona.io); pulled forms to
  # be saved in default location at current working directory
  if (FALSE) { # \dontrun{
  dirPath <- tempdir()
  get_briefcase(destination = dirPath)
  pull_remote(target = dirPath,
              id = "stakeholders",
              from = "https://ona.io/validtrial",
              to = dirPath,
              username = "validtrial",
              password = "zEF-STN-5ze-qom")
  } # }
```
