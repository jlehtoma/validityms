# Regional-scale conservation prioritization in boreal forest landscapes: generating and validating priority maps

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
Fennoscandian boreal forest landscapes are managed primarily for forestry purposes, but multi-objective planning including biodiversity conservation is becoming more common. Often primary biodiversity data, such as detailed distribution data for species, is not available for defining conservation priorities over large areas. In sharp contrast, data collected for forestry planning are frequently available on various structural forest characteristics such as standing tree volume, species composition and soil fertility. For conservation planning purposes, data has to be 1) relevant for the planning at hand, 2) spatially extensive enough, 3) detailed enough, and 4) generally available. Here, we demonstrate how to define conservation priorities in a Finnish boreal forest landscape using Zonation – a method and software for spatial conservation prioritization. Conservation priorities are often generated without explicit considerations on how well the results capture the distribution of conservation value. Here, we assess the validity of Zonation results by a comparison to a number of independent data sets that describe the distributions of features relevant for conservation, such as existing protected areas and woodland key-habitats. Furthermore, we investigate what effect the quality of the input forest inventory data has on the results. We found that prioritization based on data on forest structure can indeed produce results that are informative for conservation. Occurrences of independently surveyed features occurred on average in areas that Zonation had identified as high priority based on nationally available forest data alone.  The process described here and the results produced by these analyses feed directly into operational  forest management by the Finnish Forestry Center (Suomen Metsäkeskus). Similar analyses  could be implemented also in other regions of the boreal zone.

Keywords: adaptive management; conservation planning; forest conservation management; spatial conservation prioritization; Zonation software

## 1. Introduction

### 1.1 Operational conservation planning in the forest context (REF)
* Conservation planning as a part of forestry management: 
  - MCDM [@Kangas2005] 
  - TRIAD [@Cote2010] 
  - Guidelines and policies [@Hanski2011]
  - New management regimes [@Kuuluvainen2012]
* Forest conservation planning needs to integrate closely with the existing planning context and operations [@Ferrier2009]
* Successful integration largely depends on whether existing data that are already part of forestry planning can be utilized in conservation planning (REF) and on whether the results of conservation prioritization can be used in tools already existing in different administrative institutions (REF)
* In Finland, the decision-making context is a mixture of top-down and bottom-up action and different governance processes [@Paloniemi2008]
* Introduction to METSO-programme in Finland: aims, schedule, used tools with emphasis in ESMK (REF)

### 1.2 Spatial conservation prioritization
* Get relevant bits from the workflow MS
* Has been done in also in the boreal forest context [@Lehtomaki2009;@Mikusinski2007;@Sirkia2012]⁠
* Associated uncertainties often high , performance and efficiency unknown [@Langford2011], need for (on-the-ground) validation

### 1.3 Validation of spatial conservation prioritization results
* Visually appealing priority maps may influence our perception (as defined by the ecological model) of the distribution of conservation value → how to asses whether the results indeed are useful?
* Usefulness of the results also depends on the sensitivity of the results. Particularly, if the informative part of the results (i.e. the best fraction of the landscape for e.g. conservation) is small relative to the overall size of the landscape then the results may very sensitive to various factors

### 1.4 Aims and scope of the paper
1. Investigate whether commonly available forestry data sets are a useful basis for spatial conservation prioritization
    * The nature of the data (MSNFI vs. more detailed data)
    * Technical usability of the data
    * Adequacy of data in the construction of the ecological model
2. Investigate how well spatial conservation prioritization (using the previous data and Zonation) can inform conservation decision-making in operational forestry planning in Finland
    * Comparison of the results to a set of independent data sets
    * Matching of planning scales
3. Suggest ways to improve use of spatial conservation prioritization methods in operational forestry planning
    * Importance of monitoring which can also be done as a part of standard forestry operations
    * How to improve data? How to improve analyses?
    * Material and Methods

## 2. Material and methods

### 2.1 Data for spatial conservation prioritization and its validation
* Data used for this purpose must be available across the entire study area, not from individual locations only. Source of the data matters as different data sets have different levels of uncertainty etc.
* Prioritization data sets (ESMK + LTI inventories + segmented MSNFI)
    * Brief description of the data used
    * Table 1: Data sets used for the construction of the ecologically based model and index of conservation value (see 2.3 for explanation).
