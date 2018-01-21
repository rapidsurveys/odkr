################################################################################
#
#' ODK Briefcase R API
#'
#' ODK Briefcase is a Java application for fetching and pushing OpenDataKit
#' (ODK) forms and their contents. It can be used to gather and aggregate data
#' from the mobile client ODK Collect when there is no internet connectivity
#' when there is no ODK Aggregate Server set-up or when and ODK Aggregate
#' Server is not preferred. Current production version of ODK Briefcase is
#' v1.8.0 and can be downloaded from the OpenDataKit
#' \link{website}{https://opendatakit.org/use/briefcase/}
#'
#' As of ODK Briefcase version 1.4.4, a scriptable command line interface (CLI)
#' to the Java application has been available. This package provides an R
#' interface to ODK Briefcase via the available CLI to pull forms from a remote
#' ODK Aggregate Server or from a local ODK folder \code{/odk} collected from mobile
#' mobile clients. This package includes the latest version of ODK Briefcase
#' (v1.8.0) as an installed Java application. This package requires Java 8
#' installed. Jave 8 can be downloaded \link{here}(https://java.com/en/download/)
#'
#' @docType package
#' @name odkr
#' @export pull_remote
#' @export pull_local
#'
NULL


