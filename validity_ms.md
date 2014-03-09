# Assessing the suitability of  forest inventories for basis of  spatial conservation prioritization

Joona Lehtomäki^1,2*^ Sakari Tuominen^3^ and Antti Leinonen^4^

1 Department of Biosciences, P.O. Box 65 (Viikinkaari 1), FI-00014 University of Helsinki, Finland  
2 Finnish Environment Institute, Natural Environment Centre, P.O. Box 140 (Mechelininkatu 34a), FI- 00251 Helsinki, Finland  
3 Finnish Forest Research Institute (Metsäntutkimuslaitos), Vantaa, Finland  
4 The Finnish Forest Centre (Suomen Metsäkeskus), Kajaani, Finland  
* Corresponding author  

**Contact:**  
joona.lehtomaki@helsinki.fi, tel. +358-9-191-57714  
sakari.tuominen@metla.fi  
antti.leinonen@metsakeskus.fi  

**Journal:**  
Scandinavian Journal of Forest Research  

**Type of paper:**  
Original research paper

**Running title:**  
Validation of spatial conservation prioritization

**Manuscript statistics:**  
* word count (total) = xxx  
* figures = xxx of which xxx in color  
* tables = xxx  
* references = xxx  

## Abstract:
In most parts of Fennoscandia, Boreal forest landscapes are primarily managed  for forestry purposes, but multi-objective planning including biodiversity conservation is becoming more common. Often primary biodiversity data, such as detailed distribution data for species, is not available for defining conservation priorities over large areas. In sharp contrast, data collected for forestry planning are frequently available on various structural forest characteristics such as standing tree volume, species composition and soil fertility. For conservation planning purposes, data has to be 1) relevant for the planning at hand, 2) spatially extensive enough, 3) detailed enough, and 4) generally available. Here, we demonstrate how to define conservation priorities in a Finnish boreal forest landscape using national forest inventory data sets. Inventoried data on forest characteristics such as tree volume, average diameter, species composition, and soil fertility were used to create proxy indexes for conservation value. These indexes were then used as input for Zonation – a method and software for spatial conservation prioritization. Conservation priorities are often generated without explicit considerations on how well the results capture the distribution of conservation value. Here, we assess the validity of Zonation results by a comparison to a number of independent data sets that describe the distributions of features relevant for conservation, such as existing protected areas and woodland key-habitats. We found that prioritization based on forest inventory data can indeed produce results that are informative for conservation. Regions on known high conservation value were consistently identified by Zonation as high priority areas.  The process described here and the results produced by these analyses feed directly into operational  forest management by the Finnish Forestry Center (Suomen Metsäkeskus). Similar analyses  could be implemented also in other regions of the boreal zone.

Keywords: adaptive management; conservation planning; forest conservation management; spatial conservation prioritization; Zonation software

## 1. Introduction

### 1.1 Operational conservation planning in the forest context (REF)

* Boreal zone: Major ecoregion with very large geographic extent [@Elbakidze2013]

* Although among the least threatened of ecoregions (REF, IUCN?)
    + Species have become threatened locally [@Rassi2010] 
    + There is opportunity to set aside and/or manage relatively large areas of forest [@Elbakidze2013] 
    + Significant role in carbon sequestration [@Bradshaw2009]

* Conservation planning as a part of forestry management: 
    + Multi-citeria decision making (MCDM) [@Kangas2005]: Technically forest management planning, but can include components for biodiversity conservation as well. 
    + TRIAD [@Cote2010]: Functional zoning in forest management planning, different "zones" produces different outcomes (e.g. conservation and timber) 
    + New management regimes [@Kuuluvainen2012]: Natural disturbance emulation (or "continuous-cover forestry") another way of bringing "soft values" to operative forestry management.
    + Spatiotemporal dynamics [@Leroux2013;@Monkkonen2014]: Important, but demanding to take into account. Many of the actual optimization methods cannot handle very large data.
    + Need for change of how forest conservation is planned and implemented [@Hanski2011]:  A core network of protected areas surrounded by areas managed less intensively ("management landscapes").

