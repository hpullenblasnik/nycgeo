library(devtools)
library(tidyverse)
library(tidycensus)
library(sf)
library(nycgeo)

data(tract_acs_data)
data(tract_sf_simple)

# median interpolation
# http://gisdiva.com/downloads/resources/How_to_Recalculate_a_Median.pdf

# make a vector to select final cols later
vars <- c("pop_white", "pop_black", "pop_hisp",
          "pop_asian", "pop_ba_above", "pop_inpov")

vars_to_select <- map(
  vars, ~ paste0(.x, c("_est", "_moe", "_pct_est", "_pct_moe"))) %>%
  flatten_chr()

nta <- tract_sf_simple %>%
  st_set_geometry(NULL) %>%
  left_join(tract_acs_data, by = "geoid") %>%
  select(-contains("pct"), -contains("med")) %>%
  filter(!str_detect(nta_name, "park-cemetery-etc")) %>%
  filter(!str_detect(nta_name, "Airport")) %>%
  gather(var, value, contains("pop")) %>%
  mutate(
    type = if_else(str_sub(var, -3) == "moe", "margin", "estimate"),
    var = str_sub(var, 1, -5)
    ) %>%
  spread(type, value)

count(nta, var)

nta_calc <- nta %>%
  group_by(nta_id, var) %>%
  summarise(
    est = sum(estimate, na.rm = TRUE),
    moe = moe_sum(margin, estimate, na.rm = TRUE)
    )

# https://community.rstudio.com/t/spread-with-multiple-value-columns/5378
nta_calc_spread <- nta_calc %>%
  ungroup() %>%
  gather(type, value, -(nta_id:var)) %>%
  unite(temp, var, type) %>%
  spread(temp, value)

nta_acs_data <- nta_calc_spread %>%
  mutate(
    pop_white_pct_est = pop_white_est / pop_total_est,
    pop_white_pct_moe = moe_prop(pop_white_est, pop_total_est,
                                 pop_white_moe, pop_total_moe),
    pop_black_pct_est = pop_black_est / pop_total_est,
    pop_black_pct_moe = moe_prop(pop_black_est, pop_total_est,
                                 pop_black_moe, pop_total_moe),
    pop_hisp_pct_est = pop_hisp_est / pop_total_est,
    pop_hisp_pct_moe = moe_prop(pop_hisp_est, pop_total_est,
                                 pop_hisp_moe, pop_total_moe),
    pop_asian_pct_est = pop_asian_est / pop_total_est,
    pop_asian_pct_moe = moe_prop(pop_asian_est, pop_total_est,
                                 pop_asian_moe, pop_total_moe),
    pop_ba_above_pct_est = pop_ba_above_est / pop_educ_denom_est,
    pop_ba_above_pct_moe = moe_prop(pop_ba_above_est, pop_educ_denom_est,
                                    pop_ba_above_moe, pop_educ_denom_moe),
    pop_inpov_pct_est = pop_inpov_est / pop_inpov_denom_est,
    pop_inpov_pct_moe = moe_prop(pop_inpov_est, pop_inpov_denom_est,
                                 pop_inpov_moe, pop_inpov_denom_moe)
    ) %>%
  select(nta_id, pop_total_est, pop_total_moe, vars_to_select)

use_data(nta_acs_data, overwrite = TRUE)
