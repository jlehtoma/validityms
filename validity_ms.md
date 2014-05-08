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

Since the extensive forest inventory data does not contain information on the occurrence of primary biodiversity features, such as species, we rely on available surrogate features. To derive an index of conservation value, we used knowledge elicited from experts to transform to inventory data into a index (see 2.5) of conservation value. Although the more detailed stand-based inventory data contains more information, the construction of the indexes was limited to information available in least information-rich data source to keep indexes from all data sources comparable. We hypothesize that the performance of the coarser data can be improved by further dividing the index features into site fertility classes that better correspond to actual forest habitats. After the data acquisition and pre-processing we use 3 different input data sets for the conservation prioritization analysis: 1) Coarse data, 2) coarse data with classes, and 3) detailed data with classes. The first two input data sets are completely based on open data whereas the third is partly based on proprietary data (see Figure 1 and 2.5 for more details). 

For the actual conservation prioritization we use Zonation software, which is capable to account for complex ecological phenomena such as connectivity. Since connectivity is an important feature of conservation planning both from the ecological (__REF__) and administrative (__REF__) perspective, we use two analysis variants for each input data set: One without and with connectivity (see 2.6 for more details). With the inclusion of connectivity we want to study if the potentially scale-dependent patterns in the input data sets produce notably different outcomes when the results are compared to the validation data. Thus we have 6 different Zonation runs (Figure 1). 

We analyze the six different result sets produced by Zonation in two main ways. First, we compare characterize the patterns of priorities within each run and compare particular fractions (e.g. the best and the worst part of the landscape) between the different runs. The expectation is that [...] Secondly, we examine the prioritization results in areas with known conservation value. If the forest inventory data sets and the index used truly capture features relevant for conservation, then we expect that these location will stand out with higher average priority than the surrounding landscape.
    
## 2.2 Study area

The study area covers the region of Southern Savonia located in South-Eastern part of Finland (Figure 1). The size of the region is ca. 13990 km^2^ and it is characterized by a large number of lakes and fragmented waterways which covers ca. 25% of the total area. Of the reminding land area, approximately 88 % or 12250 km^2^ is forestry land further divided into mineral soils (79%) and mires (21%). South boreal vegetation zone covers the whole region and forests are mostly dominated  by the Scots pine (_Pinus sylvestris_) and the Norway Spruce (_Picea abies_) with varying amounts of broadleaved trees. Land ownership is highly fragmented with private forest owners being the largest group (77.3%) followed by private companies (11.5%) and the state (6.2%) [@FinnishForestResearchInstitute2013]. Most of the forestry land is under silvicultural management with 2.5% strictly protected. This number closely reflects the average for forestry land in Southern Finland (2.5%). (__ANTTI__ expand with short description of the history)

Whereas private forest land has several different operators (including Finnish Forest Centre), the state-owned land is managed by a single organization Metsähallitus, which is further divided into 2 independent departments: Forestry department manages state production forests and Natural Heritage Services manage forests outside commercial operation, including protected areas.

(__EXPAND__ does this need a comparison to rest of Finland/Fennoscandia?)

## 2.3 Data for conservation prioritization 

__explain "data source"__

### 2.3.1 Coarse data

