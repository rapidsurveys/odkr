# Sample dataset from an impact evaluation study of a mother and child nutrition programme in Kassala State, Sudan. This dataset contains information from mother respondents.

Sample dataset from an impact evaluation study of a mother and child
nutrition programme in Kassala State, Sudan. This dataset contains
information from mother respondents.

## Usage

``` r
sampleData2
```

## Format

A data frame with 16 columns and 50 rows:

- `wcount.wdata.women.wage`:

  Mother's age

- `wcount.wdata.women.wmarried`:

  Is mother married?

- `wcount.wdata.women.wpregnant`:

  Is mother pregnant?

- `wcount.wdata.women.wedu1`:

  Mother - number of years of formal education

- `wcount.wdata.women.wedu2`:

  Mother - highest educational attainment

- `wcount.wdata.women.wanthro`:

  Mother's middle upper arm circumference (mm)

- `wcount.wdata.women.screening`:

  Has mother's MUAC and oedema been measured/tested in past month

- `wcount.wdata.wash.ws1`:

  Source of drinking water

- `wcount.wdata.wash.ws2`:

  Water treatment

- `wcount.wdata.wash.ws3`:

  Sanitation facility

- `wcount.wdata.wash.ws4`:

  Is sanitation facility shared with other households?

- `wcount.wdata.wash.ws5`:

  Is sanitation facility used by public

- `wcount.wdata.wash.ws6`:

  Sanitary disposal of child's faeces

- `wcount.wdata.wash.ws7`:

  Episodes when handwashing is done

- `KEY`:

  Parent data identifier

- `PARENT_KEY`:

  Child data identifier

## Examples

