# 1. Introduction

## 1.1 Data availability and available data

+ In many applied conservation planning situations spatially extensive high-resolution biodiversity data is not available, but various other data sources from natural resource management exist. For example, many countries having a large forestry sector have a wealth of inventory data available. 

+ Detailed inventory data is often in restricted use, but more and more publicly funded data are becoming openly available (__REF__).
    * open data policies have a huge potential for conservation planning

+ Using forest inventory data as a basis for conservation prioritization effectively surrogate use for the primary forest biodiversity data (species and habitats occurrence data): how well do inventory data work?

+ Setting the reference for surrogacy is complicated, but we have a fairly good understanding what is valuable in boreal forests from conservation point of view

+ Open data and open methods play a crucial role especially in research that is aimed to provide decision-support information

## 1.2 Spatial conservation prioritization

+ General description of background, methods, and work flows from [@Lehtomaki2013]

+ Has been done in also in the boreal forest context [@Lehtomaki2009;@Mikusinski2007;@Sirkia2012]

+ Associated uncertainties often high , performance and efficiency unknown [@Langford2011], need for (on-the-ground) validation

+ Objective of a spatial prioritization analysis can (and indeed often should) be not the highest conservation priorities, but the lowest. These are areas most suitable for e.g. intensive forestry without being too harmful for biodiversity.

+ Usefulness of the results also depends on the sensitivity of the results. Particularly, if the informative part of the results (i.e. the best fraction of the landscape for e.g. conservation) is small relative to the overall size of the landscape then the results may very sensitive to various factors

+ Priorities given by scientific analyses often not verified but rather taken at face value: multitude of available forest inventory data also opens up possibilities to assess and validate prioritization results.

## 1.3 Conservation planning in boreal forests

+ Boreal zone: Major ecoregion with very large geographic extent [@Elbakidze2013]

+ Although among the least threatened of ecoregions (REF, IUCN?)
    * Species have become threatened locally [@Rassi2010]
    * There is opportunity to set aside and/or manage relatively large areas of forest [@Elbakidze2013]
    * Significant role in carbon sequestration [@Bradshaw2009]

+ Much conservation research has been done in boreal forest context on various fields: most impact from implementation point of view on work done in general forest management planning

+ Regional conservation programmes (e.g. METSO) often must reconcile varying interests and objectives of forest owners, but again much of the general context is forestry management

+ Forestry is mostly driven by market economics and conservation has also been shifting into more
voluntary-based models emphasizing the role multi-use and ecosystem services: need for fine-grained
spatial planning.

## 1.4 Aims and scope

+ Selected region and scale,

+ Main questions of the work are:

    1. Can conservation prioritization analysis based on forest inventory data capture conservation value in boreal managed forest landscapes?
    2. How well does freely available multi-source forest inventory data perform compared to more
    detailed commercial stand-based inventory data?
    3. What are the requirements for data imposed by the conservation objectives (e.g inclusion of connectivity and complementarity)?

+ Additional the work presented aims at addressing the following practical issues:

    1. Ways to integrate conservation planning into operative forestry management and planning
    2. Making use of the available data considering the existing ownership restriction
    3. Assessing what kind of (forestry) data would be useful for conservation planning

+ In this work, we approach the aforementioned questions by a case-study of conservation prioritization in the regional forest center of Southern Savonia, Finland.

+ Similar forest inventory data exists at least in other Fennoscandian countries with similar kinds of forest planning needs

+ We also demonstrate new ways of assessing the results especially from forest planning perspective

# 2. Material and Methods

## 2.1 Study design

The main objectives of this work are to 1) study the relative performance of conservation prioritization based on forest inventory data with different precision and availability, and to 2) assess the overall performance of the prioritizations compared to validation data. The address the the former, we compare prioritization results based on coarser open data to those based on more detailed proprietary data. To answer to latter question, we compare all prioritization results to areas with known high conservation value.

