---
output:
  knitrBootstrap::bootstrap_document:
    title: "Test file"
    theme: amelia
    highlight: sunburst
    theme.chooser: TRUE
    highlight.chooser: TRUE
---

```
## OGR data source with driver: ESRI Shapefile 
## Source: "../../zsetup-esmk//data/common/vector/esmk_metso_location_2008_2014.shp", layer: "esmk_metso_location_2008_2014"
## with 187 features and 4 fields
## Feature type: wkbPolygon with 2 dimensions
```


### METSO location grouped by implementation class

Categories explained:  

| Implementation class | Explanation |
|----------------------|-------------|
|`kauppa`| Site permanently bought to become a public PA |
|`MRA`| Temporary (10 years) set-aside |
|`Vaihto`| Land-exchange contract |
|`Valtionperintö`| Site testamented for the government |
|`YSA`| Private (permanent) protected area |

<!-- html table generated in R 3.0.3 by xtable 1.7-3 package -->
<!-- Mon Mar 31 13:57:14 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> Implementation class </TH> <TH> Area_ha </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD> YSA </TD> <TD align="right"> 1308.35 </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD> Kauppa </TD> <TD align="right"> 699.72 </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD> MRA </TD> <TD align="right"> 83.11 </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD> ValtionperintÃ¶ </TD> <TD align="right"> 20.32 </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD> Vaihto </TD> <TD align="right"> 13.39 </TD> </TR>
   </TABLE>