* Forest conservation planning needs to integrate closely with the existing land use planning and resource use planning [@Ferrier2009]

* Successful integration largely depends on whether existing data that are already part of forestry planning can be utilized in conservation planning (REF) and on whether the results of conservation prioritization can be used in tools already existing in different administrative and management institutions (REF)
    + In Finland, the decision-making context is a mixture of top-down and bottom-up action and different governance processes [@Paloniemi2008]
    + Introduction to METSO-programme in Finland: aims, schedule, used tools with emphasis in ESMK (REF)

### 1.2 Spatial conservation prioritization

* General description of background, methods, and worflows from [@Lehtomaki2013]

* Has been done in also in the boreal forest context [@Lehtomaki2009;@Mikusinski2007;@Sirkia2012]⁠

* Associated uncertainties often high , performance and efficiency unknown [@Langford2011], need for (on-the-ground) validation

* Objective of a spatial prioritization analysis can (and indeed often should) be not the _highest_ conservation priorities, but the _lowest_. These are areas most suitable for e.g. intensive forestry without being too harmful for biodiversity. 

* Usefulness of the results also depends on the sensitivity of the results. Particularly, if the informative part of the results (i.e. the best fraction of the landscape for e.g. conservation) is small relative to the overall size of the landscape then the results may very sensitive to various factors

### 1.3 Data issues

* Reliable and extensive data on species occurrence is rarely available, but not in the case of Finnish forest (REFS, check the flying squirrel / polypore papers): What to use as a surrogate?

* Using forest inventory data as a basis for conservation prioritization is effectively using surrogates for the primary forest biodiversity data (species and habitats occurrence data)

* Building the ecological model through expert elicitation is a widely used technique (REFS) 

* Habitat Suitability Indexes (HSI) another widely adopted approach (something by Kouki et al.)

### 1.4 Aims and scope of the paper

1. Investigate whether commonly available forestry data sets are a useful basis for spatial conservation prioritization
    * The nature of the data (MSNFI vs. more detailed data).
        + MSNFI is a continuous estimate that is more accurate and unbiased over larger extents [@Tomppo2006]
        + Stand-based inventory data more accurate, but this will depend on the age of the data. Additionally there is an unknown quantity of variation caused by differences between practitioners.
    * Technical usability of the data
        + Usually well managed and relatively easy to work with
        + MSNFI expandable beyond the standard products (i.e. segmentation provided by Sakari)
        + Legal issues may restrict usability
    * Adequacy of data in the construction of the ecological model
        + What attributes of fores inventory data can be used for defining conservation value (largely based on expert views)?

2. Investigate how well spatial conservation prioritization (using forest inventory data and Zonation) can inform conservation decision-making in operational forestry planning in Finland
    * Comparison of the results to a set of independent data sets
    * What are the advantages/disadvantages of different scales? 
        + Being part of operational planning implies very fine-scale (maybe Kangas et al. 2014?)
        + On the other hand, large scale will even out the potential errors [@Tomppo2006]

3. Suggest ways to improve use of spatial conservation prioritization methods in operational forestry planning (Not necessarily an aim in itself, will be part of the discussion anyway)
    * Importance of monitoring which can also be done as a part of standard forestry operations
    * How to improve data? How to improve analyses?

## 2. Material and methods

### 2.1 Data for spatial conservation prioritization and its validation

* Data used for this purpose must be available across the entire study area, not from individual locations only. Source of the data matters as different data sets have different levels of uncertainty etc.

* Prioritization data sets (ESMK + LTI inventories + segmented MSNFI)
    + Brief description of the data used
    + __Table 1:__ Data sets used for the construction of the ecologically based model and index of conservation value (see 2.3 for explanation).

* Validation data (PAs + woodland key-habitats + METSO-deals + ENGO sites (?))
    + __Table 2:__ Additional data used for the independent validation of results

### 2.2 The ecological model

* Short description here, more detailed in the supplement

* What is: a conceptual model for conservation prioritization
    + In this context, “ecological model” means a conceptual model that converts whatever data we have into something meaningful from the perspective of conservation
    + The reasoning for translating the information on forest structural features to something important for conservation (REF)