National Forest Inventory (NFI) is sampling-based inventory system maintained by the Finnish Forest Research Institute (FRI) that covers all land classes and land tenure throughout the whole country [@Tomppo2006b;@Tomppo2008;@Tuominen2014]. Main purpose of NFI is to "produce reliable information on forest resources and growth, the health of forests, forest biodiversity, and future cutting possibilities at national and regional forest level." [@Tuominen2014]. We used the multi-source version of the NFI (MS-NFI), which essentially combines the information from the field plots with satellite images, digital map data and statistical image analysis methods [@Tomppo2006a]. Based on this combination of data sources and methods it is possible to estimate the values of selected forest variables such as the average volume and average diameter of the growing stock and site fertility in high-resolution thematic maps. In Finland, the MS-NFI is being used mostly for regional level forestry planning and similar kind of systems are in operative use in XXX [#37]. MS-NFI data has been previously been used also for large-scale conservation prioritization studies [@Lehtomaki2009;@Arponen2012;@Sirkia2012]. Estimates produced in MS-NFI cover in principle 100% of the land area, but there might be some missing regions because of cloud coverage etc. (__should there be figures for this?__).

MS-NFI data has been publicly available since late 2012 and the thematic maps can viewed through a web portal or the rasters can be downloaded through a file service [@FinnishForestResearchInstitute2014]. For the purpose of this study, the rasters were acquired directly from the FRI. The conservation value indexes used for the prioritization (see 2.3) require that for each tree species group information on both the average diameter and the volume are available. The standard MS-NFI rasters include only one estimate for average diameter over all tree species groups. Therefore, we used an data segmentation method to derive an estimate of average diameter for each tree species group. (__SAKARI__) [#44]

From here onwards, we will generally refer MS-NFI data with term "coarse data".

### 2.3.2 Detailed stand-based data

With "detailed", we refer to detailed stand-based data means visual inventories of stands or forestry compartments which are usually produced to provide information for forest management planning on very fine scale [@Tuominen2014]. The inventories are typically carried out by different organizations depending on the land tenure. For this study, we used data from two organization operating in the study region: Finnish Forest Centre (FC) and Metsähallitus (Finnish Forest and Park Service) Natural Heritage Services (NHS).

Finnish Forest Center inventories stands __XX__ times every __XX__ or whenever new operations are implemented. The inventory is implemented by professional staff members visiting the site compartment by compartment and [... __ANTTI__] South Savonia is one of 13 regional administrative units of Finnish Forest Centre and the inventory procedure is the same in all regions. Since the forest compartments are inventoried only on need-basis or when forestry operation take place, some of the inventory data can be relatively old and thud does not represent the current state of the forest very well. To account for this, we only used data gathered in year 2000 or after. After the filtering the data, the data available from FC covered ~44% of the land area [#41]. Another additional source of information we used was spatial data on the planned forestry operations which contains information on planned operations such as thinnings and clear-cuts. We used these data to discount the value of forest areas that are planned to go through forest operations of varying degree (SI 1.3).

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

All data used from both the coarse and detailed data sources were categorized into four tree species groups: Pine, spruce, birch, or other broadleaved (Table S1). Detailed data (see 2.3.2) contain finer classification into individual tree species, but the tree species were grouped into the 4 classes in order to correspond to classification of MS-NFI [#39]. We calculated an index of conservation value for each of the tree species groups in each of the data sources separately. This index measures an expert-opinion based view on how the average diameter and the volume of the growing stock relate to ecological features desirable for conservation (__REF__). The average diameter of the growing stock per tree species group is transformed by a sigmoidal benefit function (see SI 1.2 and Figure S1) and the resulting figure is multiplied by the volume of the growing stock. The adopted approach has been used before in large-scale conservation prioritization [@Lehtomaki2009;@Arponen2012] and species-oriented prioritization (@Sirkia2012).

Effective conservation prioritization needs to be able to account for complementarity and rarity of biodiversity features (__REF__). For example, if the objective is to prioritize for new protected areas, one should consider what is already protected (__REF__). Rarity is often associated on the risk of becoming more threatened or even extinct and thus the overall range size of a biodiversity feature should be considered. In their simplest form, our indexes are based on the occurrence of tree species groups alone. We hypothesize, that further subdivision of the spatial data into classes that correspond roughly to existing forest habitat types would improve the prioritization because especially many endangered species are associated with particular and often restricted habitats (__REF__). The more detailed inventory data has enough additional information in it to enable detailed habitat classification, but again we are constricted by the information content of the coarser data. All available data sets do have, however, information on site fertility class, which is often also associated with the formation and extent of particular forest habitats (__REF__). Therefore we further created two input data sets based on the coarse data: One with just the 4 index rasters ("Coarse"), one with the 4 index rasters each divided into 5 site fertility classes ("Coarse with classes", Figure 1). We also hypothesized that prioritzation based on the more detailed - and more precise - inventory data would outperform those based on the coarser data, we found it reasonable to use as detailed data as possible ("Detailed with classes")(Table S1). Note that input data set "Detailed with " is actually a combination of coarse and detailed as the detailed data only covers ~46% of the landscape (Table 1). Both "coarse" and "coarse with classes" are completely based on MS-NFI and thus publicly available data.

The spatial resolution of the MS-NFI data is 20x20 meters so all detailed vector data was first converted to rasters of same resolution and extent (SI 1.3). All data preprocessing was done at this resolution using Python [@PythonSoftwareFoundation2014] binding to GDAL [@GDALDevelopmentTeam2014]. For spatial conservation prioritization the data was first aggregated to 60 x 60 meters for computational reasons using ArcGIS [@ESRI2014]. We wanted to retain as high resolution as possible because conservation prioritization analyses should be carried out on spatial scale that is in line with with the ecological components (e.g connectivity and average size of habitat patches) and the scale of operative planning [@Arponen2012]. 

## 2.6 Prioritizing locations for conservation

For the spatial prioritization, we used Zonation [@Moilanen2005;@Moilanen2009] version 4.0 [@Moilanen2014]. Zonation operates with a set of input rasters describing the occurrence levels of given biodiversity features, in our case the index rasters of forest conservation value (see 2.5). 

(Taken from [@Arponen2012] this is pretty much what is needed but I suppose it needs to be changed)

"It proceeds by iteratively removing the least valuable cells in the landscape, accounting for factors such as occurrence of features in the cell, remaining occurrence of each feature across the landscape, and connectivity. Zonation maximizes retention of a quantity that is summed across features (e.g., species), where features can have different weights and their local occurrence levels are normalized by range size. In other words, it seeks to remove cells with low species richness and to remove preferentially cells with occurrences of species that have low weights and extensive distributions in the remaining landscape. The repeated range-size normalization [@Moilanen2005;@Moilanen2009] leads to maintenance of a balance among all features at all iterations. Ranking of cells is especially suitable for comparing spatial overlap in areas prioritized for conservation because one can compare solutions of equal areas." 

Following best-practices for constructing Zonation runs [@Lehtomaki2013], we started from the simplest possible configurations enabling more complex features one by one. This way, it is possible to test for the exact effects that each feature has and the sensitivity of the results for different parameter values. After testing with several different combinations, we set up 2 runs for each input data sets ("Coarse", "Coarse with classes", and "Deatailed with classes"): one with and one without connectivity and had thus 6 different analysis runs (R1-R6 in Figure 2).  

All six runs R1-R6 has certain Zonation configuration options in common. We used the additive benefit function mode in Zonation [@Moilanen2007], because it emphasizes overall feature richness in a given cell and is especially suitable when dealing with habitat data (__REF__). The weight that each individual feature receives (Table S2) was based on on expert opinion and wights reflect subjective importance to given particular tree species groups and site fertility classes (see SI 1.3). The exact configuration options and parameters used in the Zonation runs can be found at [http://dx.doi.org/10.6084/m9.figshare.1018708](http://dx.doi.org/10.6084/m9.figshare.1018708). 

Runs R1-R6 also had differences (Figure 2). Number of biodiversity features (the index rasters) varied from 4 in R1 and R2 to 20 in R3-R6. Analysis runs based on the detailed data (R5 and R6) used additional information available on the planned forestry operation (see 2.3.2). Technically, this was implemented in Zonation using the data as a condition layer [@Moilanen2014]. Runs R1, R3, and R5 are so called "local" variants in a sense that they do not include any connectivity transformations. Runs R2, R4, and R6 on the other hand account for connectivity between different forest types (see SI 1.2 and Table S3). We used so called matrix-connectivity feature of Zonation [@Lehtomaki2009;@Moilanen2014] where connectivity is defined pair-wise between the input biodiversity features by connectivity coefficients (SI 1.3). The distance of the connectivity transformation effect in Zonation is controlled by $\alpha$ value which is derived from an assumed average dispersal capabilities of species [@Lehtomaki2009;@Arponen2012;@Lehtomaki2013]. We used $\alpha$ value of 0.001 which corresponds to an average dispersal distance of 2 kilometers (see [@Lehtomaki2009] and [@Sirkia2012] for further discussion and references for the distance chosen). We also tested the sensitivity of results to distances of XXX and ZZZ, but these did not change the qualitative interpretation of results significantly (see also [@Arponen2012] for further discussion on role of selected distances) (__is this needed?__). 

## 2.7 Comparison and validation of analysis runs

The spatial patterns of rank priorities can be examined on different scales and between different priority ranges. The comparisons between different runs have two dimensions: One between runs based on the same input data set (i.e. the effect of connectivity) and one between different input data sets (i.e. the effect of the input data). We performed all the comparisons using the standard Zonation outputs and data described in section 2.4. We used R (version 3.1.0) statistical language and environment [@RCoreTeam2014] and zonator R package [@Lehtomaki2014]. 

Visual examination of the rank priority maps should give an initial idea how well the the different runs - and hence the different input data sets - converge especially in terms of high or low priorities. We also compare the spatial overlap of different runs by calculating Jaccard coefficients (the intersection of two sets divided by the union of those sets) for different priority ranges. In other words, we divide each rank raster into 10 equal range bins and compare each bin to each other. This way we can compare for example the spatial overlap of the best 10% of the landscape in runs R1 and R3, but also for example the worst 10% in R1 with the best 10% in R3. 

It possible to load the rank order of a Zonation solution and run a prioritization using different input features or Zonation options using the removal order from the previous run and examine how much performance of the solution is lost [@Lehtomaki2013;@Moilanen2014]. We used this technique to see how much lower the representation levels are for the input features based on the detailed data when the rank order is taken from analyses based on the coarser data. Assuming that the detailed data is also more precise, we can then ask the question of how much feature representation do we risk losing by using the coarser data. 
  
We examined how well the results of different runs were able to capture forest region with conservation value by simply examining the priority distributions within each of the validation data sets (see 2.4). 

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

The validation procedure we use relies on few key assumptions. First, if the index layers constructed from different input data sets truly reflect forest characteristics desirable for conservation purposes, then the sites in the validation data sets should receive high priority in the results. Second, we assume that the validation data sets actually describe location of high conservation value. Protected areas have traditionally been established on less productive soils [@Scott2001;@Elbakidze2013] and therefore it is likely that they usually do not represent the full spectrum of species or habitats in any given region. However, over a period of time being set-aside from the prevailing forest management regimes will produce resources such as dead-wood that many forest are depend on [@Siitonen2000]. Woodland key-habitats on the other hand are scattered more evenly over the landscape and according to recent meta-analysis [@Timonen2011a] they contain higher amounts of critical resources such as dead-wood and consequently larger number of species as well (__check__ the details for Finland). On average the size of a WKH site is very small (0.67 ha in Finland [@Timonen2010]) and thus they're capability to support populations in the long run in uncertain. 

## 4.2 Is there a need to open detailed forest inventory data?

Open data has a major role in the play in conservation planning and decision-making, because it enables equal access to best available data, it makes the supporting scientific analysis more transparent, and it enhances the repeatability of the whole process (__REF__). The last point is especially important for applied research supporting decision-making, because underlying may change objectives, data updates, and new information accumulates sometimes rapidly. Adaptivity and repeatability are crucial in translating regional planning into local action [@Pressey2013] which in the context of the current work implies that the conservation prioritization methods would become an integral part of operative forest management planning. 

As our results showed, the highest and lowest fractions of landscape seem to be identified fairly consistently regardless of the data (fig. 3). 

Trade-offs introduced by using less accurate data are more case-specific, but it can be estimated. Conservation scientists, foresters and other practitioners are often faced with tight deadlines and limited budgets, and thus have to decide whether it is worth the time and money to try to secure access to more detailed data if coarser but easily available data exists. We found that using coarser MS-NFI-data can lead to a serious drop in the representation of especially the less abundant biodiversity features such as the herb-rich and xeric forest types (fig. 4). For example, if we are interested in the best 10% of the landscape prioritization based on MS-NFI with classes captures, on average, only half of the representation levels of the biodiversity features derived from the detailed data. For biodiversity feature on herb-rich soils, analysis based of MS-NFI with classes captures less than 10% (__check__ the exact figures) of representation levels. These differences are probably mostly due to less accurate soil fertility classification in the MS-NFI data (...). For the rarest, and hence most valuable, soil fertility classes (herb-rich and xeric) MS-NFI with classes performs slightly better than MS-NFI without classes. Hence, an ecologically justified classification of the data can improve the results even if the quantitative information (i.e. the index values) is the same. 


# References

