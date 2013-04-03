**Background:** so far grouping in the analysis has been based on tree species (N=4). Re-run the analysis with grouping based on the soil fertility class (N=5).

1. In folder `C:\Data\ESMK\analyysi` set up new variants that adhere to the grouping based on soil fertility classes

2. New variants 21-27 tagged with `_altg` (alternative grouping):
  
  `21_60_5kp_abf_altg`  
  `22_60_5kp_abf_pe_altg`  
  `23_60_5kp_abf_pe_w_altg`  
  `24_60_5kp_abf_pe_w_cmat_altg`  
  `25_60_5kp_abf_pe_w_cmat_cmete_altg`  
  `26_60_5kp_abf_pe_w_cmat_cmete_cres_altg`  
  `27_60_5kp_abf_pe_w_cmat_cmete_cres_mask_altg`  

3. New group files:
  
  `C:\Data\ESMK\analyysi\groups_fert.txt`  
  `C:\Data\ESMK\analyysi\groups_wrscr_cmete_fert.txt`  
  `C:\Data\ESMK\analyysi\groups_wrscr_cmete_cres_fert.txt`  

4. For testing purposes, the spp files of variants not using any form of DS (21-23) changed so that alpha value 0.005 is replaced with a dummy value of 1.0
-> comparison of 14 - 21 and 16 - 23 show no difference (there is some, but within the bound or rounding errors e-006)

----

For LSM post-processing analysis, a planning unit layer is needed where independent comparison data sets form the planning units.

1. `G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ELY_ysat_2011_2012.img` reclassed to  
`G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ELY_ysat_2011_2012_bin.img`

  ```
  arcpy.RasterCalculator_sa("Con(/\ELY_ysat_2011_2012.img/\, 1)", "G:/Data/Metsakeskukset/Etela-Savo/Zonation/ESMK/data/maski/ELY_ysat_2011_2012_bin.img")
  ```

2. Overlaps of the different data sets checked by

  ```
  arcpy.RasterCalculator_sa("/\ELY_ysat_2011_2012_bin/\ + /\ESMK_mete_60.img/\ + /\ESMK_slalue_avosuoton_60.img/\ + /\ESMK_engo_A_2012_60_bin.img/\", "C:/Users/admin_jlehtoma/Documents/ArcGIS/Default.gdb/rastercalc56")
  ```                         
    -> no apparent overlap
                          
3. Input rasters in `G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\`
                          
  `ESMK_slalue_avosuoton_60.img`  
  `ESMK_mete_60.img`  
  `ELY_ysat_2011_2012_bin.img`  
  `ESMK_engo_A_2012_60_bin.img`  
                          
4. New Model Builder model created: Create LSM PLU. Does the following steps:
  1. Reclass (last 3) to:
  ```
  1 = ESMK_slalue_avosuoton_60.img  
  2 = ESMK_mete_60.img  
  3 = ELY_ysat_2011_2012_bin.img  
  4 = ESMK_engo_A_2012_60_bin.img
  ```
  2. Mosaic into a new raster dataset:
    `G:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ESMK_PLU.img`
    Cell size set to 60 meters, no explicit enforcement of extent and snap (all inputs seem to be ok)
                          
5. LSM post-processing analysis switch on by enabling file `C:\Data\ESMK\analyysi\ppa_list_file.txt` in runs 21-27
                          
6. Runs 21-27 started @ 11:11 - 21-23 done by 13:13 
                          