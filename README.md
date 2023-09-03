[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/icon)](https://cran.r-project.org/package=icons)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Install package
Install the package using the following commands  <img align="right" src="ReadMEFigures/new_logo_ltc.png" width=450>

```r
# for now, you can install the developmental version of ltc
# first you need to install the devtools package 
# in case you have not already installed
install.packages("devtools") 
# and load it
library(devtools)

# Then you can install the dev version of the ltc
install_github("loukesio/ltc_palettes")
# and load it
library(ltc)
```

<img src="ReadMEFigures/all_colors_ltc.png" width=1000>

## How can I use the `ltc` package?

### Show all palettes
``` r
names(palettes)
#>  [1] "paloma"     "maya"       "dora"       "ploen"      "olga"      
#>  [6] "mterese"    "gaby"       "franscoise" "fernande"   "sylvie"    
#> [11] "crbhits"    "expevo"     "minou"      "kiss"       "hat"       
#> [16] "reading"    "ten_colors" "alger"      "trio1"      "trio2"     
#> [21] "trio3"      "trio4"      "heatmap"    "pantone23"
```
<sup>Created on 2023-09-03 with [reprex v2.0.2](https://reprex.tidyverse.org)</sup>

### See the hex codes of the palette you like
``` r
palettes$alger
#> [1] "#000000" "#1A5B5B" "#ACC8BE" "#F4AB5C" "#D1422F"
```
<sup>Created on 2023-09-03 with [reprex v2.0.2](https://reprex.tidyverse.org)</sup>

### Choose the palette you like 
``` r
alger <- ltc("alger") #in this case you select alger
```
<sup>Created on 2023-09-03 with [reprex v2.0.2](https://reprex.tidyverse.org)</sup>
### Print the palette you have choosen
``` r
pltc(alger)
```

![](https://i.imgur.com/89dt3IF.png)<!-- -->

<sup>Created on 2023-09-03 with [reprex v2.0.2](https://reprex.tidyverse.org)</sup>


## Contributions
Loukas Theodosiou (theoodosiou@evolbio.mpg.de) and Kristian Ullrich (ullrich@evolbio.mpg.de) have contributed to the development of this package. We have drawn inspiration from the following packages 1. https://github.com/jakelawlor/PNWColors and 2. https://github.com/karthik/wesanderson. A huge thank you to the developers of these beautiful packages.
