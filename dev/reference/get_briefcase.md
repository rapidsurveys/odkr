# Updates pre-installed ODK Briefcase `jar` file to the latest version downloaded from <https://opendatakit.org>.

Updates pre-installed ODK Briefcase `jar` file to the latest version
downloaded from <https://opendatakit.org>.

## Usage

``` r
get_briefcase(destination = "", briefcase = "odkBriefcase_latest")
```

## Arguments

- destination:

  Path to directory where ODK Briefcase `.jar` file will be downloaded
  into

- briefcase:

  Filename of the downloaded ODK Briefcase `.jar` file. Default is
  `"odkBriefcase_latest"`

## Examples

``` r
  # Get latest version of ODK Briefcase and save in a temporary directory
    if (FALSE) { # \dontrun{
      dirPath <- tempdir()
      get_briefcase(destination = dirPath)
    } # }
```
