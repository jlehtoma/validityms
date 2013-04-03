**Background:** results in 

`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\120815`  
and  
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all`  

are very different. By looking at the index values in 

`G:\Data\Metsakeskukset\Etela-Savo\Zonation\data\60_5lk`  
and  
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\data\60`  

it is clear that the index values are different -> **why and where?**

----

1. All tree spp indeces are reassembled by mosaicing all the fertility class divisions 1-5 so that only 4 rasters remain

  `G:\Data\Metsakeskukset\Etela-Savo\Zonation\data\60_5lk`   
  -> `G:\Data\Metsakeskukset\Etela-Savo\Zonation\data\60_5lk\reassembled`

  `G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\data\60`  
  -> `G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\data\60\reassembled`

2. Differences calculated `newINDEX` - `oldINDEX` and placed into
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\Comparisons\new_vs_old_indexes`  
-> there is (expected) variation going on, but MLP is missing a lot areas in the new indeces

3. What are the comparison histograms like in the september runs? New R script established:
  
  `G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\results\R\result_stats_september.R`

4. September results exported to *.img files:
  `G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\ES_analyysit_31.9.2012.gdb`  
  -> `G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all`

  extent and snap raster set to corresponding results in   
  `G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\120815`  
  because Antti's results were off 20m in NS direction

5. Rank histogram images created by masking with the comparison data sets:
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\images`

### New analysis runs ran with old data (from september)

1. ES.7z copied from 
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all`  
to  
`C:\Data\ESMK`

2. All index layers' extents changed to match 80/80 extent used in other rasters (not clear why this was different) with a new model builder tool "Batch Change Extent". Old versions kept in `C:\Data\ESMK\data\60_incorrect_extent`

3. Anlysis variants 14-20 re-run, visual inspection confirms that the results correspond to those done in September

4. New results copied to `G:\Data\Metsakesukset\Etela-Savo\Zonation\Results\130301`

### Looking at the results

1. Created a new results analysis script file:  
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\results\R\result_stats_march.R`



