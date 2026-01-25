# Function to expand response to a more than one answer multiple choice question coded as a concatenated string

Function to expand response to a more than one answer multiple choice
question coded as a concatenated string

## Usage

``` r
expand_choice(
  df,
  x,
  values,
  pattern = "",
  prefix = x,
  labels = values,
  sep = "."
)
```

## Arguments

- df:

  A dataframe containing the vector data that requires expansion.

- x:

  Name of variable in `df` containing vector needing expansion.

- values:

  Vector of string values used to create concatenated string response.

- pattern:

  Pattern used to separate values in the concatenated string. Default is
  "" for concatenated strings with no separator.

- prefix:

  Prefix to names of newly created variables.

- labels:

  Vector of names to use for columns of resulting data.frame. If not
  specified, columns are named using `values`.

- sep:

  Charater to separate `prefix` from `labels` in the names of newly
  created variables.

## Value

A data.frame with same rows as `df` containing columns corresponding to
each newly created variable.

## Examples

``` r
if (FALSE) { # \dontrun{
expandMultipleChoice(df = individual,
                     x = "mddw1",
                     values = as.character(0:18),
                     pattern = " ",
                     prefix = "mddw",
                     sep = "")
} # }
```
