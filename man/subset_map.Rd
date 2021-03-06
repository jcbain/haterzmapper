% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapper_functions.R
\name{subset_map}
\alias{subset_map}
\title{Subset geographies based off of some distance from a given coordinate}
\usage{
subset_map(df, long, lat, dist = 40000)
}
\arguments{
\item{df}{A simple feature dataframe.}

\item{long}{Longitude of the center point.}

\item{lat}{Latitude of the center point.}

\item{dist}{The distance from the center point to subset in meters.}
}
\value{
A simple feature dataframe that is subset of the original data frame with only
  those geometries that are within the `dist` specified.
}
\description{
Subset geographies based off of some distance from a given coordinate
}