Different forestry operators in the region collect inventory data in different parts of the region (Table 1) and for different purposes, but for the most part the motivation is to provide commercial services for forest owners such as forest management planning [@Tuominen2014]. To compare the suitability of different types of forest inventory data for conservation prioritization, we acquired all available inventory data from Southern Savonia. These data include both coarser data based on remote sensing and more detailed inventory data based on visual inspection of the forest stands. The former type of data comes from a single source (see 2.3.1)and the latter from two separate sources (see 2.3.2). We are interested only in forest land on mineral soils. The index of conservation value (see Section 3.1) is based on the characteristics of the growing stock and it does not account for important ecological characteristics of mires. Mires are still included in the analyses, but because mires on average have less forest than mineral soils, they systematically receive lower priorities.

Since the extensive forest inventory data does not contain information on the occurrence of primary biodiversity features, such as species, we rely on available surrogate features. To derive an index of conservation value, we used knowledge elicited from experts to transform to inventory data into a index (see 2.5) of conservation value. Although the more detailed stand-based inventory data contains more information, the construction of the indexes was limited to information available in least information-rich data source to keep indexes from all data sources comparable. We hypothesize that the performance of the coarser data can be improved by further dividing the index features into site fertility classes that better correspond to actual forest habitats. After the data acquisition and pre-processing we use 3 different input data sets for the conservation prioritization analysis: 1) Coarse data, 2) coarse data with classes, and 3) detailed data with classes. The first two input data sets are completely based on open data whereas the third is partly based on proprietary data (see 2.5 for more details). 

For the actual conservation prioritization we use Zonation software, which is capable to account for complex ecological phenomena such as connectivity. Since connectivity is an important feature of conservation planning both from the ecological (__REF__) and administrative (__REF__) perspective, we use two analysis variants for each input data set: One without and with connectivity (see 2.6 for more details). With the inclusion of connectivity we want to study if the potentially scale-dependent patterns in the input data sets produce notably different outcomes when the results are compared to the validation data. Thus we have 6 different Zonation runs (Figure 1). 

We analyze the six different result sets produced by Zonation in two main ways. First, we compare characterize the patterns of priorities within each run and compare particular fractions (e.g. the best and the worst part of the landscape) between the different runs. The expectation is that [...] Secondly, we examine the prioritization results in areas with known conservation value. If the forest inventory data sets and the index used truly capture features relevant for conservation, then we expect that these location will stand out with higher average priority than the surrounding landscape.
    
## 2.2 Study area

The study area covers the region of South Savo located in South-Eastern part of Finland (Figure 1). The size of the region is ca. 13990 km^2^ and it is characterized by a large number of lakes and fragmented waterways which covers ca. 25% of the total area. Of the reminding land area, approximately 88 % or 12250 km^2^ is forestry land further divided into mineral soils (79%) and mires (21%). South boreal vegetation zone covers the whole region and forests are mostly dominated  by the Scots pine (_Pinus sylvestris_) and the Norway Spruce (_Picea abies_) with varying amounts of broadleaved trees. Land ownership is highly fragmented with private forest owners being the largest group (77.3%) followed by private companies (11.5%) and the state (6.2%) [@FinnishForestResearchInstitute2013]. Most of the forestry land is under silvicultural management with 2.5% strictly protected. This number closely reflects the average for forestry land in Southern Finland (2.5%). [__ANTTI__ expand with short description of the history]

Whereas private forest land has several different operators (including Finnish Forest Centre), the state-owned land is managed by a single organization Metsähallitus, which is further divided into 2 independent departments: Forestry department manages state production forests and Natural Heritage Services manage forests outside commercial operation, including protected areas.

[__EXPAND__ does this need a comparison to rest of Finland/Fennoscandia?]

## 2.3 Data for conservation prioritization 

#### 2.3.1 Coarse data

