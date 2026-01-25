# Retrieve parent data, matching to a nested (child) dataset by keys of a nested dataset exported from an ODK Aggregate Server.

Retrieve parent data, matching to a nested (child) dataset by keys of a
nested dataset exported from an ODK Aggregate Server.

## Usage

``` r
mergeNestedODK(
  parent,
  child,
  byPARENT_KEY = TRUE,
  removeCols = NULL,
  removeRows = NULL
)
```

## Arguments

- parent:

  Data frame of household data

- child:

  Data frame of child (repeat) data

- byPARENT_KEY:

  Should data frames be matched based on PARENT_KEY (child) and KEY
  (parent) columns? (Currently only option is TRUE)

- removeCols:

  Character vector of column names to remove from the parent data frame
  (optional)

- removeRows:

  Index of which rows should be removed from child data frame (optional)

## Value

Merged dataframe

## Examples

``` r
# merge sampleData2 and sampleData3
x <- renameODK(sampleData2)
y <- renameODK(sampleData3)
temp <- mergeNestedODK(parent = x, child = y, byPARENT_KEY = FALSE)
```
