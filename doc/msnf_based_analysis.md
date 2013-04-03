## 1. Setting up the scene

1. New anaysis folder set up on MRGTESLA:  
  
  `C:\Data\ESMK`


2. ESMK setup folder cloned from BitBucket

  `hg clone https://forestcon@bitbucket.org/forestcon/zsetup`

3. Subfolder structure

  ESMK  
  |--data  
  |   |--60 (final analysis features)  
  |   |--maski (auxiliary features, masks etc)  
  |   |--raw (segmented MSNFI files used to produce analysis features)  
  |--zsetup  
  |-- ...  

4. Zupport tools updated to rev 140. MRGTESLA uses egg.link so no need to re-install


5. Parameters used in the index calculations copied over from 

  `H:\Data\Metsakeskukset\Etela-Savo\Metsavara\MVScratch\parameters121501.csv`  
  to  
  `C:\Data\ESMK\zsetup\parameters121501.csv`  


6. Segmented MSNFI (raw) data copied from

  `H:\Data\Metsakeskukset\Etela-Savo\VMI\Segments\Full_landscape\Raw\Production`  

  and renamed (`_OSITE_1_`-tag  has to be in as Zupport can't handle other name types yet...)
             
  `p_s_koivu_lpm.tif -> PUULAJI_3_OSITE_1_KLPM.tif`  
  `p_s_koivu_vol.tif  -> PUULAJI_3_OSITE_1_VOL.tif`  
  `p_s_kuusi_lpm.tif -> PUULAJI_2_OSITE_1_KLPM.tif`  
  `p_s_kuusi_vol.tif  -> PUULAJI_2_OSITE_1_VOL.tif`  
  `p_s_manty_lpm.tif -> PUULAJI_1_OSITE_1_KLPM.tif`  
  `p_s_manty_vol.tif  -> PUULAJI_1_OSITE_1_VOL.tif`  
  `p_s_mlp_lpm.tif -> PUULAJI_4_OSITE_1_KLPM.tif`  
  `p_s_mlp_vol.tif  -> PUULAJI_4_OSITE_1_VOL.tif`  
             
  to
             
  `C:\Data\ESMK\data\raw`  
             
             
7. Auxiliary data copied:
             
  `H:\Data\Metsakeskukset\Etela-Savo\VMI\Segments\Full_landscape\Raw\Production\p_s_kasvupaikka.tif`  
  -> `C:\Data\ESMK\data\mask\kasvupaikka.tif`
             
  `H:\Data\Metsakeskukset\Etela-Savo\Zonation\Results\130206_all\data\maski\penalty_raster_60.img`  
  -> `C:\Data\ESMK\data\mask\CorrectExtent60\penalty_rasteri_60.img`
             
  `H:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ESMK_hier_slalue_60.img`  
  -> `C:\Data\ESMK\data\maski\CorrectExtent60\ESMK_hier_slalue_60.img`
                          
8. Raster data dimensions and analysis extent needs to to be the same as in actual analyses -> extracted from `penalty_rasteri_60.img` (copied in step 7).
```            
Raster Information:  
Columns and Rows: 3044, 2815  
Cell Size (X, Y): 60, 60  
Extent:  
Top:    6951380  
Left:   3459440  
Right:  3642080  
Bottom: 6782480  
```     

## 2. Data pre-processing
             
1. Established new ArcMap-project `C:\Data\ESMK\Prioritization_MSNFI_only.mxd`
             
2. New FGDB created to hold the results of batch sigmoidal transformation
`C:\Data\ESMK\data\MSNFI_index.gdb`
             
3. Batch Sigmoidal Transform
```       
arcpy.BatchSigmoidalTransform("C:/Data/ESMK/data/raw","*.tif", "<BODY1>_<ID1>_<BODY2>_<ID2>_<BODY3>","ID1", "C:/Data/ESMK/data/MSNFI_index.gdb", "C:/Data/ESMK/zsetup/parameters121501.csv","MLVMI_PUULAJI", "true")
```          
4. Files in 
```             
arcpy.CopyRaster_management("G:/Data/Metsakeskukset/Etela-Savo/Zonation/Results/130206_all/ES_analyysit_31.9.2012.gdb/ES_analyysi_5_abf_pe_w_cmat_cmete", "G:/Data/Metsakeskukset/Etela-Savo/Zonation/Results/130206_all/result_19_60_abf_pe_w_cmat_cmete_cres.img", "#", "#", "#", "NONE", "NONE", "#")
```

5. `C:\Data\ESMK\data\MSNFI_index.gdb` exported (drop `*_OSITE_1*` from names) to 
`C:\Data\ESMK\data\MSNFI_index`
             
6. At this stage all the index files have the extent of the original segmented MSNFI raster files. This needs to be changed to correspond to the extent (and snap) of the feature rasters of the actual analysis (listed in 1.8 above). A new toolbox model "Batch Set Raster Extent created to do this in batch mode.
             
7. Rasters from `C:\Data\ESMK\data\MSNFI_index` processed with "Batch Set Raster      Extent" to `C:\Data\ESMK\data\MSNFI_index\CorrectExtent`  

  ```
  # The following inputs are layers or table views: "Auxiliary data\p_s_kasvupaikka.tif"
  arcpy.Model2("C:/Data/ESMK/data/MSNFI_index","#","Auxiliary data/p_s_kasvupaikka.tif","3450000 6770000 3650020 6960020","C:/Data/ESMK/data/MSNFI_index/CorrectExtent","NOT_RECURSIVE")
  ```          
             
8. Rasters aggregated with new model "Batchggregate" (**TOOL NOT WORKING PROPERLY!!!**). Note that extent must be set explicitly, this mat in fact replace step 2.5 completely.
             
9. Rasters from `C:\Data\ESMK\data\MSNFI_index\CorrectExtent` aggregated to 
  `C:\Data\ESMK\data\MSNFI_index\CorrectExtent60`
             
10. Only 5 (out of 7) soil fertility classes are used, reclass classes 5, 6 and 7 to one (class = 5)
  -> `C:\Data\ESMK\data\maski\kasvupaikka_5cl.tif`
```
arcpy.Reclassify_sa("C:/Data/ESMK/data/maski/kasvupaikka.tif","VALUE","1 1;2 2;3 3;4 4;5 5;6 5;7 5","C:/Data/ESMK/data/maski/kasvupaikka_5cl.tif","DATA")
```          
11. Extent fixed also for soil fertility class raster `C:\Data\ESMK\data\maski\kasvupaikka_5cl.tif`

  ```
  # The following inputs are layers or table views: "kasvupaikka_5cl.tif"
  arcpy.CopyRaster_management("kasvupaikka_5cl.tif", "C:/Data/ESMK/data/maski/CorrectExtent/kasvupaikka_5cl.img", "#", "#", "#", "NONE", "ColormapToRGB", "#") with extent and snape set to penalty_rasteri_60.img
  ```
  -> `C:\Data\ESMK\data\maski\CorrectExtent\kasvupaikka_5cl.tif`
             
12. Soil fertility class raster `C:\Data\ESMK\data\maski\CorrectExtent\kasvupaikka_5cl.tif` aggregated with R to 60 meters resolution `C:\Data\ESMK\data\maski\CorrectExtent60\kasvupaikka_5cl_60.img`

  ```             
  Recoderepository\R\gis.R
               
  (aggregate(org.raster, fact=3, fun=custom.modal,
  filename=agg.raster.file, option=c("COMPRESS=YES")))
  ```             

13. Cross select all the index layers (from step 6) with soil fertility classes (5) (from step 9)
  -> `C:\Data\ESMK\data\60`
             
  ```
  arcpy.CrossSelect("C:/Data/ESMK/data/maski/CorrectExtent60/kasvupaikka_5cl_60.img", "C:/Data/ESMK/data/MSNFI_index/CorrectExtent60", "C:/Data/ESMK/data/60","1,2,3,4,5", "#", "GeoTIFF", "kp", "true")
  ```        

14. New Python script created to rename the final feature raster files in a right way `C:\Data\ESMK\data\60\rename_files.py`
             
## 3. Zonation setups and runs
             
1. Renaming runs:

  `14_60_5kp_abf -> 21_60_MSNFI_abf`  
  `15_60_5kp_abf_pe -> 22_60_MSNFI_abf_pe`  
  `16_60_5kp_abf_pe_w -> 23_60_MSNFI_abf_pe_w`  
  `17_60_5kp_abf_pe_w_cmat -> 24_60_MSNFI_abf_pe_w_cmat`  
  `18_60_abf_pe_w_cmat_cmete -> 25_60_MSNFI_abf_pe_w_cmat_cmete`  
  `19_60_abf_pe_w_cmat_cmete_cres -> 26_60_MSNFI_abf_pe_w_cmat_cmete_cres`  
  `20_60_abf_pe_w_cmat_cmete_cres_mask -> 27_60_MSNFI_abf_pe_w_cmat_cmete_cres_mask`  
             
2. "img" replaced by "tif" in the spp-filesa
             
3. New wrscr-files for runs 25-27 created by masking wrscr-raster from run 21
             
  `C:\Data\ESMK\zsetup\21_60_MSNFI_abf\output\result_21_60_MSNFI_abf.wrscr.compressed.img` with protected areas and woodland key habitats  
  `H:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ESMK_slalue_60.img`  
  `H:\Data\Metsakeskukset\Etela-Savo\Zonation\ESMK\data\maski\ESMK_mete_60.img`  

  ```             
  # The following inputs are layers or table views: "result_21_60_MSNFI_abf.wrscr.compressed.img", "ESMK_mete_60.img"
  arcpy.ExtractByMask_sa("result_21_60_MSNFI_abf.wrscr.compressed.img", "ESMK_mete_60.img", "C:/Data/ESMK/data/60/MSNFI_mete_wrscr_60.tif")
  -> C:\Data\ESMK\data\60\MSNFI_mete_wrscr_60.tif
  ```             
  ```             
  # The following inputs are layers or table views: "result_21_60_MSNFI_abf.wrscr.compressed.img", "ESMK_slalue_60.img"
  arcpy.ExtractByMask_sa("result_21_60_MSNFI_abf.wrscr.compressed.img", "ESMK_slalue_60.img", "C:/Data/ESMK/data/60/MSNFI_sa_wrscr_60.tif")
  -> C:\Data\ESMK\data\60\MSNFI_sa_wrscr_60.tif
  ```
  
## 4. Result analysis
             