National Forest Inventory (NFI) is sampling-based inventory system maintained by the Finnish Forest Research Institute (FRI) that covers all land classes and land tenure throughout the whole country [@Tomppo2006b;@Tomppo2008;@Tuominen2014]. Main purpose of NFI is to "produce reliable information on forest resources and growth, the health of forests, forest biodiversity, and future cutting possibilities at national and regional forest level." [@Tuominen2014]. We used the multi-source version of the NFI (MS-NFI), which essentially combines the information from the field plots with satellite images, digital map data and statistical image analysis methods [@Tomppo2006a]. Based on this combination of data sources and methods it is possible to estimate the values of selected forest variables such as the average volume and average diameter of the growing stock and site fertility in high-resolution thematic maps. In Finland, the MS-NFI is being used mostly for regional level forestry planning and similar kind of systems are in operative use in XXX [#37]. MS-NFI data has been previously been used also for large-scale conservation prioritization studies [@Lehtomaki2009;@Arponen2012;@Sirkia2012]. Estimates produced in MS-NFI cover in principle 100% of the land area, but there might be some missing regions because of cloud coverage etc. (__should there be figures for this?__).

MS-NFI data has been publicly available since late 2012 and the thematic maps can viewed through a web portal or the rasters can be downloaded through a file service [@FinnishForestResearchInstitute2014]. For the purpose of this study, the rasters were acquired directly from the FRI. The conservation value indexes used for the prioritization (see 2.3) require that for each tree species group information on both the average diameter and the volume are available. The standard MS-NFI rasters include only one estimate for average diameter over all tree species groups. Therefore, we used an data segmentation method to derive an estimate of average diameter for each tree species group. (__SAKARI__) [#44]

From here onwards, we will generally refer MS-NFI data with term "coarse data".

#### 2.3.2 Detailed stand-based data

With "detailed", we refer to detailed stand-based data means visual inventories of stands or forestry compartments which are usually produced to provide information for forest management planning on very fine scale [@Tuominen2014]. The inventories are typically carried out by different organizations depending on the land tenure. For this study, we used data from two organization operating in the study region: Finnish Forest Centre (FC) and Metsähallitus (Finnish Forest and Park Service) Natural Heritage Services (NHS).

Finnish Forest Center inventories stands __XX__ times every __XX__ or whenever new operations are implemented. The inventory is implemented by professional staff members visiting the site compartment by compartment and [... __ANTTI__] South Savonia is one of 13 regional administrative units of Finnish Forest Centre and the inventory procedure is the same in all regions. Since the forest compartments are inventoried only on need-basis or when forestry operation take place, some of the inventory data can be relatively old and thud does not represent the current state of the forest very well. To account for this, we only used data gathered in year 2000 or after. After the filtering the data, the data available from FC covered ~44% of the land area [#41]. 

Forest inventory data gathered and managed by Finnish Forest Center is not freely available as the Finnish Personal Data Act restricts the distribution of the data in resolution that can be linked to individuals (__REF__?). It possible, however, to gain access to data for example for research purposes [@Monkkonen2014]. 

Metsähallitus carries out similar inventories on state-owned land and the methodology and the collected information is largely the same as on private land. Metsähallitus information systems are updated computationally yearly to simulate the growth of forests and therefore we did not do any filtering based on the age of the information. We received detailed stand-based data for regions governed by Metsähallitus Natural Heritage Services after research collaboration agreement as the data is not freely available for public use. We were unable the get any data from regions governed by Metsähallitus Forestry for reasons unknown to us. Detailed data from Metsähallitus NHS covers ~2.4% of the land area [#41]. 


## 2.4 Data for validation

Ideally, the results of a conservation prioritization analysis should be compared against the known occurrences of biodiversity, i.e. species or habitat occurrence data. If such data are lacking, the results can still be compared against spatial data on areas considered to be ecologically valuable. 

### 2.4.1 Existing protected are network

Overall, protected areas cover 2.5% of the whole landscape in Southern Savonia [@FinnishForestResearchInstitute2013]. Part of this the protected areas cover mires and for the validation purposes, protected areas only on mineral soils (~1.9% of the whole landscape, Table 1) were included for the validation. The data include both state-owned protected areas as well as protected areas on private land. 

The data was acquired from Metsähallitus Natural Heritage Services who is responsible for the maintenance of the database for protected areas, both public and private. The delineation of PAs is public information, but since the data requested contains other attribute data as well, it required separated research agreement.

### 2.4.2 Woodland key-habitats

Woodland key-habitats (WKH) are a conservation instrument designed for maintaining landscape-level bio-diversity in production forests by delineating and preserving small habitat patches [@Timonen2011a]. The concept is in use in many Fennoscandian and Baltic countries and while their effectiveness as a conservation measure varies depending on the country and definition [@Aune2005;@Pykala2006;@Timonen2011a], on average WKHs seem to be hotspots for dead wood, species richness, and red-listed species [@Timonen2011a]. The average size of a Woodland key-habitat designation in Southern Savonia is XX ha [#35], which is close to the national mean of 0.67 ha in Finland [@Timonen2010], and they cover 0.5% of the whole landscape (Table 1).

Because of potential privacy issues, the exact spatial location (i.e. on scales that can be linked to an individual forest owner) of the woodland key-habitats are not public information. It is possible, however, to gain access to the data when the purpose is scientific research.

### 2.4.3 Recently acquired protected areas

The forest biodiversity conservation programme METSO is an ongoing effort to halt the decline of forest biodiversity by year 2016 [@METSO2008]. Individual forest owners can offer their forest into METSO and if the offered forest fulfills programme's scientific selection criteria, the offer is admitted into METSO and the forest owner is compensated based on the economic value of the growing stock and timber [@Korhonen2013]. The agreement can be either fixed-term (10 years) or permanent. Overall the relatively simple selection criteria seem to be working quite well both for habitat characteristics such as abundance of dead wood as well as the number of red-listed species [@Siitonen2012].

Regional implementation of the METSO programme is managed by the Centre for Economic Development, Transport and the Environment which also collects implementation statistics and maintains a spatial database on the sites admitted into the programme. Data is not publicly available, but can be acquired for research purposes. We used only permanent the conservation contracts as the conservation effectiveness of temporary or fixed-term contracts is questionable [@Monkkonen2008].

## 2.5 Calculating index for conservation value

+ All data used from all three data sources were categorized into four tree species groups: Pine, spruce, birch, or other broadleaved (Table S1). More detailed data (see 2.2.2) contain finer classification into individual tree species, but the tree species were grouped into these 4 classes in order to correspond to classification of MS-NFI [#39]. 

+ Index measures an expert-opinion based view on how the average diameter and the volume of the growing stock relate to ecological features desirable for conservation (__REF__). The average diameter of the growing stock per tree species group is transformed by a sigmoidal benefit function (see SI and Figure S1) and the resulting figure is multiplied by the volume of the standing stock.

+ Index is calculated like this for each tree species group from each data source (Figure 1).

+ Although the more detailed data have additional attribute data to further define forest habitats, this information is not present in the MS-NFI which does, however, have a feature raster identifying site fertility class. The same information is also present in the more detailed data and thus we used the site fertility classification to further refine the analysis by dividing each of the 4 index rasters into 5 site fertility classes (Figure 1). 

+ The distribution of soil fertility classes is very uneven over the landscape (__XX__) so that the very fertile and very barren sites are less common than the mesic sites. This is important because of the way Zonation operates (see 2.5.1): rare features are given more priority than more common ones. Therefore we hypothesized that adding classification based on site fertility will add the performance of the coarser data when compared to the more detailed (and presumably more correct) data.

+ To study how the prioritization based on publicly available data performs against more detailed, but proprietary data we constructed 3 input data sets (see also Table S1):
    
    1. __Coarse__: The simplest input data set used, only has the 4 index layers based on tree species groups.
    2. __Coarse with classes__: Same as _Coarse_ but classified according to site fertility classes in MS-NFI.
    3. __Detailed with classes__: MS-NFI data combined with the more detailed data (where available) and classified according to site fertility classes in MS-NFI and in the more detailed data.

+ Note that _Detailed with classes_ is actually a combination of detailed data and MS-NFI as the detailed data only covers ~46% of the landscape (Table 1). Both _MS-NFI_ and _MS-NFI with classes_ are completely based on MS-NFI and thus publicly available data.

Effective conservation prioritization needs to be able to account for complementarity and rarity of biodiversity features (__REF__). For example, if the objective is to prioritize for new protected areas, one should consider what is already protected (__REF__). Rarity is often associated on the risk of becoming more threatened or even extinct and thus the overall range size of a biodiversity feature should be considered. In their simplest form, our indexes are based on the occurrence of tree species groups alone. We hypothesize, that further subdivision of the spatial data into classes that correspond roughly to existing forest habitat types would improve the prioritization because especially many endangered species are associated with particular and often restricted habitats (__REF__). The more detailed inventory data has enough additional information in it to enable detailed habitat classification, but again we are constricted by the information content of the coarser data. All available data sets do have, however, information on site fertility class, which is often also associated with the formation and extent of particular forest habitats (__REF__). Therefore we further created two input data sets based on the coarse data: One with just the 4 index rasters ("Coarse"), one with the 4 index rasters each divided into 5 site fertility classes ("Coarse with classes", Figure 1). We also hypothesized that prioritzation based on the more detailed - and more precise - inventory data would outperform those based on the coarser data, we found it reasonable to use as detailed data as possible ("Detailed with classes").

## 2.6 Spatial conservation prioritization

### 2.6.1 Zonation

### 2.6.2 Analysis variants

## 2.7 Interpretation of results

### 2.7.1 Comparison between analysis variants

### 2.7.2 Comparison to validation data  
  
The validation procedure we did relies on few key assumptions. First, if the index layers constructed from different input data sets truly reflect forest characteristics desirable for conservation purposes, then the sites in the validation data sets should receive high priority in the results. Second, we assume that the validation data sets actually describe location of high conservation value. Protected areas have traditionally been established on less productive soils [@Scott2001;@Elbakidze2013] and therefore it is likely that they usually do not represent the full spectrum of species or habitats in any given region. However, over a period of time being set-aside from the prevailing forest management regimes will produce resources such as dead-wood that many forest are depend on [@Siitonen2000]. Woodland key-habitats on the other hand are scattered more evenly over the landscape and according to recent meta-analysis [@Timonen2011a] they contain higher amounts of critical resources such as dead-wood and consequently larger number of species as well (__check__ the details for Finland). On average the size of a WKH site is very small (0.67 ha in Finland [@Timonen2010]) and thus they're capability to support populations in the long run in uncertain. METSO-programme has strict protocol for assessing the suitability of each site (__REF__?) and the monitoring studies done so far (__REF__?) have concluded that sites admitted into the programme indeed do have high conservation values.

This is probably because PAs in South-Savo region - as in rest of the country - tend to have been set aside for a longer period of time resulting in quite mature forest structure, which is reflected in high values in the index layers (see XX) used as input. 

# 3. Results

## 3.1 Spatial patterns of rank priorities

## 3.2 Spatial overlap of priority fractions

It is not perhaps surprising given that the best parts of the landscape probably are best by a large margin and the worst parts probably do not have much forest at all. In none of the variant comparisons do the best and worst parts of landscape overlap much. From input data sets' perspective this can be considered a good thing, because such overlaps would imply serious risks of selecting poor sites if using the coarser data. Comparisons between the MS-NFI and MS-NFI with classes input data sets (V1 vs. V3 and V2 vs. V4) reveals interesting patterns caused by classification. (__EXPAND__)

## 3.3 Feature representation

## 3.4 Comparison to spatial validation data

# 4. Discussion  

Our results demonstrate that 1) Forest inventory data in conservation… 2) There is a need for detailed spatial data for operational conservation prioritization… 

Given these results, it can be concluded that when using methodology we introduce in this paper here and the variations of it used before [@Lehtomaki2009;@Sirkia2012]  openly available MS-NFI-data is best suited for situations where objective is to target regions with larger extents of mature forest. Therefore if the spatial prioritization includes objectives for detecting small scale biodiversity feature occurrences such as the WKHs, a more detailed input data set is clearly needed. Given the amount of available forest inventory data in countries like Finland and Sweden, it is very important that these data sources can be used also for conservation planning purposes for several reasons. First, since high-resolution, large-scale, and systematic observational biodiversity data is scarce (__REF__) suitable proxies for species and habitat occurrence are needed. Second, over 95% of the forest landscapes in Finland and Sweden is under silvicultural management (__CHECK__ METLA 2013; Skogstyrelsen XXXX) which uses these data for operative planning. If conservation planning is to be integrated with other types of land use and natural resource planning, it would be 

## 4.1 Can forest inventory data be used to identify valuable areas for conservation?

Here we have shown that Zonation analyses based on forest inventory data can produce informative results, but only on particular scales and when particular planning objectives are met. (__Add__ assumptions about the accuracy of the data). 

Protected areas (PAs) did come out with relatively high priorities in variants based on MS-NFI or MS-NFI with classes (fig. 5A-5D). Sites acquired into METSO-programme had also relatively high median priorities potentially indicating that they contain similar features to the larger PAs. Woodland key-habitats have the smallest average size per site out of the three validation data sets and they constitute perhaps also the most heterogeneous (__REF__) group. The fact that the classified version of MS-NFI had slightly higher median priorities (fig. 5i-5j) is most probably explained by that many of the rarer soil fertility classes (such as herb-rich and xeric soils) may also more often be designated as woodland key-habitats. Variants based on the more detailed data (V5 and V6) clearly outperform all variants based solely on the MS-NFI data  when compared against the validation data sets. Median priority is clearly higher for the variants based on the detailed data and furthermore, the priority rank distribution shows conspicuous peaks for the very highest priorities. Because of the more detailed and accurate data - also for the soil fertility classification - analysis are able to distinguish small-scale woodland key-habitats quite well. 

Whether or not such areas (e.g. PAs) truly are highly valuable in the sense that they contain significant amounts of biodiversity or resources supporting biodiversity is a different thing (REF).

The small effect of connectivity (V2, V4 and V6) has on the priority rank distributions of the validation data sets may feel slightly surprising. However, it is good to bear in mind that even combined the validation data sets cover only a small fraction of the total landscape (2.5%, see XX) and therefore the absolute amount of cells affected by connectivity transformation is low. Usually spatial conservation prioritization is concerned about the absolutely best part of the landscape, the defining what is the "best part" is a subjective decision. For example, METSO-programme has a defined objective for additional conservation in South-Savo, which correspond to ca. 5000 hectares or less than 0.5% of the total forest area (__CHECK__). On the other hand, if different conservation instruments are to employed over a significantly larger areas [@Hanski2011;@Moen2014], we must in fact be looking at top fractions significantly higher than few percent. Over larger areas, the role of connectivity also becomes more apparent (fig. 2) as regions with higher density of high quality sites are emphasized. Emphasizing connectivity will almost certainly happen at the expense of local habitat quantity and quality [@Hodgson2009]. Increasing the priority of medium-quality forests that are well-connected will lower the value of other similar quality sites and possibly even poorly connected high-quality sites (fig. 2). Trade-offs introduced by taking into account connectivity will naturally depend on the implementation of a particular method (in or case Zonation), but the issues related to it are conceptually quite well understood [@Hodgson2009;@Arponen2012]. 

## 4.2 Is there a need to open detailed forest inventory data?

Open data has a major role in the play in conservation planning and decision-making, because it enables equal access to best available data, it makes the supporting scientific analysis more transparent, and it enhances the repeatability of the whole process (__REF__). The last point is especially important for applied research supporting decision-making, because underlying may change objectives, data updates, and new information accumulates sometimes rapidly. Adaptivity and repeatability are crucial in translating regional planning into local action [@Pressey2013] which in the context of the current work implies that the conservation prioritization methods would become an integral part of operative forest management planning. 

As our results showed, the highest and lowest fractions of landscape seem to be identified fairly consistently regardless of the data (fig. 3). 

Trade-offs introduced by using less accurate data are more case-specific, but it can be estimated. Conservation scientists, foresters and other practitioners are often faced with tight deadlines and limited budgets, and thus have to decide whether it is worth the time and money to try to secure access to more detailed data if coarser but easily available data exists. We found that using coarser MS-NFI-data can lead to a serious drop in the representation of especially the less abundant biodiversity features such as the herb-rich and xeric forest types (fig. 4). For example, if we are interested in the best 10% of the landscape prioritization based on MS-NFI with classes captures, on average, only half of the representation levels of the biodiversity features derived from the detailed data. For biodiversity feature on herb-rich soils, analysis based of MS-NFI with classes captures less than 10% (__check__ the exact figures) of representation levels. These differences are probably mostly due to less accurate soil fertility classification in the MS-NFI data (...). For the rarest, and hence most valuable, soil fertility classes (herb-rich and xeric) MS-NFI with classes performs slightly better than MS-NFI without classes. Hence, an ecologically justified classification of the data can improve the results even if the quantitative information (i.e. the index values) is the same. 


# References

