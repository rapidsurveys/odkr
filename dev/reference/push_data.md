# Push ODK forms from local ODK Briefcase Storage folder to remote ODK Aggregate via ODK Briefcase

Push ODK forms from local ODK Briefcase Storage folder to remote ODK
Aggregate via ODK Briefcase

## Usage

``` r
push_data(
  target = "",
  briefcase = "odkBriefcase_latest",
  id = "",
  to = "",
  from = "",
  force_send_blank = FALSE,
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

- id:

  Form ID of form to push ODK forms data into

- to:

  URL of remote ODK Aggregate server

- from:

  Directory containing ODK forms data to push to remote ODK aggregate
  server

- force_send_blank:

  Logical. Should blank form be forced into the Aggregate instance

- max_http_connections:

  Integer value for maximum simultaneous HTTP connections allowed.
  Defaults to NULL which will allow for the default 8 simultaneous HTTP
  connections. Specify this parameter if more simultaneous connection
  required

- username:

  Username for account in remote ODK Aggregate server from which forms
  are to be pulled

- password:

  Password for account in remote ODK Aggregate server from which forms
  are to be pulled

## Examples

``` r
  # Use latest ODK Briefcase and connect to a test
  # remote ODK Aggregate server from ONA (https://ona.io) to push ODK forms
  # data into
  if (FALSE) { # \dontrun{
  dirPath <- tempdir()
  get_briefcase(destination = dirPath)
  push_data(target = dirPath,
            id = "stakeholders",
            to = "https://ona.io/validtrial",
            from = dirPath,
            username = "validtrial",
            password = "zEF-STN-5ze-qom")
  } # }
```
