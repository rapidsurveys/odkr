# Pull ODK forms from a local ODK folder (`/odk`) collected from ODK Collect mobile clients

Pull ODK forms from a local ODK folder (`/odk`) collected from ODK
Collect mobile clients

## Usage

``` r
pull_local(
  target = "",
  briefcase = "odkBriefcase_latest",
  id = "",
  to = "",
  from = "",
  pem = NULL
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

  Form ID of form to be pulled

- to:

  Destination directory for pulled ODK forms

- from:

  Source ODK directory (`/odk`) from ODK Collect mobile client

- pem:

  If form to be pulled is encrypted, a PEM private key file would be
  required to pull forms; default is NULL; if form is encrypted, provide
  path to PEM file

## Value

Folder in destination directory named ODK Briefcase Storage containing
forms pulled from local ODK folder

## Examples

``` r
# Pull forms from a local ODK folder to current working directory
if (FALSE) { # \dontrun{
  dirPath <- tempdir()
  get_briefcase(destination = dirPath)
  pull_local(target = dirPath,
             id = "stakeholders",
             from = system.file("odk", package = "odkr"),
             to = dirPath)
} # }
```
