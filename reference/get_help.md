# Get help with command line interface for ODK Briefcase

Get help with command line interface for ODK Briefcase

## Usage

``` r
get_help(target = "", briefcase = "odkBriefcase_latest")
```

## Arguments

- target:

  Path to directory of ODK Briefcase `.jar` file. Directory path should
  match directory path used when calling
  [`get_briefcase()`](https://rapidsurveys.io/odkr/reference/get_briefcase.md).
  If ODK Briefcase `.jar` file was downloaded manually from
  <https://opendatakit.org>, `target` should match the directory path
  where `.jar` file has been downloaded into.

- briefcase:

  Filename of the downloaded ODK Briefcase `.jar` file. Default is
  `odkBriefcase_latest` to match the default filename used by
  [`get_briefcase()`](https://rapidsurveys.io/odkr/reference/get_briefcase.md).
  If ODK Briefcase `.jar` file was downloaded manually from
  <https://opendatakit.org>, filename should match the default filename
  used by Open Data Kit which is usually "ODK Briefcase vX.Y.Z
  Production.jar" where vX.Y.Z is the version number

## Value

Help notes on usage of ODK Briefcase via command line interface

## Examples

``` r
if (FALSE) { # \dontrun{
  dirPath <- tempdir()
  get_briefcase(destination = dirPath)
  get_help(target = dirPath)
} # }
```
