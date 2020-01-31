# Projections

- READING DISCUSSION
  - couclelis
    - discuss the field/object metaphor. what kinds of things could you map with each? can anyone think of anything that blurs this boundary or would be mappable in both schemes? how would this change the way we read and interpret the map?
  - corner
    - talk about the table metaphor
    - link to the field/object conversation
    - talk about how this can be thought of in relation to projections. we need a common environment for our table. 
    - talk about joins, ability to link or compare two datasets with one another. this allows quantitative comparisons
    - what are some ways to draw connections between two datasets or layers qualititatively?
- MINI-LECTURE
  - the history of maps is closely linked with the history of surveying
    - world maps vs city maps
  - surveying basics
    - 
  - translation (through scale) from real-world measurement to paper space
  - map of rome (who?) measured in polar coordinates 
    - Alberti "Descriptio Urbis Romae" 
    - Bufalini used a *bussola* to measure the map probably from a single point
  - Cassini - mapping france
    - "The Mapmakers" Ch 8

F5 is "Giovan Battista Belluzzi, Trattato delle fortificazioni di terra, ca. 1550, illustration of bussola (surveying compass) (manuscript copy, Biblioteca Antica Z.II.24, folio 5v, Archivio di Stato Torino; by permission of the Ministero dei Beni e delle Attività Culturali e del Turismo; any reproduction is prohibited)."

- when does the map get big enough for the "earth is flat" assumption to fall apart?
 
- clocks
- meades ranch, jeffersonian grid
  - from 1913 to 1989, was the reference location for all surveys in the continent
- when we get to satellite mapping and the digital era is when we start to have the need for systematic translation between multiple reference systems. 
- birth of the "geographic coordinate system" now we mostly use WGS84, EPSG (?) to store data as lat long and altitude as given by gps transponders 

****

EPSG
CRS
angular units vs linear
surveying
datum
ability to translate
goal: creation of a universal environment for viewing and processing spatial data 
- talk about data types
Points Lines Polygons. Subtypes of each 
- SPATIAL JOIN

- table join
- coordinate systems
  - geographic
  - "projected" (mapped)
- projections - define a process for converting information in one coordinate system into another. gives us the ability to translate
- datum
- angular units (vs linear)
- latitude and longitude

- what happens if you draw unprojected data?
  - McHarg center atlas for the green new deal got major criticism on map nerd twitter for doing this. it really isn't a good look

- what are your choices?

- EPSG codes - public registry of projections (informally). Stands for European Petroleum Survey Group
  - spatial reference system
  - earth ellipsoid
  - coordinate transformation
  - units of measurement
  - kind of like a recipe. common ones are epsg:4326 which defines raw lat/long coordinates for GPS, 3857 "Web Mercator" for tile servers, QGIS has these built in 

- does it matter?

Tutorial 2 will be posted by **Noon Tomorrow**