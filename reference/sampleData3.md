# Sample dataset from an impact evaluation study of a mother and child nutrition programme in Kassala State, Sudan. This dataset contains information from child respondents.

Sample dataset from an impact evaluation study of a mother and child
nutrition programme in Kassala State, Sudan. This dataset contains
information from child respondents.

## Usage

``` r
sampleData3
```

## Format

A data frame with 9 columns and 50 rows:

- `wcount.wdata.ccount.child.csex`:

  Child's gender

- `wcount.wdata.ccount.child.card`:

  Does child have an immunisation card?

- `wcount.wdata.ccount.child.cdob`:

  Child's date of birth

- `wcount.wdata.ccount.child.cage`:

  Age of child

- `wcount.wdata.ccount.illness.ill1`:

  Has child had diarrhoea in the past 2 weeks

- `wcount.wdata.ccount.illness.ill2`:

  Has child had fever in the past 2 weeks

- `wcount.wdata.ccount.illness.ill3`:

  Has child had cough in the past 2 weeks

- `KEY`:

  Parent data identifier

- `PARENT_KEY`:

  Child data identifier

## Examples

``` r
sampleData3
#>    wcount.wdata.ccount.child.csex wcount.wdata.ccount.child.card
#> 1                               2                              1
#> 2                               1                              1
#> 3                               2                              4
#> 4                               2                              1
#> 5                               1                              4
#> 6                               2                              4
#> 7                               1                              1
#> 8                               2                              4
#> 9                               2                              3
#> 10                              2                              3
#> 11                              2                              1
#> 12                              2                              4
#> 13                              1                              3
#> 14                              2                              2
#> 15                              2                              1
#> 16                              1                              1
#> 17                              2                              2
#> 18                              1                              2
#> 19                              1                              1
#> 20                              1                              1
#> 21                              1                              4
#> 22                              2                              1
#> 23                              1                              1
#> 24                              2                              1
#> 25                              1                              2
#> 26                              1                              1
#> 27                              2                              1
#> 28                              2                              1
#> 29                              1                              1
#> 30                              1                              4
#> 31                              1                              4
#> 32                              1                              1
#> 33                              2                              1
#> 34                              2                              1
#> 35                              1                              1
#> 36                              1                              1
#> 37                              2                              1
#> 38                              1                              1
#> 39                              1                              2
#> 40                              2                              2
#> 41                              2                              1
#> 42                              1                              1
#> 43                              1                              1
#> 44                              2                              1
#> 45                              1                              1
#> 46                              2                              2
#> 47                              2                              4
#> 48                              2                              4
#> 49                              2                              1
#> 50                              2                              1
#>    wcount.wdata.ccount.child.cdob wcount.wdata.ccount.child.cage
#> 1                      2016-06-15                              6
#> 2                      2014-08-25                             27
#> 3                                                             16
#> 4                      2013-12-24                             36
#> 5                                                             36
#> 6                                                             39
#> 7                      2013-04-14                             44
#> 8                                                             42
#> 9                      2015-12-24                             12
#> 10                     2013-10-24                             38
#> 11                     2014-10-09                             26
#> 12                                                            36
#> 13                     2013-08-20                             40
#> 14                     2016-06-24                              6
#> 15                     2014-12-24                             24
#> 16                     2015-05-18                             19
#> 17                     2016-09-24                              2
#> 18                     2013-07-06                             41
#> 19                     2015-03-19                             21
#> 20                     2015-10-08                             14
#> 21                                                            12
#> 22                     2013-12-24                             36
#> 23                     2014-02-25                             33
#> 24                     2013-06-20                             42
#> 25                     2014-09-24                             27
#> 26                     2014-09-19                             27
#> 27                     2015-11-24                             13
#> 28                     2014-11-15                             25
#> 29                     2012-01-09                             59
#> 30                                                             3
#> 31                                                            48
#> 32                     2013-07-21                             41
#> 33                     2014-07-24                             29
#> 34                     2014-05-19                             31
#> 35                     2016-08-28                              3
#> 36                     2014-07-07                             29
#> 37                     2016-03-15                              9
#> 38                     2013-12-24                             36
#> 39                     2013-12-17                             36
#> 40                     2015-10-20                             14
#> 41                     2013-12-24                             36
#> 42                     2016-10-24                              2
#> 43                     2013-12-24                             36
#> 44                     2016-02-29                              9
#> 45                     2016-01-01                             11
#> 46                     2016-03-28                              8
#> 47                                                            24
#> 48                                                            39
#> 49                     2014-01-05                             35
#> 50                     2014-05-05                             31
#>    wcount.wdata.ccount.illness.ill1 wcount.wdata.ccount.illness.ill2
#> 1                                 2                                2
#> 2                                 2                                2
#> 3                                 1                                1
#> 4                                 2                                2
#> 5                                 2                                2
#> 6                                 2                                2
#> 7                                 2                                2
#> 8                                 2                                2
#> 9                                 2                                2
#> 10                                2                                1
#> 11                                1                                1
#> 12                                2                                2
#> 13                                2                                2
#> 14                                2                                2
#> 15                                2                                2
#> 16                                2                                2
#> 17                                2                                2
#> 18                                1                                1
#> 19                                2                                2
#> 20                                2                                2
#> 21                                2                                1
#> 22                                2                                2
#> 23                                2                                2
#> 24                                2                                2
#> 25                                2                                1
#> 26                                2                                2
#> 27                                2                                2
#> 28                                2                                2
#> 29                                2                                2
#> 30                                2                                2
#> 31                                2                                2
#> 32                                2                                2
#> 33                                2                                2
#> 34                                1                                2
#> 35                                2                                2
#> 36                                2                                2
#> 37                                2                                2
#> 38                                2                                2
#> 39                                1                                1
#> 40                                1                                2
#> 41                                2                                1
#> 42                                2                                2
#> 43                                2                                2
#> 44                                1                                2
#> 45                                2                                2
#> 46                                2                                2
#> 47                                2                                2
#> 48                                2                                2
#> 49                                2                                2
#> 50                                2                                2
#>    wcount.wdata.ccount.illness.ill3 KEY PARENT_KEY
#> 1                                 2   1          1
#> 2                                 1   2          1
#> 3                                 2   3          4
#> 4                                 2   4          7
#> 5                                 2   5          9
#> 6                                 1   6         12
#> 7                                 2   7         13
#> 8                                 2   8         14
#> 9                                 2   9         20
#> 10                                2  10         20
#> 11                                1  11         21
#> 12                                2  12         23
#> 13                                2  13         24
#> 14                                2  14         25
#> 15                                2  15         25
#> 16                                2  16         26
#> 17                                2  17         31
#> 18                                2  18         32
#> 19                                1  19         33
#> 20                                1  20         34
#> 21                                2  21         37
#> 22                                2  22         38
#> 23                                2  23         39
#> 24                                2  24         42
#> 25                                2  25         43
#> 26                                1  26         46
#> 27                                2  27         48
#> 28                                2  28         49
#> 29                                2  29         49
#> 30                                2  30         51
#> 31                                2  31         51
#> 32                                2  32         52
#> 33                                2  33         52
#> 34                                1  34         53
#> 35                                1  35         53
#> 36                                1  36         54
#> 37                                1  37         54
#> 38                                2  38         55
#> 39                                2  39         56
#> 40                                2  40         56
#> 41                                2  41         57
#> 42                                2  42         57
#> 43                                2  43         59
#> 44                                1  44         60
#> 45                                1  45         62
#> 46                                2  46         64
#> 47                                1  47         65
#> 48                                2  48         65
#> 49                                1  49         67
#> 50                                2  50         67
```
