# Package index

## Description

- [`odkr-package`](https://rapidsurveys.io/odkr/reference/odkr.md)
  [`odkr`](https://rapidsurveys.io/odkr/reference/odkr.md) : ODK
  Briefcase R API

## R-ODK interface via ODK Briefcase

- [`get_help()`](https://rapidsurveys.io/odkr/reference/get_help.md) :
  Get help with command line interface for ODK Briefcase

- [`get_briefcase()`](https://rapidsurveys.io/odkr/reference/get_briefcase.md)
  :

  Updates pre-installed ODK Briefcase `jar` file to the latest version
  downloaded from <https://opendatakit.org>.

- [`create_sd()`](https://rapidsurveys.io/odkr/reference/create_sd.md) :
  Function to create an ODK Briefcase Storage directory

- [`pull_local()`](https://rapidsurveys.io/odkr/reference/pull_local.md)
  :

  Pull ODK forms from a local ODK folder (`/odk`) collected from ODK
  Collect mobile clients

- [`pull_remote()`](https://rapidsurveys.io/odkr/reference/pull_remote.md)
  : Pull ODK forms from remote ODK Aggregate via ODK Briefcase

- [`push_data()`](https://rapidsurveys.io/odkr/reference/push_data.md) :
  Push ODK forms from local ODK Briefcase Storage folder to remote ODK
  Aggregate via ODK Briefcase

- [`export_data()`](https://rapidsurveys.io/odkr/reference/export_data.md)
  : Export data in CSV format from local ODK Briefcase Storage directory
  to a specified destination directory and a specified file name

## Data handling post-export

- [`expandMultChoice()`](https://rapidsurveys.io/odkr/reference/expandMultChoice.md)
  : Function to recode a choose-multiple column where multiple answers
  are recorded in the same element (e.g. "ab ac ad", "ef eg eh") to a
  data frame with multiple separate 0/1 columns e.g.:
- [`expand_choice()`](https://rapidsurveys.io/odkr/reference/expand_choice.md)
  : Function to expand response to a more than one answer multiple
  choice question coded as a concatenated string
- [`mergeNestedODK()`](https://rapidsurveys.io/odkr/reference/mergeNestedODK.md)
  : Retrieve parent data, matching to a nested (child) dataset by keys
  of a nested dataset exported from an ODK Aggregate Server.
- [`renameODK()`](https://rapidsurveys.io/odkr/reference/renameODK.md) :
  Rename column names of data exported from an ODK Aggregate Server or
  from ODK Briefcase into more usable and human readable variable names.

## Sample data

- [`sampleData1`](https://rapidsurveys.io/odkr/reference/sampleData1.md)
  : Sample dataset from an impact evaluation study of a mother and child
  nutrition programme in Kassala State, Sudan. This dataset contains
  cluster level data from the survey.
- [`sampleData2`](https://rapidsurveys.io/odkr/reference/sampleData2.md)
  : Sample dataset from an impact evaluation study of a mother and child
  nutrition programme in Kassala State, Sudan. This dataset contains
  information from mother respondents.
- [`sampleData3`](https://rapidsurveys.io/odkr/reference/sampleData3.md)
  : Sample dataset from an impact evaluation study of a mother and child
  nutrition programme in Kassala State, Sudan. This dataset contains
  information from child respondents.
