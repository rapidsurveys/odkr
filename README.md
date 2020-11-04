# odkr: Open Data Kit (ODK) R API

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis](https://img.shields.io/travis/rapidsurveys/odkr.svg?branch=master)](https://travis-ci.org/rapidsurveys/odkr)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/rapidsurveys/odkr?branch=master&svg=true)](https://ci.appveyor.com/project/rapidsurveys/odkr)
[![codecov](https://codecov.io/gh/rapidsurveys/odkr/branch/master/graph/badge.svg)](https://codecov.io/gh/rapidsurveys/odkr)
[![CodeFactor](https://www.codefactor.io/repository/github/rapidsurveys/odkr/badge)](https://www.codefactor.io/repository/github/rapidsurveys/odkr)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1170514.svg)](https://doi.org/10.5281/zenodo.1170514)
[![CodeFactor](https://www.codefactor.io/repository/github/rapidsurveys/odkr/badge)](https://www.codefactor.io/repository/github/rapidsurveys/odkr)
<!-- badges: end -->


**Open Data Kit (ODK)** is a free and open-source set of tools which help 
organizations author, field, and manage mobile data collection solutions. ODK 
provides an out-of-the-box solution for users to:

* Build a data collection form or survey;
* Collect the data on a mobile device and send it to a server; and
* Aggregate the collected data on a server and extract it in useful formats.

`odkr` is a set of interface and utility tools for a **useR** working with ODK.
The package currently has two classes of functions: 1) *data processing* tools;
and, 2) *ODK-R interface* functions.

For *data processing*, there are currently three functions included which can be
used to perform typical data processing tasks associated with working with
ODK-collected datasets such as renaming variables in a dataset, expansion of
responses to questions that allow more than one answer and merging of nested
datasets.

For *ODK-R interface*, included are a set of functions that work via a command
line interface with the Java application **ODK Briefcase** for fetching and 
pushing Open Data Kit (ODK) forms and their contents. It can be used to gather and 
aggregate data from the mobile client **ODK Collect** when there is no internet 
connectivity, when there is no **ODK Aggregate Server** set-up or when an **ODK 
Aggregate Server** is not preferred. Current production version of 
**ODK Briefcase** is v1.8.0 and an executable `.jar` file can be downloaded from 
the Open Data Kit [website](https://opendatakit.org/use/briefcase/).

As of **ODK Briefcase** version 1.4.4, a scriptable command line interface (CLI)
to the Java application has been available. This package provides an R interface
to **ODK Briefcase** via the available CLI to pull forms from a remote **ODK Aggregate 
Server** or from a local ODK folder `/odk` collected from mobile clients. This 
package has a function that downloads the latest version of **ODK Briefcase** 
(currently v1.8.0) and additional functions that use the CLI of **ODK Briefcase**
to perform data extraction and data export. This package requires Java 8 installed. 
Java 8 can be downloaded from [here](https://java.com/en/download/).

## Requirements
The ODK-R interface component of this package requires **Java 8** to be installed 
in your computer. There are known [issues](https://forum.opendatakit.org/t/odk-briefcase-not-running-with-jdk-9/10201) 
when using ODK Briefcase with **Java 9**. If you have **Java 9** installed, 
uninstall (on [Windows](https://www.java.com/en/download/help/uninstall_java.xml); on [macOS](https://www.java.com/en/download/help/mac_uninstall_java.xml)) and
then [install](https://java.com/en/download/) **Java 8**. If issues persist even
with **Java 8**, you may need to reconfigure **Java**. On the terminal, execute the
following command:

```shell
R CMD javareconf
```

If reconfiguring **Java** still doesn't solve the issue, you may need to specify
`JAVA_HOME` by executing the following command in terminal:

```shell
sudo R CMD javareconf JAVA_HOME=/usr/java/default
```

## Installation

Install `odkr` from CRAN:

```R
install.packages("odkr")
library(odkr)
```

Install development version of `odkr` by installing devtools and then installing
`odkr` package via git

```R
# install.packages("devtools")
devtools::install_github("validmeasures/odkr")
library(odkr)
```

## Usage

### Data processing functions

**1. Rename variables of an ODK-collected dataset**

Depending on how you have designed and structured your ODK form, the standard 
naming of variables of the output dataset isn't always desirable for eventual
data processing and analysis. For example, for ODK forms that groups questions
into modules or sets, ODK would append the grouping name as a prefix to the
actual name assigned to a variable usually separated by a `/` or a `.`.

The `renameODK()` function extracts the actual variable name assigned when
designing the form by removing the prefix grouping labels. This can be done by
simply applying the `renameODK()` to the data.frame as follows:

```R
renameODK(sampleData1)
```

**2. Expand multiple answer responses**

For survey questions that allow for multiple answers to be provided, the
`expandMultChoice()` function recodes this into multiple columns with `0/1` coding
the number of which is equivalent to the number choices that were selected by
respondents. This function can be called as follows:

```R
# Expand the choices in variable ws7
expandMultChoice(answers = renameODK(sampleData2)$ws7)
```

**3. Merge nested datasets**
For ODK forms with a `repeat` argument, the resulting dataset splits the data
into each of the repeats. Often, these multiple datasets need to be merged to a
parent dataset (usually data containing common identifiers such as cluster, household).
The `mergeNestedODK()` function merges together these datasets using the ODK-defined
`KEY` and `PARENT-KEY` variables. The function can be called as follows:

```R
mergeNestedODK(parent = renameODK(sampleData1),
               child = renameODK(sampleData2))
```

### ODK-R interface functions

Following are the ODK interface functions in the `odkr` package. However, before
these functions can be utilised, a local copy of **ODK Briefcase** needs to be
downloaded and it would be through this local copy of **ODK Briefcase** that the 
other functions will integrate wit ODK databases.

To download the latest version of **ODK Briefcase**, the `get_briefcase()`
function can be utilised as follows:

```R
get_briefcase(destination = "~/Desktop")
```

will download the latest version of **ODK Briefcase** in your `Desktop` and rename 
it as `odkBriefcase_latest`. Specifying the destination directory for **ODK Briefcase**
is required.

If it is preferred to save the **ODK Briefcase** with a different filename, the 
following command can be issued in R:

```R
get_briefcase(destination = "~/Desktop", briefcase = "odkTool")
```

This will save a local copy of **ODK Briefcase** in the `Desktop` and name it as
`odkTool.jar`.

Downloading **ODK Briefcase** can be done only once unless you want to update to
the latest version of **ODK Briefcase** from a previously downloaded older version.

Once you have downloaded **ODK Briefcase**, the following functions can be 
utilised to integrate with ODK databases.


**1. Pull forms from a remote ODK Aggregate Server**
If you have an **ODK Aggregate Server** already setup receiving form submissions
from your survey, you can use `odkr` to pull these forms (not the data) into
a local directory.

For example, you want to pull ODK form with form id `stakeholders` from your 
remote **ODK Aggregate Server** (i.e., ONA) `https://ona.io/validtrial/` to a 
local directory `~/Desktop` using your **ODK Aggregate Server** account with 
***username*** `validtrial` and 
***password*** `zEF-STN-5ze-qom`. The `pull_remote` function from `odkr` can be
used as follows:

```R
pull_remote(target = "~Desktop",
            id = "stakeholders",
            to = "~/Desktop",
            from = "https://ona.io/validtrial/"
            username = "validtrial",
            password = "zEF-STN-5ze-qom")
```

In this example, you will note that we are using a previously downloaded
**ODK Briefcase** saved in the `Desktop`. The `target` specification can be
changed to the directory where you have previously saved **ODK Briefcase**.

After the operation has been completed, you would now be able to see a folder
named **ODK Briefcase Storage** on your `Desktop` containing the forms and
instances from the stakeholders form on the **ODK Aggregate Server**.


**2. Pull forms from a local `/odk` folder extracted from ODK Collect**
If you do not have an **ODK Aggregate Server** setup and plan to use **ODK
Briefcase** as your form aggregator, you will have to extract/copy the `/odk` 
folder in your mobile client to a location in your computer (e.g., `~/Desktop`) 
to which you can apply the `pull_local` function to pull out the forms and
instances to a local directory (e.g., `~/Desktop`) as follows:

```R
pull_local(target = "~/Desktop",
           id = "stakeholders",
           to = "~/Desktop",
           from = "~/Desktop")
```

In this example, you will note that we are using a previously downloaded
**ODK Briefcase** saved in the `Desktop`. The `target` specification can be
changed to the directory where you have previously saved **ODK Briefcase**.

After the operation has been completed, you would now be able to see a folder
named **ODK Briefcase Storage** on your desktop containing the forms and
instances from the stakeholders form on the **ODK Aggregate Server**.


**3. Export data from an ODK Briefcase Storage into a CSV file**
If you have pulled your forms from either a remote **ODK Aggregate Server** or
a local `/odk` folder and now have an **ODK Briefcase Storage** in one of your
local directories, you will probably want to extract the data found in these
forms for use in other purposes e.g., data analysis.

The `export_data` function allows you to extract data from a local **ODK
Briefcase Storage** (e.g., found in your `~/Desktop`) containing a form 
`stakeholders` and save it in a local directory (e.g., `~/Desktop`) as a `.csv`
file named `test.csv` as follows:

```R
export_data(target = "~/Desktop",
            id = "stakeholders",
            from = "~/Desktop",
            to = "~/Desktop",
            filename = "test.csv")
```
