################################################################################
#
#' ODK Briefcase R API
#'
#' ODK Briefcase is a Java application for fetching and pushing OpenDataKit
#' (ODK) forms and their contents. It can be used to gather and aggregate data
#' from the mobile client ODK Collect when there is no internet connectivity,
#' when there is no ODK Aggregate Server set-up or when an ODK Aggregate
#' Server is not preferred. Current production version of ODK Briefcase is
#' v1.8.0 and an executable \code{.jar} file can be downloaded from the OpenDataKit
#' \href{https://opendatakit.org/use/briefcase/}{website}.
#'
#' As of ODK Briefcase version 1.4.4, a scriptable command line interface (CLI)
#' to the Java application has been available. This package provides an R
#' interface to ODK Briefcase via the available CLI to pull forms from a remote
#' ODK Aggregate Server or from a local ODK folder \code{/odk} collected from
#' mobile clients. This package includes the latest version of ODK Briefcase
#' (v1.8.0) as an installed Java application. This package requires Java 8
#' installed. Jave 8 can be downloaded from \href{https://java.com/en/download/}{here}.
#'
#' @docType package
#' @name odkr
#' @export pull_remote
#' @export pull_local
#' @export export_data
#' @export get_help
#' @export expandMultChoice
#' @export renameODK
#' @export mergeNestedODK
#' @importFrom stringr str_split str_length
#' @importFrom Hmisc %nin%
#'
NULL


################################################################################
#
#' Sample Dataset 1
#'
#' Sample dataset from an impact evaluation study of a mother and child nutrition
#' programme in Kassala State, Sudan. This dataset contains cluster level data
#' from the survey.
#'
#' @format A data frame with 16 columns and 50 rows:
#' \describe{
#' \item{\code{admin.admin1.adm1}}{Date of survey}
#' \item{\code{admin.admin1.adm2}}{Enumerator ID}
#' \item{\code{admin.enameA}}{Name of enumerator (Arabic)}
#' \item{\code{admin.ename}}{Name of enumerator (English)}
#' \item{\code{admin.admin2.adm3}}{Survey round number}
#' \item{\code{admin.admin2.adm4}}{Study area / cluster}
#' \item{\code{location.loc1}}{Village ID}
#' \item{\code{location.loc1a}}{Village ID - other}
#' \item{\code{location.loc2}}{Is village a replacement village}
#' \item{\code{location.loc3}}{Village population}
#' \item{\code{location.loc4}}{GPS coordinates}
#' \item{\code{hh1}}{Household ID}
#' \item{\code{hh2}}{Number of women aged 15-49 in household}
#' \item{\code{wcount_count}}{Current woman respondent's ID}
#' \item{\code{KEY}}{Parent data identifier}
#' \item{\code{PARENT_KEY}}{Child data identifier}
#' }
#'
"sampleData1"


################################################################################
#
#' Sample Dataset 2
#'
#' Sample dataset from an impact evaluation study of a mother and child nutrition
#' programme in Kassala State, Sudan. This dataset contains information from
#' mother respondents.
#'
#' @format A data frame with 16 columns and 50 rows:
#' \describe{
#' \item{\code{wcount.wdata.women.wage}}{Mother's age}
#' \item{\code{wcount.wdata.women.wmarried}}{Is mother married?}
#' \item{\code{wcount.wdata.women.wpregnant}}{Is mother pregnant?}
#' \item{\code{wcount.wdata.women.wedu1}}{Mother - number of years of formal education}
#' \item{\code{wcount.wdata.women.wedu2}}{Mother - highest educational attainment}
#' \item{\code{wcount.wdata.women.wanthro}}{Mother's middle upper arm circumference (mm)}
#' \item{\code{wcount.wdata.women.screening}}{Has mother's MUAC and oedema been measured/tested in past month}
#' \item{\code{wcount.wdata.wash.ws1}}{Source of drinking water}
#' \item{\code{wcount.wdata.wash.ws2}}{Water treatment}
#' \item{\code{wcount.wdata.wash.ws3}}{Sanitation facility}
#' \item{\code{wcount.wdata.wash.ws4}}{Is sanitation facility shared with other households?}
#' \item{\code{wcount.wdata.wash.ws5}}{Is sanitation facility used by public}
#' \item{\code{wcount.wdata.wash.ws6}}{Sanitary disposal of child's faeces}
#' \item{\code{wcount.wdata.wash.ws7}}{Episodes when handwashing is done}
#' \item{\code{KEY}}{Parent data identifier}
#' \item{\code{PARENT_KEY}}{Child data identifier}
#' }
#'
"sampleData2"


################################################################################
#
#' Sample Dataset 3
#'
#' Sample dataset from an impact evaluation study of a mother and child nutrition
#' programme in Kassala State, Sudan. This dataset contains information from
#' child respondents.
#'
#' @format A data frame with 9 columns and 50 rows:
#' \describe{
#' \item{\code{wcount.wdata.ccount.child.csex}}{Child's gender}
#' \item{\code{wcount.wdata.ccount.child.card}}{Does child have an immunisation card?}
#' \item{\code{wcount.wdata.ccount.child.cdob}}{Child's date of birth}
#' \item{\code{wcount.wdata.ccount.child.cage}}{Age of child}
#' \item{\code{wcount.wdata.ccount.illness.ill1}}{Has child had diarrhoea in the past 2 weeks}
#' \item{\code{wcount.wdata.ccount.illness.ill2}}{Has child had fever in the past 2 weeks}
#' \item{\code{wcount.wdata.ccount.illness.ill3}}{Has child had cough in the past 2 weeks}
#' \item{\code{KEY}}{Parent data identifier}
#' \item{\code{PARENT_KEY}}{Child data identifier}
#' }
#'
"sampleData3"
