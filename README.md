Getting-and-Cleaning-Data
=========================

Module 3

Load the source and start the analysis with the function : start.analysis

start.analysis(dataDir, saveMeanFile=NA) 
dataDir : define the folder with the data
saveMeanFile :
  NA , to give the result (no file save)
  "fileName", to save the result in the "filename" file 
  
sample
dataDir ="~/Documents/DataScientist/Module 3 Getting and Cleaning Data/projet/UCI HAR Dataset"
start.analysis(dataDir,"cleanData_mean.txt")
