% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sf_data.R
\docType{data}
\name{tract_sf}
\alias{tract_sf}
\alias{tract_sf_simple}
\title{NYC census tract boundaries}
\format{An sf object with 2166 rows and 13 variables:
\describe{
\item{geoid}{Census Bureau GEOID; can be used to join spatial data with
Census estimates}
\item{borough_tract_id}{NYC DCP borough code and census tract number}
\item{state_fips}{ANSI state FIPS code}
\item{county_fips}{ANSI county FIPS code}
\item{tract_id}{Census Bureau tract number}
\item{county_name}{County name}
\item{borough_name}{Borough name}
\item{borough_id}{NYC DCP borough code and census tract number}
\item{nta_id}{NYC neighborhood tabulation area id}
\item{nta_name}{NYC neighborhood tabulation area name}
\item{puma_id}{Census Bureau public use microdata area id}
\item{puma_name}{Census Bureau public use microdata area name}
\item{geometry}{sfc_MULTIPOLYGON \cr
NAD83 / New York Long Island (ftUS); EPSG:2263}
}}
\source{
\url{https://www1.nyc.gov/site/planning/data-maps/open-data/districts-download-metadata.page}
}
\usage{
tract_sf

tract_sf_simple
}
\description{
A simple features (sf) dataset containing the geometry of all census tracts
in New York City from the 2010 Census.
}
\keyword{datasets}
