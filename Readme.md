Asif
================

Usage
-----

The `asif` package provides a set of novelty functions aimed at making nested logic a little more readable than abusing `ifelse`. Note that the parentheses around the logical tests are required.

``` r
result_new <- mtcars %if%
    (mpg > 30) %then% 30 %elif%
    (mpg > 25) %then% 25 %elif%
    (mpg > 20) %then% 20 %elif%
    (mpg > 15) %then% 15 %else% 0
```

Base R
------

Compare this to base R where the nested parentheses can get out of hand pretty quickly.

``` r
result_old <- with(mtcars,
  ifelse(mpg > 30, 30,
    ifelse(mpg > 25, 25,
      ifelse(mpg > 20, 20,
        ifelse(mpg > 15, 15, 0)))))


## results are the same
table(result_old, result_new)
```

    ##           result_new
    ## result_old  0 15 20 25 30
    ##         0   6  0  0  0  0
    ##         15  0 12  0  0  0
    ##         20  0  0  8  0  0
    ##         25  0  0  0  2  0
    ##         30  0  0  0  0  4
