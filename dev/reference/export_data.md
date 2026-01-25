# Export data in CSV format from local ODK Briefcase Storage directory to a specified destination directory and a specified file name

Export data in CSV format from local ODK Briefcase Storage directory to
a specified destination directory and a specified file name

## Usage

``` r
export_data(
  target = "",
  briefcase = "odkBriefcase_latest",
  sd = FALSE,
  id = "",
  from = "",
  to = "",
  filename = paste(id, "_data.csv", sep = ""),
  start = NULL,
  end = NULL,
  overwrite = FALSE,
  exclude = TRUE,
  group.names = TRUE,
  split = FALSE,
  pem = NULL,
  pullBefore = FALSE,
  includeGeo = FALSE
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

- from:

  Path to source ODK Briefcase Storage from which to extract data. This
  should match directory path specified when making a call to
  [`pull_remote()`](https://rapidsurveys.io/odkr/dev/reference/pull_remote.md)
  or
  [`pull_local()`](https://rapidsurveys.io/odkr/dev/reference/pull_local.md)

- to:

  Destination directory to save output data file

- filename:

  Filename of output CSV data; default is
  `paste(id, "_data.csv", sep = "")`

- start:

  Include data from submission dates after (inclusive) this start date
  in export to CSV. Date format YYYY-MM-DD or YYYY/MM/DD

- end:

  Include data from submission dates before (inclusive) this date in
  export to CSV. Date format YYYY-MM-DD\> or YYYY/MM/DD

- overwrite:

  Overwrite existing output data in destination directory with the same
  filename; default is FALSE

- exclude:

  Exclude media files on export; default is TRUE

- group.names:

  Logical. Should group names be removed from column names on export?
  Default TRUE.

- split:

  Logical. Should select multiple fields be split on export? Default
  FALSE.

- pem:

  Path to pem key if using an encrypted form. Null by default.

- pullBefore:

  Logical. If set to true, pull before export. Default FALSE.

- includeGeo:

  Logical. If set to true, pull geojson. Default FALSE.

## Value

CSV file in destination directory containing data from the pulled forms

## Examples

``` r
# Export data from a specified ODK Briefcase Storage directory to current
# working directory with a filename called "test.csv"
if (FALSE) { # \dontrun{
  dirPath <- tempdir()
  get_briefcase(destination = dirPath)
  export_data(target = dirPath,
              from = dirPath,
              to = dirPath,
              id = "stakeholders",
              filename = "test.csv",
              overwrite = TRUE)
} # }
```
