# Curriculum Development Notes

## Admin

- [ ] transfer repo to CSR organization
- [ ] Write remaining tutorials
- [ ] Create participation/attendance sheets
- [ ] set up print build script to pull reading pdfs and put them in build folder
- supplies - make sure to get the right dongle to connect to 200 buell projector, investigate blackboard situation

## To Discuss

- setup: easier/better to transfer class repository to CSR git ownership and contribute
- [ ] Clarify intent around teaching both open-source desktop GIS and web maps
  - Secondary title, "Mapping in Public"?
  - Highlight this in tutorials where possible 
- Possible to work in something on internet infrastructure and how the internet itself is a spatial technology
- Terminology: spatial data vs GIS? 
- Terminology: participatory sensing? 
- Clarify intent around tutorial/class sequence. Discussion of concepts to take place prior to tutorial or after?
- audience
  - anticipate non-gsapp students. anthro, history, latin & etc phd, journalism, general studies
  - Computing infrastructure, non-gsapp students have qgis access? GSAPP installed version? Assumptions about personal computer availability?
  - [ ] Add syllabus section on computing resources & expectations. lehman/empirical reasoning barnard (undergrad) for both help and computers. strongly encouraged to have own computer
  - 
- final assignment gets announced in 2nd week, students choose either/both of data gathering assignmetns to use in map final deliverable is both maps plus written reflection 3pg
- make sure theres a spatial join!

## Syllabus (Document)

- Styleguide: use md code snippets only for actual code. Important terms should be in **bold**, interface elements or messages should be quoted.
- [ ] Fix typos
- [ ] Proofread syllabus for clarity
- [ ] how to remove "figure" from captions, see [here](https://tex.stackexchange.com/questions/82456/how-to-remove-figure-caption-prefix-figure-in-beamer)
- [ ] finish tweaking csl file so syllabus bibliography renders correctly

## Class Material & Tutorials

- [x] Moved all recommended source tutorials to this repo

### The Cartographic View (1/3)

#### Week 1: An introduction to critical GIS concepts and techniques

- Date: 1/24
- Reading
  - Harley: Deconstructing the Map
  - Kurgan: Introduction & Mapping Considered
- Tutorial
  - Topics covered:
    - working with spatial data 'locally' (in a desktop environment) with QGIS
    - start and save a map project
    - add vector and raster spatial data to the map project from different sources
      - your hard drive
      - over the network
    - access the Attribute Table of a vector layer
    - change the symbology of a vector layer using qualitative attributes
  - Changes needed:
    - move section on changing projections to Tutorial 2
- Presentation
  - Files and data, terms and concepts
    - **directory**
    - **file**
    - **file encoding**
    - **file type**
      - shapefiles
      - geojson
    - **database**
      - network
      - esri "file geodatabase" (spatialite, sqlite)
    - **data types**
      - **raster**
      - **vector**
        - **point**
        - **poly(line)**
        - **polygon**
        - surfaces, hatches
        - 3d
  - Data communities
    - Discuss who shares/uses data and how
    - File-based systems
    - [Groupware](https://en.wikipedia.org/wiki/Collaborative_software#Groupware) revolution
    - Downside: who maintains the commons? Currently mostly corporate subscription-based or commercial platforms
  - Talk about projections for next tutorial
- Tutorial 1
  - Deadline: in class demo, students to complete at home prior to next class.

#### Week 2: Working with cartographic projections

- Date: 1/31
- Tutorial 2
  - Deadline: beginning of class
  - Topics covered:
    - add a csv table to a map project,
    - perform a table join
    - Simple selections by attributes [needs to be added]
    - change the symbology of a vector layer using quantitative attributes,
    - layout and compose a map
    - export a finished map
  - Changes needed:
    - Could add in using gridded population of the world dataset?
    - Add in section of changing projections or demo this during class?

### Making Spatial Datasets (2/3)

#### Week 3: Making spatial datasets through observation and sensing

- Date: 2/7
- Tutorial 3
  - Deadline: beginning of class
  - Topics covered:
    - should involve changing or in someway working with projections?
  - Changes Needed:
    - needs to be written

#### Week 4: Making spatial datasets through archival research

- Date: 2/14
- Tutorial 4
  - Deadline: beginning of class
  - Topics covered:
  - Changes Needed:
    - Merge/reorganize two tutorials from summer workshop

### Making Public Work (3/3)

#### Week 5: Cartographic design principles

- Date: 2/21
- Tutorial 5
  - Deadline: beginning of class
  - Changes needed:
    - needs to be written

#### Week 6: Producing public work through interactive maps on the web

- Date: 2/28
- Tutorial 6
  - Deadline: beginning of class
  - Changes needed:
    - Rewrite/reorganize two tutorials from summer workshop

#### Final Project

- Deadline: 3/3
