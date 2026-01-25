# Function to recode a choose-multiple column where multiple answers are recorded in the same element (e.g. "ab ac ad", "ef eg eh") to a data frame with multiple separate 0/1 columns e.g.:

      ab  ac  ad  ef  eg  eh
       1   1   1   0   0   0
       0   0   0   1   1   1

## Usage

``` r
expandMultChoice(answers, choices = NULL, naCode = NULL, naQuestion = NULL)
```

## Arguments

- answers:

  Character vector with given answers (strings containing the choices)

- choices:

  (optional) Character vector with choices to be used (each will become
  a column). If not supplied, choices will be determined from the
  `answer` parameter, splitting given answers by an empty space `(" ")`
  and finding unique values.

- naCode:

  (optional) Single element specifying what character code equates to
  `NA`

- naQuestion:

  (optional) TRUE/FALSE vector of the same length as answers; in rows
  where this is false, all columns will be coded as `NA`

## Value

a data frame with multiple separate 0/1 columns

## NOTE

`naCode` must exist as the only answer in a column (an answer that
contains both a valid answer and the `NA` code will not be recognized as
`NA` - instead, the `NA` code will be output as an extra answer column
(if `choices` parameter is not given))

## Examples

``` r
# Expand responses in variable w7 of sampleData2
sampleData2 <- renameODK(sampleData2)
temp <- expandMultChoice(sampleData2$ws7)
```
