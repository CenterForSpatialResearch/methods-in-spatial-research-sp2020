---
title: Static Map Design
date: 2020-02-13
---

Last time we talked about data collection as a foundation for critical mapping.

In the tutorial, you guys learned some techniques for collecting your own data. How did it go? Did people face obstacles or problems?

What kinds of datasets did people produce?

## Discuss Datasets





## Discuss Reading

Won't do too much of the Momonier reading that was assigned, I apologize that there was no uploaded reading for this one. THis is a good book to look at on your own when you have more time, covers (what)

The Desimini & Waldheim reading we should look at though. Particularly for the architects in the background, this is a great text on thinking of maps as a form of drawing.

- Intro
  - p. 10 "Maps are defined broadly here by three distinguishing characteristics they share with the plan: projection, scale and symbolization."
  - Topographic Map
  - Plan
  - Diagram
  - Aerial Image
  - Legend
  - p. 16 "the plan describes grounded, physical properties" - what's lost here?
  - p. 17. Separation of the map from the plan at the dawn of GIS
  - Take on Corner: "the ambition (say what) is admirable, but the expanded context has generated an unintended looseness to mapping in design culture"
- Notes on Scale
  - What does it mean for a map to be fragmentary or episodic?
  - Scale of the body - when do we stop being able to relate the map to our firsthand experience? "...land at the airport or to arrive by boat, car or foot?
  - Power <-> availability of spatial data. Flag that this frames the relationship as top-down, what about bottom-up data creation as a means of empowerment?
  - Swiss topography rendering - "combining shaded relief with vector line work" Quantification and *qualification*

## Talk about maps

- types
  - thematic
  - reference

- USGS topographic maps
- Piscatorial atlas - poplation vs terrain
- Moon landing - limits of interactivity?
- distortions of space
  - Vignelli subway map
  - ski maps
- mapping human diversity - how much sense does this make
  - hull house vs 1960s atlas
- qualitative data visualization
  - mountains and rivers
  - flow maps
  - ways of drawing constellations (HA rey)
  - denis wood, squirrel map

## Some more technical stuff (30mins)

- Who here has made a website? (many ways, no wrong answers)
- Myspace?
- Content on the web consists of HTML, CSS, Javascript
  - HTML - describes the organization of content
  - CSS - describes style or presentation
  - JS - defines behavior (interactivity)
- A useful concept: separation of concerns
  - we can apply this to maps too! our collection of data layers is like html (sort of), the symbology we define is like css, and ui tools do things like javascript. If you think about printed maps, or maps in a book, there are some behavior/interactivity things there too, like folding...
  - Remember the point from the beginning about linked vs embedded data
  - Just like mapping, this isn't only a technical thing, it's a useful metaphor or a way of thinking about other problems - especially useful for designers (you might already do something like this when you think about your drawing workflows).
- One by one
  - HTML
  - CSS
  - JS
  - Putting it together
- To make this slightly more complicated: JS does it all
  - Javascript can control (add and remove) elements defined in HTML, set styles defined in CSS
  - It can do pretty much anything
  - **Libraries**
    - d3
    - three.js
    - mapbox gl (we will use)
- How do we make a website?
- Text editors
  - separation of concerns - plain text only
  - syntax highlighting
  - other useful tools
- Command-line interface
  - Access to operating system functions through a text interface
  - Used mainly to run programs that are too simple to provide a whole graphic interface for
  - Also gives speed and flexibility in some cases
  - "Shell" refers to the particular thing you're using to talk to the interface
  - "Bash" is a common one, used on Macs and provided with Git for Windows
  - "Terminal" is the default program for accessing the shell
  - These terms get used pretty interchangeably
  - We'll just use it to run a simple web server when we develop our map, and to track changes through Git
- What if I mess up?
- Version control & Git
  - Repository - basically just a special folder that's being watched as you work
  - Commits - when you make changes, git will detect them, but you have to tell it when you want to say "OK remember the current state of this thing"
- Git vs Github
  - Github also provides one of the easiest ways to publish a website, if you put HTML, CSS and JS into a repository and turn on Github pages, it will be served to the internet

## Outro (5mins)

Next time we'll take on interactivity and time as potential map elements - we'll read Metahaven's "White Night, a Manifesto" (pay attention to what they say about surface)
