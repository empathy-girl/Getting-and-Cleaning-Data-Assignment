# Getting and Cleaning Data Course Project

## Project Overview

This repository contains the code and documentation for the Getting and Cleaning Data Course Project. The aim is to demonstrate skills in data collection, cleaning, and preparation for analysis. The dataset used is based on the "Human Activity Recognition Using Smartphones Dataset" available from the UCI Machine Learning Repository.

## Files in This Repository

- **run_analysis.R**: This script performs the cleaning and transformation of the raw dataset to produce a tidy dataset.
- **tidy_data.txt**: This file contains the final tidy dataset, produced by running the `run_analysis.R` script.
- **CodeBook.md**: A file detailing the variables, data structure, and transformations applied to create the tidy dataset.
- **README.md**: This file, explaining the content and purpose of the project.

## Running the Analysis

1. Ensure that the "UCI HAR Dataset" folder is present in the working directory.
2. Run the `run_analysis.R` script.
3. A tidy dataset (`tidy_data.txt`) will be produced, containing the average of each variable for each activity and each subject.

## Dependencies

The `run_analysis.R` script uses the `dplyr` package for data manipulation. Ensure that you have this package installed by running the following command:

```R
install.packages("dplyr")
```
