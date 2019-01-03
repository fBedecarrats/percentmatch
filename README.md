# percentmatch
R function similar to Stata 'percentmatch' by Kuriakose &amp; Robbins (2015) to identify identical observations in survey dataset.
The original Stata version (https://ideas.repec.org/c/boc/bocode/s457984.html) and a previous R replication (http://www.rpubs.com/JessKim503/166594) take into account empty or NA values as possible match, which can be misleading when survey datasets contain a majority of those (lists or nested lists that remain empty in most observations). This version omitts NAs and empty values.
It takes only one parameter, which is the survey dataset.
     result <- percent_match(mysurvey)
It returns a tibble with 3 columns: observation id, maximum percentage of identical values in other observation, id of the other observation with maximum percentage of identical values.
Future possible improvements (contibutions welcome): 
    - specify the observation id variable as a function parameter (here it assumes it is the first one in the dataset)
    - optimize the function with apply/purr and rcpp or similar (here it is quite slow on large datasets)
