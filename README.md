# biosample2species

This is a quick practice/demo of sorts for myself - I wanted to try scraping the NCBI http pages for trivial info (in this case, getting species names from a list of biosample accessions) instead of going through edirect services.

The script itself works for small lists, but NCBI will time you out if the list gets too long (I'd say most people should be safe up to 150 accessions or so). 

To do: 

Add phased html download to avoid NCBI timeout
Add error messages if biosample accession isn't found 
Output should be formatted with the input biosample accessions next to corresponding species name  

