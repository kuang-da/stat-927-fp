# Bayesian Regression to fit single-cell RNAseq datasets

This is my final project for STAT 927.

## Environment 

The project is implemented based on my docker image `kuangda/stat-927`. But to run the code, one needs to install the following dependencies.

```R
install.packages("rstanarm")
install.packages("bayesrules")
install.packages("Seurat")
```

## Modules

- `0-preprocess.R` is used to generate dataset.
- `1-fit.R` is used to fit Bayesian Regression.
- `2-result.R` is used to aggregate the results.