* Data selection by experts (supl.)

* Benefit functions (supl.)
    * Justification behind using the benefit functions

* Weighting of features and connectivity (supl.)
    + Based on discussions with the experts + web questionnaire
    + __Figure 1:__ The ecological model. Data sets, the structure of the index + the selected connectivity distances and connectivity interaction types. (similar to [@Sirkia2012]⁠)

### 2.4 Analysis variants

* We selected four analysis variants XXX in order to examine a suite of scenarios directly relevant for the planning need.

* __Table 3:__ Analysis variants. (link to Fig 1)

### 2.5 Interpretation of results (prioritity rank maps)

* Spatial prioritization
    + Priority rank maps for the four variants of Table (3)
    + Representation level boxplots for particular feature groups (by tree spp or fertility?) for particular top fraction of the landscape; This particular top fraction could correspond to the overall area objective for ESMK (will have to check what it is)

* Comparison of variants
    + Operationally, how robust are the results? i.e. depending on which variant is used, where are highest priorities? Also, what's the effect of the “top fraction of the landscape” selected?
    + Overlap and correlations using Kendall Tau and Jaccard index (needs an extra Figure?)

* Validation with independent data sets
    + Distributions of the rank priorities using a given comparison data
    + Other stats (mean, SD, range?) of priorities within comparison data
    + Comparison to the data (indexes) that the prioritization is based on (Supl?)

## 3.Results

### 3.1 Spatial priorities

* __Figure 2:__ Priority rank maps for analysis variants (all 4).

* __Figure 3:__ representation levels of feature groups (grouped by spp or fertility) for top fraction of the landscape

* Priorities tend to be lower on areas with data source XXX... (probably MSNFI)

* General patterns are strongly affected by the connectivity components included, but this is scale dependent

### 3.2 Comparison of variants

* __Table 4:__ Summary statistics on the differences between the variants at given levels of the top fraction of the landscape: overlap.

* The results show that the absolute highest fraction of the landscape relatively independent to which variant is used. 

* Incorporating connectivity components will result in tradeoffs: accounting for the connectivity to existing protected areas aggregate priorities near conservation areas and draw them away from locations further away

### 3.3 Comparison to independent data sets

* __Figure 4:__ Distributions of priority ranks (histograms) in different, independent data sets.

* Characteristics of individual data sets determine which variant should be compared to which data. E.g. the inventory data collected by the conservation NGOs should be compared to the variant that accounts for the connectivity to existing protected areas - because this was a specific objective in data collection.


## 4. Discussion

* Comparison to independent data sets relevant for biodiversity conservation indicate that known valuable locations indeed emerge from the analysis with high priorities
    +Data from conventional forestry planning coupled with a spatial conservation prioritization tool like Zonation can be used to identify areas of high conservation priorities
    + Characterize how the validation worked or not with different data sets
    + Note that results should not be extrapolated beyond the current problem definition
    + Depending on the prioritization tool used, the analysis and the results often are static → if and when dynamics are not considered it is hard to say much about persistence and hence effectiveness.
    + Formulation of the objectives is thus important and the results should not extrapolated beyond the scope of the analysis at hand

* Aligning planning needs, spatial scale, resolution and the (planning) decision-making context need careful consideration
    + There is no single best solution: the most suitable solution will have to be carefully planned
    + This implies that operational capacity also needs to be in place in order for the analysis be repeatable and adaptive
    + Learning institutions, enabling and empowerment important for the long-term adoption of new techniques (refs Knight etc.)

* Incorporation of the results into operational forestry planning – “the manager's view”
    + Antti

* Opportunities for improvement:
    + Data
        - There are clear differences in the quality of the data
        - How to improve the data base underlying prioritizations, noting that data needs to be available across a large area?
        - What would be ideal data for validation?
    + Methods
        - More realistic ecological models accounting for X, XX, and XXX
        - Known planning needs that this analysis does not answer.
    + Enabling input to decision-making

+ Mainstreaming the methods
    - The road forward

# References

