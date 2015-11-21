---
title: "Getting and Cleaning Data - Course Project"
author: "Raj Somne"
date: "November 20, 2015"
output: html_document
---

The purpose of this project is to use the raw data from accelerometers from the Samsung Galaxy S smartphones, clean it, merge it and create tidy data set that can be used for later data analysis.

The source data can be downloaded from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Contents:

This repository contains following files:
1)  README.md - Overview and the installation instructions
2)  CodeBook.md - Description of data, variables used and transformation performed to make it a tidy data set 
3)  run_analysis.R - R script to be run to get tidy data set for data analysis
4)  average_data.txt - outputof averages of all variables by subject and activities

Pre-requisites:

Please read the README.md to get yourself familiar with project.  

Also, read the CodeBook.md to see the descriptions of data, variables and the transformation done to create the tidy data set with averages. 


Install and Operating Instructions:


1) Create a folder for your work space
2) Copy run_analysis.R script into this work space
3) Download source data from the link mentioned above. Unzip the folder and copy the folder named 'UCI HAR Dataset' into this work space.  Make sure that all the data files are stored under this folder.
4) Run script run_analysis.R in the same work space created earlier.
5) The results will be stored in a file called  average_data.txt.  This is the tidy data which can be used for further analysis.