* Validation data
    * Table 2: Additional data used for the independent validation of results

### 2.2 The ecological model
* Short description here, more detailed in the supplement
* What is: a conceptual model for conservation prioritization
    * In this context, “ecological model” means a conceptual model that converts whatever data we have into something meaningful from the perspective of conservation
    * The reasoning for translating the information on forest structural features to something important for conservation (REF)
* Data selection by experts (supl.)
* Benefit functions (supl.)
    * Justification behind using the benefit functions
* Weighting of features and connectivity (supl.)
    * Based on discussions with the experts + web questionnaire
    * Figure 1: The ecological model. Data sets, the structure of the index + the selected connectivity distances and connectivity interaction types. (similar to (Sirkiä et al., 2012)⁠)

### 2.4 Analysis variants
* We selected five analysis variants XXX in order to examine a suite of scenarios directly relevant for the planning need.
* Table 3: Analysis variants. (link to Fig 1)

### 2.5 Interpretation of results (prioritity rank maps)
* Spatial prioritization
    * Priority rank maps for the five variants of Table (3)
    * Representation level boxplots for particular feature groups (by tree spp or fertility?) for particular top fraction of the landscape → this particular top fraction could correspond to the overall area objective for ESMK (will have to check what it is)
* Comparison of variants
    * Operationally, how “robust” are the results? i.e. depending on which variant is used, where are highest priorities? Also, what's the effect of the “top fraction of the landscape” selected?
    * Overlap and correlations
* Validation with independent data sets
    * Distributions of the rank priorities using a given comparison data
    * Other stats (mean, SD, range?) of priorities within comparison data
    * Comparison to the data (indexes) that the prioritization is based on (Supl?)

## 3.Results

### 3.1 Spatial priorities
* Figure 2: Priority rank maps for analysis variants (all 4).
* Figure 3: representation levels of feature groups (grouped by spp or fertility) for frx and others
* Priorities tend to be lower on areas with data source XXX...
* General patterns are – naturally – strongly affected by the connectivity components included, but this is scale dependent

### 3.2 Comparison of variants

* Table 4: Summary statistics on the differences between the variants at given levels of the top fraction of the landscape: overlap.
* The results show that the absolute highest fraction of the landscape [is / is not] relatively dependent to which variant is used. The result is very dependent on the analysis variant used
* Incorporating connectivity components will result in tradeoffs: accounting for the connectivity to existing protected areas aggregate priorities near conservation areas and draw them away from locations further away

### 3.3 Comparison to independent data sets

* Figure 4: Distributions of priority ranks (histograms) in different, independent data sets.
* Characteristics of individual data sets determine which variant should be compared to which data. E.g. the inventory data collected by the conservation NGOs should be compared to the variant that accounts for the connectivity to existing protected areas - because this was a specific objective in data collection.


## 4. Discussion

* Comparison to independent data sets relevant for biodiversity conservation indicate that known valuable locations indeed emerge from the analysis with high priorities
    * Data from conventional forestry planning coupled with a spatial conservation prioritization tool like Zonation can be used to identify areas of high conservation priorities
    * Characterize how the validation worked or not with different data sets
    * Note that results should not be extrapolated beyond the current problem definition
    * Depending on the prioritization tool used, the analysis and the results often are static → if and when dynamics are not considered it is hard to say much about persistence and hence effectiveness.
    * Formulation of the objectives is thus important and the results should not extrapolated beyond the scope of the analysis at hand
* Aligning planning needs, spatial scale, resolution and the (planning) decision-making context need careful consideration
    * There is no single best solution: the most suitable solution will have to be carefully planned
    * This implies that operational capacity also needs to be in place in order for the analysis be repeatable and adaptive
    * Learning institutions, enabling and empowerment important for the long-term adoption of new techniques (refs Knight etc.)
* Incorporation of the results into operational forestry planning – “the manager's view”
    * Antti
* Opportunities for improvement:
    * Data
        * There are clear differences in the quality of the data
        * How to improve the data base underlying prioritizations, noting that data needs to be available across a large area?
        * What would be ideal data for validation?
    * Methods
        * More realistic ecological models accounting for X, XX, and XXX
        * Known planning needs that this analysis does not answer.
    * Enabling input to decision-making
* Mainstreaming the methods
    * The road forward

# References