``` r
sampleData2
#>    wcount.wdata.women.wage wcount.wdata.women.wmarried
#> 1                       20                           1
#> 2                       35                           1
#> 3                       16                           2
#> 4                       30                           1
#> 5                       18                           2
#> 6                       25                           1
#> 7                       27                           1
#> 8                       48                           1
#> 9                       18                           1
#> 10                      16                           2
#> 11                      46                           1
#> 12                      38                           1
#> 13                      22                           1
#> 14                      28                           1
#> 15                      18                           1
#> 16                      NA                          NA
#> 17                      16                           1
#> 18                      15                           1
#> 19                      16                           1
#> 20                      25                           1
#> 21                      35                           1
#> 22                      18                           2
#> 23                      30                           1
#> 24                      33                           1
#> 25                      18                           2
#> 26                      25                           1
#> 27                      25                           1
#> 28                      46                           1
#> 29                      40                           1
#> 30                      16                           2
#> 31                      19                           1
#> 32                      23                           1
#> 33                      31                           1
#> 34                      30                           1
#> 35                      25                           1
#> 36                      17                           2
#> 37                      30                           1
#> 38                      36                           1
#> 39                      27                           1
#> 40                      17                           2
#> 41                      16                           2
#> 42                      32                           1
#> 43                      19                           1
#> 44                      16                           2
#> 45                      15                           2
#> 46                      35                           1
#> 47                      15                           2
#> 48                      36                           1
#> 49                      38                           1
#> 50                      15                           1
#>    wcount.wdata.women.wpregnant wcount.wdata.women.wedu1
#> 1                             2                        3
#> 2                             2                        0
#> 3                             2                        5
#> 4                             2                        0
#> 5                             2                        8
#> 6                             2                        3
#> 7                             2                        0
#> 8                             2                        0
#> 9                             1                        0
#> 10                            2                        3
#> 11                            2                        0
#> 12                            2                        0
#> 13                            2                        4
#> 14                            2                        0
#> 15                            2                        4
#> 16                           NA                       NA
#> 17                            2                        0
#> 18                            2                        0
#> 19                            1                        5
#> 20                            2                        0
#> 21                            2                        3
#> 22                            2                       11
#> 23                            1                        0
#> 24                            2                        3
#> 25                            2                        1
#> 26                            2                        0
#> 27                            2                        0
#> 28                            2                        0
#> 29                            2                        0
#> 30                            2                        7
#> 31                            2                        0
#> 32                            2                        0
#> 33                            2                        0
#> 34                            2                        3
#> 35                            1                        0
#> 36                            2                        4
#> 37                            2                        0
#> 38                            2                        1
#> 39                            2                        2
#> 40                            2                        2
#> 41                            2                        0
#> 42                            1                        0
#> 43                            1                        2
#> 44                            2                        4
#> 45                            2                        7
#> 46                            2                        0
#> 47                            2                        8
#> 48                            2                        7
#> 49                            2                       10
#> 50                            2                        0
#>    wcount.wdata.women.wedu2 wcount.wdata.women.wanthro
#> 1                         1                        270
#> 2                         9                        235
#> 3                         1                        174
#> 4                         9                        269
#> 5                         2                        225
#> 6                         1                        128
#> 7                         9                        268
#> 8                         9                        210
#> 9                         1                        162
#> 10                        1                        211
#> 11                        9                        331
#> 12                        9                        335
#> 13                        1                        227
#> 14                        9                        258
#> 15                        1                        196
#> 16                       NA                         NA
#> 17                        9                        181
#> 18                        9                        225
#> 19                        1                        220
#> 20                        9                        260
#> 21                        1                        243
#> 22                        3                        272
#> 23                        9                        189
#> 24                        1                        240
#> 25                        1                        235
#> 26                        9                        245
#> 27                        9                        287
#> 28                        9                        194
#> 29                        9                        233
#> 30                        1                        179
#> 31                        9                        182
#> 32                        9                        134
#> 33                        9                        248
#> 34                        1                        283
#> 35                        9                        245
#> 36                        1                        182
#> 37                        9                        220
#> 38                        1                        235
#> 39                        9                        205
#> 40                        1                        243
#> 41                        9                        189
#> 42                        9                        235
#> 43                        1                        219
#> 44                        1                        221
#> 45                        1                        225
#> 46                        9                        200
#> 47                        2                        203
#> 48                        1                        230
#> 49                        3                        304
#> 50                        9                        185
#>    wcount.wdata.women.screening wcount.wdata.wash.ws1 wcount.wdata.wash.ws2
#> 1                             2                    13                     2
#> 2                             2                     9                   2 7
#> 3                             2                    12                     7
#> 4                             2                    12                     7
#> 5                             2                    13                     7
#> 6                             2                     8                     7
#> 7                             2                     8                     7
#> 8                             2                    12                     3
#> 9                             2                    12                     7
#> 10                            2                     9                 2 3 7
#> 11                            2                    13                     2
#> 12                            2                     9                 2 3 7
#> 13                            2                     8                     1
#> 14                            2                    12                     7
#> 15                            2                    12                     3
#> 16                           NA                    NA                      
#> 17                            2                    12                     7
#> 18                            2                     8                     7
#> 19                            2                    13                     4
#> 20                            2                    13                     7
#> 21                            2                    13                     3
#> 22                            2                    13                     7
#> 23                            2                    12                     7
#> 24                            1                    13                     1
#> 25                            2                    11                     7
#> 26                            2                     9                   2 3
#> 27                            2                    12                     3
#> 28                            2                     9                     7
#> 29                            1                     8                     7
#> 30                            2                    12                     7
#> 31                            1                     9                     7
#> 32                            2                     9                     7
#> 33                            2                     9                   2 3
#> 34                            2                    13                     7
#> 35                            2                     8                     7
#> 36                            2                    12                     7
#> 37                            2                     9                     7
#> 38                            2                    10                     7
#> 39                            2                    13                     2
#> 40                            2                    12                     3
#> 41                            2                     9                     7
#> 42                            1                     8                     7
#> 43                            2                     9                     7
#> 44                            2                    12                     7
#> 45                            2                     9                 2 3 7
#> 46                            2                    12                     3
#> 47                            2                    12                     7
#> 48                            2                    13                     3
#> 49                            2                    13                     7
#> 50                            2                     9                     7
#>    wcount.wdata.wash.ws3 wcount.wdata.wash.ws4 wcount.wdata.wash.ws5
#> 1                     12                    NA                    NA
#> 2                      1                     1                     2
#> 3                     12                    NA                    NA
#> 4                     12                    NA                    NA
#> 5                     12                    NA                    NA
#> 6                     12                    NA                    NA
#> 7                     12                    NA                    NA
#> 8                     12                    NA                    NA
#> 9                     12                    NA                    NA
#> 10                     1                     1                     2
#> 11                    12                    NA                    NA
#> 12                     1                     1                     2
#> 13                    12                    NA                    NA
#> 14                    12                    NA                    NA
#> 15                    12                    NA                    NA
#> 16                    NA                    NA                    NA
#> 17                    12                    NA                    NA
#> 18                    12                    NA                    NA
#> 19                    12                    NA                    NA
#> 20                    12                    NA                    NA
#> 21                    12                    NA                    NA
#> 22                     2                     2                     2
#> 23                    12                    NA                    NA
#> 24                     1                     1                     1
#> 25                    12                    NA                    NA
#> 26                     1                     1                     1
#> 27                    12                    NA                    NA
#> 28                    12                    NA                    NA
#> 29                    12                    NA                    NA
#> 30                     2                     2                     2
#> 31                    12                    NA                    NA
#> 32                    10                     1                     2
#> 33                     2                     1                     1
#> 34                    12                    NA                    NA
#> 35                    12                    NA                    NA
#> 36                    12                    NA                    NA
#> 37                    12                    NA                    NA
#> 38                    12                    NA                    NA
#> 39                    12                    NA                    NA
#> 40                    12                    NA                    NA
#> 41                    12                    NA                    NA
#> 42                    12                    NA                    NA
#> 43                    10                     1                     2
#> 44                    12                    NA                    NA
#> 45                     1                     2                     2
#> 46                    12                    NA                    NA
#> 47                    12                    NA                    NA
#> 48                    12                    NA                    NA
#> 49                     2                     2                     2
#> 50                    12                    NA                    NA
#>    wcount.wdata.wash.ws6 wcount.wdata.wash.ws7 KEY PARENT_KEY
#> 1                     NA           1 2 3 4 6 7   1          1
#> 2                      9             1 2 3 7 8   2          2
#> 3                     NA               1 2 3 7   3          3
#> 4                     NA       1 2 3 4 5 6 7 8   4          4
#> 5                     NA                 1 2 8   5          5
#> 6                     NA               1 2 3 5   6          6
#> 7                     NA           1 2 3 6 7 8   7          7
#> 8                     NA                 1 2 3   8          8
#> 9                     NA             1 2 3 7 8   9          9
#> 10                     9                 1 2 3  10         10
#> 11                    NA                 1 2 3  11         11
#> 12                     1               1 2 3 7  12         12
#> 13                    NA                 1 2 3  13         13
#> 14                    NA         1 2 3 4 6 7 8  14         14
#> 15                    NA                 1 2 3  15         15
#> 16                    NA                        16         16
#> 17                    NA             1 2 3 7 8  17         17
#> 18                    NA             1 2 3 7 8  18         18
#> 19                    NA               1 2 3 7  19         19
#> 20                    NA               1 2 3 5  20         20
#> 21                    NA             1 2 3 6 7  21         21
#> 22                     9             1 2 3 7 8  22         22
#> 23                    NA             1 2 3 6 7  23         23
#> 24                     1         1 2 3 5 6 7 8  24         24
#> 25                    NA             1 2 3 5 6  25         25
#> 26                     1             1 2 3 7 8  26         26
#> 27                    NA                 1 2 3  27         27
#> 28                    NA               1 2 3 7  28         28
#> 29                    NA               1 2 3 5  29         29
#> 30                     9               1 2 3 7  30         30
#> 31                    NA               1 2 4 7  31         31
#> 32                     1               1 2 3 6  32         32
#> 33                     7               1 2 3 8  33         33
#> 34                    NA               1 2 3 7  34         34
#> 35                    NA             1 2 3 7 8  35         35
#> 36                    NA             1 2 3 7 8  36         36
#> 37                    NA               1 2 3 7  37         37
#> 38                    NA                 1 3 5  38         38
#> 39                    NA           1 2 3 4 6 7  39         39
#> 40                    NA                 1 2 3  40         40
#> 41                    NA               1 2 3 7  41         41
#> 42                    NA               1 2 3 5  42         42
#> 43                     7      1 2 3 4 6 7 8 10  43         43
#> 44                    NA               2 3 6 7  44         44
#> 45                     9    1 2 3 4 5 6 7 8 10  45         45
#> 46                    NA                 1 2 3  46         46
#> 47                    NA             1 2 3 7 8  47         47
#> 48                    NA             1 2 3 5 7  48         48
#> 49                     2             1 2 3 6 7  49         49
#> 50                    NA               1 2 3 7  50         50
```
