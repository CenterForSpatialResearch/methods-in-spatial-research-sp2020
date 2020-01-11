

## Georeferencing a scanned paper map

#### Premise

In this exercise, we will create spatial data from a scanned paper map. As far as a computer program (such as QGIS) is concerned, a scanned map is an image, and the geographic information contained within it is largely incomprehensible to a computer. So, while an image is human-readable as a map, it is not "computer-readable," so to speak.

The first thing we need to do to transform a scanned paper map into a map that a computer can read is to *georeference* it. This means that we will match spots on the image with coordinates on a map. Though we will use a webmap for this (Open Street Maps), it could be done with any map that has coordinate information embedded in it.

In the second part of this tutorial, we will take this georeferenced map and digitize some of the features on it to make a new dataset that can then be used with this map or imported into other projects as a shapefile itself.

In this tutorial, we will explore some of the georeferencing tools available in QGIS and use them to georeference a 1902 map of the Bronx. You will learn how to use GIS tools to georeference raster datasets. You will use the georeferenced map for the next exercise where you will digitize vector features from the map information.

#### Notes on the data:

The map you will be using for this exercise is one sheet of six from "Map or plan of that part of the Borough of the Bronx, City of New York, lying easterly of the Bronx River" published in 1902.  This map is from the Columbia Map collection and is an exceptionally detailed, large scale (1:7,200) series made shortly after the area east of the Bronx River was annexed from Westchester to the Bronx, and the Bronx was consolidated into New York City and New York County. The library catalog record for the map can be found [here](https://clio.columbia.edu/catalog/9282162). If you would like to see the entire map, there is another copy (in a lower resolution) in the New York Public Libraries digital collections [here](http://digitalcollections.nypl.org/items/dc910ee0-4682-0131-4759-58d385a7bbd0)

You are going to use [OpenStreetMap](https://www.openstreetmap.org/about) (OSM)  as reference data for the georeferencing process. OSM provides a free, open-source map of the world from public domain and volunteered data.

#### Before you begin
If you haven't already, download the GitHub repository for this course. Using the green button [here](https://github.com/CenterForSpatialResearch/MappingForTheUrbanHumanities_2018), select `Download ZIP`. The Class_Data folder will then have all of the datasets needed for tutorials.

#### Setting up QGIS

Open QGIS:

![open]

You are going to use OSM data as the reference data for the georeferencing process. You can view the OSM web basemap service directly through QGIS. One way to do this is to connect to OSM directly through the QGIS browser.  Expand "XYZ Tiles" in the QGIS browser listing and click on OpenStreetMap:

![XYZ Tiles]

Since you are working in a new QGIS project, the map should show the entire earth as the default:
![OSM]

Use the zoom-in tool ![zoom tool] and zoom into the Central Bronx in the area around The Botanical Garden:

![garden zoom]

Now you will access the georeferencing tools and match the scanned map to the OSM map.

Under the Raster menu,<!--Georeferencer was not automatically activated on my version. May have to manually activate on others.--> select Georeferencer..:

![georeferencer]

The Georeferencer screen will open:

![georeferencer window]

Click on the Add Raster button ![Add Raster] and navigate to the JPEG image "Bronx1902Sheet2_Edit.jpg" from the class files in the directory Class_Data/Tutorial2_Georeferencing.

It will appear in the georeferencer window:

![georeferencer window with map]

This map is one sheet of six of a map of the East Bronx in 1902.  This section represents the area around the New York Botanical Garden and the (then new) Bronx Zoo. Fordham University can be seen just to the southwest of the garden and the Norwood neighborhood is in the northeast corner. The area to the east of the Bronx Park area is still largely undeveloped at this point.

Historical maps can be difficult to georeference, and this sheet illustrates a number of the complications that can arise. The map projection is unclear and there are no ground control points or coordinates specified on the image itself. Because of this, you will georeference by matching physical features represented on the map with their current counterparts (and their known coordinates). However, most of the features in this map have changed or no longer exist (or were never actually built in the first place). Thus, you will need to be very careful to choose locations that you are confident match up well with their contemporary counterparts. Fortunately, there are a number of good candidates, particularly on the western half of the map where many streets and buildings still exist in the same location. You can use these landmarks to georeference the map.

The QGIS georeferencer does not allow you to view both the scanned map and the workspace at the same time, so you will have to inspect both maps in turn and choose carefully to select locations to add georeferencing control points.
One candidate is the Haupt Conservatory in the Botanical Garden which continues to exist largely its original configuration. Use the georeferencer zoom tools ![zoom tools] to zoom to the conservatory structure in the southwest corner of the park:

![Conservatory]

![Conservatory zoom]

Identify as precise a location as possible (a corner of the building will work nicely) and click on it in the georeferencing window using the add point tool ![Add Point] When you do so, the Enter map coordinates window appears:

![Enter Coords]

If you knew the coordinates of this location, you could now add them manually, but since you do not, you can select them from the OSM data in the main QGIS window. Click on the ![From map canvas] button to see the QGIS workspace.
You may want to zoom in very closely to the conservatory.

![osm conservatory]

Once you do so, you will need to reactivate the add point tool ![Add Point] by maximizing the georeferencing window and clicking the ![From map canvas] button again. Once you select the same location on the workspace window, you will automatically be brought back to the georeferencing window where the assigned coordinates will be imputed.

![Coordinates imputed]

At this point, if you are dissatisfied, you can move the assigned control points with the move GCP point tool ![Move Point] or delete it entirely and start over with the delete point tool ![Delete Point].
If satisfied, click the OK button and the point will be assigned and appear on the map.

A link table entry will be generated on the bottom of the window:

![Link Table]

To add a second point, repeat the same process. It is a good idea to choose another point in a different portion of the map. A street intersection or corner from the western portion of the map will work well for this as most of those streets continue to exist in the same configuration.

Here, I have zoomed in to the northwestern most potion of the map where I add a ground control point at the very center of the intersection of Gun Hill Road and Tryon Ave:

![Intersection]

Repeat the same steps to select the center of the same intersection from the OSM map and add the locations to the link table:

![Intersection link]

You must add a minimum of four points to complete the georeferencing (although more is generally better). Generate at least two more points on your own and add them to the link table.

Be careful to make sure that the control points you add match. This can be quite tricky as many of the features have changed or were not actually built as planned.

Normally it is a good idea to choose control points from throughout the map. However, in this case this will be difficult as there are few features in the eastern sections of the map that can be reliably associated with contemporary locations.

In this example, I selected six control points:

![Six points]

It is good practice to save the table of control points at this stage. Choose “Save GCP points as” under the file menu and save it in the .points format in the same location as the image. This will allow you to later recreate the work you have done:

![Save points]

Next, you will “transform” the image and create a georeferenced version of the scanned map image. In the georeferencer window, select transformation settings under the settings window:

![Transform]

Make the following selections:

Transformation type: `Polynomial 1`

Resampling Method: `Cubic` (usually used for images and photos)

Output Raster: *save this in the same folder you are working in*

Target SRS: `EPSG:3857` (*this is the pseudo Mercator projection used in the OSM data — you may have to manually add this*)

You should also opt to have the georeferenced layer "Load in QGIS when done":

![Transformation Settings]

Close the settings options and click on the start georeferencing button ![Start Referencing].

After the transformation finishes, you should see the map appear in the QGIS workspace:

![georeferenced map]

You can make the scanned map layer partially transparent in the layer properties.  Right click on the map in the layer panel and select properties:

![properties]

On the left panel in the properties dialog, select Transparency, here you can adjust the global transparency with a slider:

![transparency]

Compare the georeferenced map with the Open Street Map layer.  Make sure that features appear to match up closely:

![review]

In the next exercise you will be using the sheet you georeferenced here and digitize some of the features from it.


______________________________________________________________________________________________________________

Tutorial written by Eric Glass, for *Mapping for the Urban Humanities*, a intensive workshop for Columbia University faculty taught in Summer 2019 by the [Center for Spatial Research](http://c4sr.columbia.edu). More information about the course is available [here](http://c4sr.columbia.edu/courses/mapping-urban-humanities-summer-bootcamp).

[open]: Images/2019/GeoRef1.png
[XYZ Tiles]: Images/2019/GeoRef2.png
[OSM]: Images/2019/GeoRef3.png
[zoom tool]: Images/2019/GeoRef4.png
[garden zoom]: Images/2019/GeoRef5.png
[georeferencer]: Images/2019/GeoRef6.png
[georeferencer window]: Images/2019/GeoRef7.png
[Add Raster]: Images/2019/GeoRef8.png
[georeferencer window with map]: Images/2019/GeoRef9.png
[zoom tools]: Images/2019/GeoRef10.png
[Conservatory]: Images/2019/GeoRef11.png
[Conservatory zoom]: Images/2019/GeoRef12.png
[Add Point]: Images/2019/GeoRef13.png
[Enter Coords]: Images/2019/GeoRef14.png
[From map canvas]: Images/2019/GeoRef15.png
[osm conservatory]: Images/2019/GeoRef16.png
[Coordinates imputed]: Images/2019/GeoRef19.png
[Move Point]: Images/2019/GeoRef20.png
[Delete Point]: Images/2019/GeoRef21.png
[Link Table]: Images/2019/GeoRef22.png
[Intersection]: Images/2019/GeoRef23.png
[Intersection link]: Images/2019/GeoRef24.png
[Six points]: Images/2019/GeoRef25.png
[Save points]: Images/2019/GeoRef26.png
[Transform]: Images/2019/GeoRef27.png
[Transformation Settings]: Images/2019/GeoRef28.png
[Start Referencing]: Images/2019/GeoRef29.png
[georeferenced map]: Images/2019/GeoRef30.png
[properties]: Images/2019/GeoRef31.png
[transparency]: Images/2019/GeoRef32.png
[review]: Images/2019/GeoRef33.png

## Digitizing Features from a georeferenced map

#### Premise

In this exercise, you will *create your own dataset* by outlining the trees that were represented in the "1902 map or plan of that part of the Borough of the Bronx, City of New York, lying easterly of the Bronx River" that we previously georeferenced. Making new data from historic maps is a fairly common, if laborious, practice. In many cases, the data we are interested in is not digitized, so we have to translate it ourselves. This process can be compared to digitizing books handwritten in script by typing them. It is time-intensitve, but sometimes, it is the only way to get the data we need in a format a computer can read.

Through this tutorial, you will explore some of the on-screen hand digitizing tools available in QGIS and use them to digitize trees, paths and other features from a georeferenced map. In essence, you will be converting raster spatial data into vector-based features.

#### Notes on the data:

The map you will be using for this exercise is the map sheet from "Map or plan of that part of the Borough of the Bronx, City of New York, lying easterly of the Bronx River" that you georeferenced in the previous exercise. If you have not already done so, please complete [Tutorial 2: Georeferencing](https://github.com/CenterForSpatialResearch/mapping_for_the_urban_humanities/blob/master/Tutorial2_Georeferencing.md) exercise.

### Digitizing Exercise

Open a **new project** in QGIS.

Since we already georeferenced our map, you only need to load the georeferenced tiff file. In the process of georeferencing it, we aligned the image with spatial information that QGIS can understand. It is now similar to the raster file for the gridded population of the world that we used in Part I. This is important because we can now combine other datasets such as historic or current population data, maps showing development in the intervening years, or other datasets. We can also use the data that was drawn onto this map and combine it with other datasets once we translate it from the scanned version into a digitized version.

Let's start with our map.

Click on the Data Source Manager button ![Data Source] choose raster and navigate to the georeferenced image you made in the [Tutorial 2: Georeferencing](https://github.com/CenterForSpatialResearch/mapping_for_the_urban_humanities/blob/master/Tutorial2_Georeferencing.md) exercise.  Click Add:

![Add Map]

Since you verified its accuracy already, you will not need any basemap data for this exercise, so your project will look like this:

![Map Sheet]

This map is part of a very large-scale plan and the Bronx park area, which contains the then-new botanical garden and zoo, is particularly detailed. Every structure, road, walking path, and tree is mapped. We would like to be able to use this data in another setting, so we will digitize some of the features. We will start by digitizing trees. For the trees, we will use point geometry, so this will be a particularly simple dataset.

Zoom into the southwest corner of Bronx Park, where the Conservatory garden and library are (labeled "museum" on the map):

![zoomed map]

We will create a New Shapefile layer consisting of points. Navigate to Layer >> Create Layer >> New Shapefile Layer:

![New Shapefile]

In top of the New Shapefile Layer dialog box, save the new file in the same directory with your map, and name it "BronxParkTrees". Choose geometry type “Point”. Assign the same EPSG:3857 Pseudo-Mercator projection you used for the map in the previous exercise.  

Every point will have its own unique ID that you will have to enter.  If you want to attach more data, you can create additional attribute fields for your dataset. It is best practice to separate all of the data types into different attributes (i.e., if you had data about the age of the tree, you would make another attribute field for "Age," etc.). When making data, having additional specific categories is always preferable to having a smaller table.

In the "New Field" Name box, enter the Name, "Type," to create a new attribute (We might fill this attribute with values such as "Maple," "Walnut," or "London Plane.").  Choose attribute type "Text Data" and click ![Add to Fields List] then click `OK`:

![New Layer Settings]

The layer will now appear in the Layers panel:

![Layers List]

Now click on the BronxParksTrees Layer to activate it and turn on editing by clicking on the Toggle Editing Tool ![Toggle editing]

![Editing Mode]

Now the `Add Features` ![Add features] tool should be available. Click on the ![Add features] to begin digitizing trees.  This tool gives us a crosshair cursor. For every tree (or other data point) we want to add, all we have to do is click on it. An attribute dialog appears where we can type in attribute information for the feature we just created:

![Attribute entry]

There is no information on the map in regards to the type of tree; however, I happen to know that the trees in front of the library are a stand of stately tulips, so we can enter that information now. We will give each tree a unique id so that we can reference them later (unfortunately, QGIS does not do this automatically, and doing this manually is prone to errors. However, it is still worth doing as it is much easier to work with data where the rows have unique identifiers). It is generally best practice to make these identifiers simple and uniform. For example, while "3rd tree on the left after the museum" is unique and probably refers to one and only one tree, this naming system would be difficult to make consistent in our dataset. This is obviously a silly example, but the issue becomes much more relevant if we think about buildings, names, or even states (i.e., New York is unique, but NY is a better identifier — simpler, but also because other states also begin with "New"). For our trees example, I'm just going to use sequential numbers.

Click `OK` when finished.

Continue to digitize trees in this corner of the park:

![More trees]

We can move or edit the point features with the Vertex Tool, click ![vertex tool] and then click on the desired point to select it:

![select point]

 You can manually move a selected point with the mouse or delete it with the delete key on the keyboard:

 ![move point]

  It is a good idea to regularly use the “save for all layers” function, under the Current Edits menu ![current edits], to save your work as you digitize:

![Save Feature]

When finished, depress the toggle editing tool ![Toggle editing] to close the editing session and save your changes to the layer.

We are also interested in where the park pathways were situated. However, in order to do this, we will need to create another new shapefile layer. The reason for this is that the pathways will be made with lines, while the trees were made points. It is best practice to keep different types of shapes (points, lines, and polygons) separate (luckily, QGIS won't let us make them all as the same file anyhow). This is a general principle to keep in mind when making data. When working with datasets, the more uniform the dataset is, the better, and the less information per bin, the better. So, whether it is breaking up different data types, or separating each datum into its own bin, we want to organize our data by categories rather than human-readable things like words.

So let's get started with digitizing the park pathways. Create another new shapefile layer as above (Layer >> Create Layer >> New Shapefile Layer). This time, use `BronxParkPaths` as the name. Select "Line" as the vector type. Again assign the same EPSG:3857 Pseudo-Mercator projection.  I'm going to include the "Path Type" attribute to keep track of if the path is for a "major" or "minor" path. The only thing I will type into this box is "major" or "minor" (in all lowercase). If I wanted to make a sub-type of either of these categories, I would have to add another attribute.

![New Line Layer]

Now when you toggle on editing and select the add features tool ![Add Line features]. You will be digitizing line features. As you click with the add features tool you can continue to add as many vertices to the line as you wish. To complete the line segment, use the right mouse button.

Line features are more complex than the point features, so we need to consider a few more dimensions (pun intended :) ). Since these streets are so detailed, we could potentially digitize everything from the path outlines to the curbs; this is more detail than we need. For our analysis, we are less concerned with the outline of the paths (the space they take up) and more concerned with where the paths were situated. Therefore, we are going to digitize the "centerline," using a single line feature to represent the center of the path feature.

We also must decide where to begin and end the individual line features. A common practice is to create individual features between every intersection, ending each feature at the next intersection. This is advantageous because we can represent the connectivity of the features, essentially modeling a network. But doing it this way means that we must make sure that the connecting features are exactly coincident. QGIS has a handy feature to help with this: snapping tolerances. Snapping tools will automatically adjust the digitizing tools and "snap" them to specified features as the cursor gets sufficiently close.

To activate and customize the snapping tools, navigate to Settings >> Options:

![Settings Options]

In the Options dialog, choose the Digitizing tabs and navigate to the snapping options:

![Digitizing options]

Set the snapping options for the current layer to be within 10 map units of a vertex (our map units are meters, based on the projection we are working in):

Check on `Enable snapping by default`

Default snap mode: `Vertex`

Default snapping tolerance: `10.00000` `map units`

![Digitizing settings]

Click `OK`

Now the `Add feature` tool will automatically snap to another feature’s vertex whenever the cursor comes within 10 meters.

Activate `Editing Mode` and select the add features tool ![Add Line features]. Be careful to keep each vertex as close to the center of the street as possible. The more vertices you add, the smoother the street can be. Right click at the middle of the first intersection. This ends a line.

The attributes box will appear. I was digitizing a "major" path, so I entered:

id: `1`

Path Type: `major`

![Create Line]

Begin the next feature at the endpoint of the first. Make sure the first point "snaps" to the last vertex. In QGIS the cursor will highlight when you get within the snapping tolerance.

Continue to digitize until the next intersection.

**TROUBLESHOOTING**

If you can't make a second line, your snapping tool may have small, easily resolved bug. Go back to Settings >> Snapping Options, and change the Tolerance from 10 map units to 10 pixels. This is a much smaller distance, but will solve the problem. Continue digitizing the paths.

**END TROUBLEHSHOOTING**

![All paths]

You can make the line bigger by clicking on the layer and navigating to Properties >> Style and change the line width - though this is not necessary.

Be sure to save your work regularly.

When you are completed, you will have two new datasets that you can use to study the evolution of the park's vegetation and paths. The features you encoded (i.e., tree type or path type) are permanently attached to the geometries you just traced as well. You will also be able to import these new datasets into any other QGIS project.

If you would like to see several detailed GIS datasets made from this map, you can find several layers in [Geodata@Columbia](https://geodata.library.columbia.edu/catalog?f%5Bdct_provenance_s%5D%5B%5D=Columbia&q=1902+bronx&bbox=-73.973419%2040.704275%20-73.73378%2040.953663) available for public use.

______________________________________________________________________________________________________________

Tutorial written by Eric Glass, for *Mapping for the Urban Humanities*, a intensive workshop for Columbia University faculty taught in Summer 2019 by the [Center for Spatial Research](http://c4sr.columbia.edu). More information about the course is available [here](http://c4sr.columbia.edu/courses/mapping-urban-humanities-summer-bootcamp).

[Data Source]: Images/2019/Digitize1.png
[Add Map]: Images/2019/Digitize2.PNG
[Map Sheet]: Images/2019/Digitize3.png
[zoomed map]: Images/2019/Digitize4.png
[New Shapefile]: Images/2019/Digitize5.png
[Add to Fields List]: Images/2019/Digitize6.png
[New Layer Settings]: Images/2019/Digitize7.png
[Layers List]: Images/2019/Digitize8.png
[Toggle editing]: Images/2019/Digitize9.png
[Editing Mode]: Images/2019/Digitize10.png
[Add features]: Images/2019/Digitize11.png
[Attribute entry]: Images/2019/Digitize12.png
[More trees]: Images/2019/Digitize13.png
[vertex tool]: Images/2019/Digitize14.png
[select point]: Images/2019/Digitize15.png
[move point]: Images/2019/Digitize16.png
[current edits]: Images/2019//Digitize17.png
[Save Feature]: Images/2019/Digitize18.png
[New Line Layer]: Images/2019/Digitize19.png
[Add Line features]: Images/2019/Digitize20.png
[Settings Options]: Images/2019/Digitize21.png
[Digitizing options]: Images/2019/Digitize22.png
[Digitizing settings]: Images/2019/Digitize23.png
[Create Line]: Images/2019/Digitize24.png
[All paths]: Images/2019/Digitize25.png

Adapted from [Mapping for the Urban Humanities, Summer 2019 Workshop](https://github.com/CenterForSpatialResearch/mapping_for_the_urban_humanities) by Bernadette Baird-Zars, Eric Glass, Leah Meisterlin
