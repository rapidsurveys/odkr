# odkr: ODK R API

[![CRAN](https://img.shields.io/cran/v/odkr.svg)](https://cran.r-project.org/package=odkr)
[![CRAN](https://img.shields.io/cran/l/odkr.svg)](https://CRAN.R-project.org/package=odkr)
[![CRAN](http://cranlogs.r-pkg.org/badges/odkr)](https://CRAN.R-project.org/package=odkr)
[![Travis](https://img.shields.io/travis/validmeasures/odkr.svg?branch=master)](https://travis-ci.org/validmeasures/odkr)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/validmeasures/odkr?branch=master&svg=true)](https://ci.appveyor.com/project/validmeasures/odkr)
[![codecov](https://codecov.io/gh/validmeasures/odkr/branch/master/graph/badge.svg)](https://codecov.io/gh/validmeasures/odkr)

**ODK Briefcase** is a Java application for fetching and pushing OpenDataKit 
(ODK) forms and their contents. It can be used to gather and aggregate data 
from the mobile client **ODK Collect** when there is no internet connectivity,
when there is no **ODK Aggregate Server** set-up or when an **ODK Aggregate
Server** is not preferred. Current production version of **ODK Briefcase** is
v1.8.0 and an executable `.jar` file can be downloaded from the OpenDataKit [website](https://opendatakit.org/use/briefcase/).

As of **ODK Briefcase** version 1.4.4, a scriptable command line interface (CLI)
to the Java application has been available. This package provides an R interface
to **ODK Briefcase** via the available CLI to pull forms from a remote **ODK Aggregate 
Server** or from a local ODK folder `/odk` collected from mobile clients. This 
package includes the latest version of **ODK Briefcase** (v1.8.0) as an installed 
Java application. This package requires Java 8 installed. Jave 8 can be downloaded 
from [here](https://java.com/en/download/).

## Requirements
This package requires **Java 8** to be installed in your computer. There are 
known [issues](https://forum.opendatakit.org/t/odk-briefcase-not-running-with-jdk-9/10201) 
when using ODK Briefcase with **Java 9**. If you have **Java 9** installed, 
uninstall (on [Windows](https://www.java.com/en/download/help/uninstall_java.xml); on [macOS](https://www.java.com/en/download/help/mac_uninstall_java.xml)) and
then [install](https://java.com/en/download/) **Java 8**. If issues persist even
with Java 8, you may need to reconfigure **Java**. On the terminal, execute the
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
```R
# Install development version of odkr by installing devtools and then installing
# odkr package via git
install.packages("devtools")
devtools::install_github("ernestguevarra/odkr")
library("odkr")
```

## Usage

### Pull forms from a remote ODK Aggregate Server
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
pull_remote(id = "stakeholders",
            to = "~/Desktop",
            from = "https://ona.io/validtrial/"
            username = "validtrial",
            password = "zEF-STN-5ze-qom")
```

After the operation has been completed, you would now be able to see a folder
named **ODK Briefcase Storage** on your desktop containing the forms and
instances from the stakholders form on the **ODK Aggregate Server**.

### Pull forms from a local `/odk` folder extracted from ODK Collect
If you do not have an **ODK Aggregate Server** setup and plan to use **ODK
Briefcase** as your form aggregator, you will have to extract/copy the `/odk` 
folder in your mobile client to a location in your computer (e.g., `~/Desktop`) 
to which you can apply the `pull_local` function to pull out the forms and
instances to a local directory (e.g., `~/Desktop`) as follows:

```R
pull_local(id = "stakeholders",
           to = `~/Desktop`,
           from = `~/Desktop`)
```

After the operation has been completed, you would now be able to see a folder
named **ODK Briefcase Storage** on your desktop containing the forms and
instances from the stakholders form on the **ODK Aggregate Server**.

### Export data from an ODK Briefcase Storage into a CSV file
If you have pulled your forms from either a remote **ODK Aggregate Server** or
a local `/odk` folder and now have an **ODK Briefcase Storage** in one of your
local directories, you will probably want to extract the data found in these
forms for use in other purposes e.g., data analysis.

The `export_data` function allows you to extract data from a local **ODK
Briefcase Storage** (e.g., found in your `~/Desktop`) containing a form 
`stakeholders` and save it in a local directory (e.g., `~/Desktop`) as a `.csv`
file named `test.csv` as follows:

```R
export_data(id = "stakeholders",
            from = `~/Desktop`,
            to = `~/Desktop`,
            filename = "test.csv")
```
