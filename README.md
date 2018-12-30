
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nycgeo

[![Travis build
status](https://travis-ci.org/mfherman/nycgeo.svg?branch=master)](https://travis-ci.org/mfherman/nycgeo)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/nycgeo)](https://cran.r-project.org/package=nycgeo)

The `nycgeo` package contains spatial data files for various geographic
and administrative boundaries in New York City as well as tools for
working with NYC spatial data. Data is in the [`sf` (simple
features)](https://r-spatial.github.io/sf/) format and includes
boundaries for boroughs (counties), public use microdata areas (PUMAs),
community districts (CDs), neighborhood tabulation areas (NTAs), census
tracts, and census blocks. In the future, more boundaries will be added,
such as city council districts, school districts, and police precincts.

Additionally, selected demographic, social, and economic estimates from
the U.S. Census Bureau American Community Survey can be added to the
geographic boundaries in `nycgeo`, allowing for contextualization and
easy choropleth mapping. Finally, `nycgeo` makes it simple to access a
subset of spatial data in a particular geographic area, such as all
census tracts in Brooklyn and Queens.

## Why `nycgeo`?

The spatial files contained in the `nycgeo` package are available on
websites such as the [New York City Department of City Planning’s Bytes
of the Big
Apple](https://www1.nyc.gov/site/planning/data-maps/open-data.page#district_political)
and the [U.S. Census Bureau TIGER/Line®
Shapefiles](https://www.census.gov/geo/maps-data/data/tiger-line.html),
but this package aims to make accessing the spatial data more
convenient. Instead of downloading and converting shapefiles each time
you need them, `nycgeo` provides the files in a consistent format (`sf`)
with added metadata that enable joins with non-spatial data.

Other R packages share some features with `nycgeo`. In particular, the
wonderful [`tidycensus`](https://walkerke.github.io/tidycensus/) package
can access the Census Bureau’s API and download ACS estimates as well as
TIGER/Line® Shapefiles (via
[`tigris`](https://github.com/walkerke/tigris)).

One difference between the boundaries included here and the TIGER/Line®
Shapefiles available through `tigris` is that these boundaries are
clipped to the shoreline, allowing for better mapping of New York City.
Additionally, `nycgeo` contains boundaries for geographic areas that are
not available from the Census Bureau. This includes neighborhood
tabulation areas (NTAs) and community districts (CDs).

Finally, all spatial data included in the package uses the [NAD83 / New
York Long Island (ftUS) State Plane projected coordinate system
(EPSG 2263)](https://epsg.io/2263), which is the standard projection
used by New York City government agencies.

## Installation

You can install `nycgeo` from
[GitHub](https://https://github.com/mfherman/nycgeo) with:

``` r
remotes::install_github("mfherman/nycgeo")
```
