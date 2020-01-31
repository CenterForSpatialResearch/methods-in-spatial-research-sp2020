---
title: Tutorial 6
publish: false
---
todo: look at https://github.com/CenterForSpatialResearch/MappingForTheUrbanHumanities_2017/blob/master/Tutorials/07_Webmaps.md


# Tutorial 6
 

# Tutorial 8: Web Mapping 1

We are going to be making webmaps using [Mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/). This is a recent javascript library that uses [WebGL](https://en.wikipedia.org/wiki/WebGL) to render interactive maps from vector tiles (as opposed to raster tiles) created with [Mapbox Studio](https://www.mapbox.com/mapbox-studio/). Data for these maps comes from [OpenStreetMap](https://www.openstreetmap.org).

This tutorial will introduce you to the basic setup and what it feels like to develop for a web browser. This will be a very different approach than our experience with QGIS, and it is much more prone to error given the number of new concepts and syntaxes involved. Brackets, commas, quotes, and colons... stay with it—it's ok if you dont understand what everything is doing at first.

## Setup Prerequisites

At this stage, you should have:
- created a [GitHub](https://github.com) account
- created a new repository on GitHub, called `webmap_1`
- set up your repository as a [GitHub page](https://pages.github.com/) (a project site from scratch)
- installed [git](https://git-scm.com/downloads)
- opened your terminal (Applications > Utilities > Terminal.app) and learned how to [navigate](https://www.macworld.com/article/2042378/master-the-command-line-navigating-files-and-folders.html)
- set up git, ie:  
`git config --global user.name 'My Name'`  
`git config --global user.email 'email@wherever.com'`  
...and added [colors](https://nathanhoad.net/how-to-colours-in-git)
- cloned a local copy of your repository to your computer using [git](https://thenewstack.io/tutorial-git-for-absolutely-everyone/):  
`git clone https://github.com/yourusername/webmap_1`
- downloaded a text editor like [Sublime Text](https://www.sublimetext.com/)
- created the empty files `index.html`, `style.css`, and `map.js` with your editor and added them to your repository:  
`git add index.html style.css map.js`
- commited and pushed your changes:  
`git commit -m 'initial import'`  
`git push`  
- viewed the result on your github page


## A web page

HTML is the structure of a web page, css is the style, and javascript is the functionality or the interaction. Each of these are contained in text files with the appropriate extension—and they each have entirely different syntax. When you are creating a website you are creating a series of linked files that your browser downloads and uses to construct the display. These files can also come from remote resources, such as in the case of javascript libraries or map tiles.

![Directory Structure][DIRECTORY]

HTML is defined by a series of tags, which are either in the form `<tag />` or `<tag></tag>`. A comment in HTML, which is simply a non-functional bit of text meant to explicate the code, is in the form `<!-- comment -->`. Reproduce the following in your `index.html` file using your text editor (you can copy and paste).

```html
<!DOCTYPE html> <!-- let the browser know this is an HTML file -->

<html>      <!-- everything else is enclosed in html tags -->
<head>      <!-- the head is for metadata prior to building the page -->

    <!-- define the character set -->
    <meta charset='utf-8' />    

    <!-- the title of the page which will show up in the browser bar -->
    <title>Map Test</title>     

    <!-- discourage the browser from caching the page -->    
    <meta http-equiv='Cache-Control' content='no-cache, no-store, must-revalidate' />
    <meta http-equiv='Pragma' content='no-cache' />
    <meta http-equiv='Expires' content='0' />    

    <!-- tells mobile devices how to scale the page -->    
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />

    <!-- stylesheet links -->
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.50.0/mapbox-gl.css' rel='stylesheet' />     
    <link href='style.css' rel='stylesheet' />

    <!-- javascript links -->
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.50.0/mapbox-gl.js'></script>

</head>
<body>      <!-- visible structure of page begins here -->

    <!-- an element called 'map' -->
    <div id='map'></div>

    <!-- an element called 'info' -->
    <div id='info'></div>

    <!-- load additional javascript -->
    <script src='map.js'></script>    

</body>
</html>
```

Notice that we are loading several files within this page (these are in the `<link>` and `<script>` tags). These include a css and javascript file from Mapbox, and our own css and javascript files. Some files need to be loaded in a particular order — the reason `map.js` is loaded within the body and not the head is that it must be loaded _after_ the `map` and `info` elements have been created.

Likewise, put this into your `style.css` file:

```css
body, html {
    margin: 0;
    padding: 0;
    font-family: monospace;    
}                

#map {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
}

#info {
    position: absolute;
    top: 0;
    right: 0;
    margin: 10px 10px auto auto;    /* top right bottom left */
    padding: 5px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 12px;
    text-align: center;
    color: #222;
    background: #fff;
}

img {
    width: 300px;
}
```

CSS, which stands for Cascading Style Sheets, defines the display properties for each HTML element — that is, how the page _looks_. At the moment, our page only has two elements, which you see defined here as `#map` and `#info`. We also have defined a default width for images. Note that a comment in css is designated like `/* comment */`.

Next, copy the following text into your `map.js`:

```javascript
console.log("Hello, world!")
```

Unlike HTML and css, javascript is a programming language. HTML and css give important information to the browser, but they are like blueprints, whereas javascript is more like a recipe. Javascript will be our focus for the webmapping exercises. We are going to stop short of covering all general programming fundamentals, but you will learn how the various elements function and how to modify code to suit your purposes.

`console.log` is a debug statement—it lets you write to the javascript console to keep track of what you're doing, which is a very helpful tool.

At this point, open `index.html` in your browser (we will use Chrome for this exercise — other browsers have similar tools but Chrome is the most straightforward for our purposes). We will look at it with your github web address later, but for now you are just looking at your site "locally." Your browser should show an address that is something like "`file:///Users/bjh18/Desktop/webmap_1/index.html`" On the page itself you should see ... nothing.

However, in your browser open `View > Developer > JavaScript Console` <!--(Chrome) or `Develop > Show JavaScript Console` (Safari, with "Show Develop menu in menu bar" turned on in the Preferences under advanced) -->. You should see "[Hello, world!](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program)" printed. This means that your `map.js` file has been successfully loaded and you are ready to start programming. If you see any error messages, check the format of your HTML and that the script tag which loads the Mapbox javascript are formatted correctly.

![Hello world][HELLOWORLD]

## Basic Mapbox GL JavaScript

One more setup step: register a [Mapbox](https://www.mapbox.com/signup/) account. Then find your "[Default public token](https://www.mapbox.com/account/)" under the "Access Tokens" tab, which you will use in your code.

![Default Token][TOKEN]

To begin, replace the debug statement in your map.js file with the following (minus the comments, which in js are designated by a leading `//`):

```javascript
'use strict'        // let the browser know we're serious

// debug statement letting us know the file is loaded
console.log('Loaded map.js')

// your mapbox token
mapboxgl.accessToken = 'YOUR TOKEN HERE BETWEEN THE QUOTES'
```

You might want to reload your page and check the console to make sure there are no errors—you should just see your debug statement. Now add this to the bottom of your js file:

```javascript
let map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [-73.96024, 40.80877],
    zoom: 1
})
```

Now we're cooking with gas. If you reload, you should see a satellite image of the world (Web Mercator Projection). Have some fun zooming around.

![World map][WORLDMAP]

If you don't see a map, make sure you've followed the syntax exactly, and check for errors in your console. When programming, one misplaced character can break the whole thing (watch your commas and brackets!). The _block_ of code we just added creates a new _variable_ `map` which is a new _instance_ of the `Map` _object_ provided by the Mapbox javascript file we loaded in our HTML. "map" is actually an arbitrary name—you can choose whatever you want. A `Map` object has several attributes that we can change: `container` lets it know the HTML element that will become the map (in this case also called map), `style` defines a data source for the base map, and `center` and `zoom` define the starting coordinates for the map. Change these for `map` and see what happens.

Other options for style:

```javascript
style: 'mapbox://styles/mapbox/basic-v9',
style: 'mapbox://styles/mapbox/outdoors-v10',
style: 'mapbox://styles/mapbox/light-v9',
style: 'mapbox://styles/mapbox/dark-v9',
style: 'mapbox://styles/mapbox/satellite-v9',
style: 'mapbox://styles/mapbox/satellite-streets-v10',    
style: 'mapbox://styles/mapbox/navigation-preview-day-v2',
style: 'mapbox://styles/mapbox/navigation-preview-night-v2',
style: 'mapbox://styles/mapbox/navigation-guidance-day-v2',
style: 'mapbox://styles/mapbox/navigation-guidance-night-v2',
style: 'mapbox://styles/brianhouse/cjn0u552b52kr2spdz6yhpqj4'
```

Notice how the last style here is attached to a user account. You can customize your own styles with [Mapbox Studio](https://www.mapbox.com/studio/). Once you create a style, you'll just need to find your "Style URL" by clicking "Share &amp; use" and then the "Use" tab and scrolling down.

There are many other attributes you can add to the Map object, which you can find [here](https://www.mapbox.com/mapbox-gl-js/api/#map). Try adding `pitch` while centered on Columbia at a high `zoom`, using this custom map style:

```javascript
let map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/brianhouse/cjn0u552b52kr2spdz6yhpqj4',
    center: [-73.96216,40.80779],
    zoom: 16,
    pitch: 45
})
```

![3D view][3DMAP]

Now we're going to add some additional elements to the screen by calling the _method_ `addControl` of `map`. And we're _passing_ `addControl`  instances of more Mapbox objects—a [`NavigationControl`](https://www.mapbox.com/mapbox-gl-js/api/#navigationcontrol) and [`ScaleControl`](https://www.mapbox.com/mapbox-gl-js/api/#scalecontrol), each with their own modifiable parameters. Your javascript should look something like this:

```javascript
'use strict'

console.log('Loaded map.js')

mapboxgl.accessToken = 'YOUR TOKEN HERE BETWEEN THE QUOTES'

let map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [-73.96024, 40.80877],
    zoom: 12
})

// create an instance of NavigationControl
let navigation = new mapboxgl.NavigationControl({
    showCompass: false
})

// add the navigation to your map
map.addControl(navigation, 'top-left')

// create an instance of ScaleControl
let scale = new mapboxgl.ScaleControl({
    maxWidth: 80,
    unit: 'imperial'
})

// add the scale to your map
map.addControl(scale, 'bottom-right')
```

![Map controls][CONTROLS]

## Geolocation

A particularly interesting control object to add is [`GeolocateControl`](https://www.mapbox.com/mapbox-gl-js/api/#geolocatecontrol). This uses the capabilities of the browser to track its physical location (_Question for discussion: how does this work?_). You can just add this to the bottom of your code.

```javascript
let geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
        enableHighAccuracy: true
    },
    trackUserLocation: true,
    showUserLocation: true,
    fitBoundsOptions: {
    }
})

map.addControl(geolocate, 'top-left')

// this is an event handler
geolocate.on('geolocate', function(event) {
    console.log(event.coords)
})

```

After adding this object and reloading the page, you should see the geolocation toggle on your map. Click it and geolocate yourself.

![Geolocation control][GEOLOCATE]

We added something else here. The `GeolocateControl` has an _event handler_, which is a special function `on` that is called in response to an _event_. In this case, the name of the event is `geolocate` and it happens when the user has been successfully geolocated. What does it do? Here we've just asked this function to print `event.coords` to the console. `event` here is a variable which is an object that contains information about the event that just happened. Look in the javascript console in the browser, and you should find an object:

![Coordinates in console][COORDINATES]

```javascript
Coordinates {latitude: 40.8087666, longitude: -73.9603058, altitude: null, accuracy: 35, altitudeAccuracy: null, …}
accuracy: 35
altitude: null
altitudeAccuracy: null
heading: null
latitude: 40.8087666
longitude: -73.9603058
speed: null
__proto__: Coordinates
```

We can see that the event contains the geocoordinates of the user (in this case, me, in the Engineering Commons). Let's make use of that "info" element we defined in our HTML. Modify that last block of code (starting with `geolocate.on`) so that it looks like this:

```javascript
geolocate.on('geolocate', function(event) {

    // create new variables to store the attributes we're interested in from the event
    let lng = event.coords.longitude
    let lat = event.coords.latitude

    // debug
    console.log('geolocated:', lng, lat)

    // format lng lat values and display them on our 'info' element
    document.getElementById('info').innerHTML = lng.toFixed(5) + "," + lat.toFixed(5)

})
```

After reloading, you should now see your current longitude and latitude without needing to open your console. We've set up our `GeolocateControl` to track your position, so this function will be called periodically to update its information. Note that we've put these on our display with longitude before latitude. _Question for discussion: Is this standard? Why or why not?_

![Coordinates in info box][INFO]

If you haven't already, now would be great time to `git add -u` your changes so far, `git commit -m "implemented geolocation"` them, and `git push` them to GitHub. Now visit your github.io page using your mobile device to see your geolocating map shine.


### More event handlers

You're probably going to want to be able to figure out coordinates on the map other than your geolocated position. We're already displaying our coordinates in the "info" container when we are geolocated — let's make it so that it displays the coordinates where you click on the map as well.

Add the following code to the bottom of your map.js file:

```javascript
map.on('click', function(event) {

    let lng = event.lngLat.lng
    let lat = event.lngLat.lat

    console.log("clicked:", lng, lat)

    document.getElementById('info').innerHTML = lng.toFixed(5) + "," + lat.toFixed(5)

})
```

This is another event handler, which looks a lot like the one we added to our `GeolocateControl` object. Notice, however, that the `click` event on a `Map` object has a different way of specifying longitude/latitude than the `geolocate` event on the `GeolocateControl` object. Get used to this kind of thing when dealing with javascript—`console.log` is your friend.

When you reload your page, the "info" container should show the coordinates wherever you click. _Both_ event handlers are now updating "info".


## Markers

You can add a marker to your map like this:

```javascript
let marker = new mapboxgl.Marker()
marker.setLngLat([-73.96007,40.80871])
marker.addTo(map)
```

You can give it a popup like this:

```javascript
let popup = new mapboxgl.Popup()
popup.setHTML('This is the Center for Spatial Research')
marker.setPopup(popup)
```

Add it and reload your page, you should see a blue marker at the Center for Spatial Research. Click it to see the label.

![C4SR marker with popup][MARKER]

However, text is boring. We can actually put any HTML elements inside a popup. This is a bit of a recursive wormhole, but our javascript is editing the structure of our page as it runs, and there's a lot of possibilities here. For now, let's just put an HTML image element inside our popup. Find the full URL of an image online. An easy way to do this is to control-click any image you see in your browser and choose "Open Image in New Tab". Then add it to your popup like this:

```javascript
let popup = new mapboxgl.Popup()
popup.setHTML('This is the Center for Spatial Research<br /><img src="https://currystonefoundation.org/wp-content/uploads/2018/05/csf_pr_csr_image5.jpg" />')
marker.setPopup(popup)
```

![C4SR marker with popup and image][IMAGE]

What if you want to add multiple markers to your map? First, we'll need to create an _array_ of the necessary data:

```javascript
let data = [
    {
        location: [-73.96191,40.80762],
        content: 'I like to eat my lunch here'
    },
    {
        location: [-73.95936,40.80610],
        content: '15 years ago, you could see over the trees'
    },
    {
        location: [-73.96204,40.80994],
        content: 'This was once tennis courts'
    },
    ]
```

Be careful with your brackets and braces (and commas). This array contains three objects, each with a location parameter and a content parameter. We want to create a new marker and popup for each of these objects. We can do this in javascript like this:

```javascript
data.forEach(function(d) {

    let marker = new mapboxgl.Marker()    
    marker.setLngLat(d.location)
    marker.addTo(map)  

    let popup = new mapboxgl.Popup()
    popup.setHTML(d.content)
    marker.setPopup(popup)

})
```

This is similar to the marker and popup code we used before, but now we've enclosed it in a block that will be called for _each_ object in our array. Reloading your map should now show the markers on the map.

![Multiple markers on a map][MULTI]

## Deliverables

Make a customized webmap with a set of at least five markers that tells a story about a place in the world. Submit the URL to your github.io site (i.e., https://mygithubusername.github.io/webmap_1).


______________________________________________________________________________________________________________


Tutorial written by Brian House for Mapping for Architecture, Urbanism, and the Humanities ([Fall 2018](https://github.com/brianhouse/mapping-architecture-urbanism-humanities)).




[DIRECTORY]: Images/webmap_1_01.png
[HELLOWORLD]: Images/webmap_1_02.png
[WORLDMAP]: Images/webmap_1_03.png
[3DMAP]: Images/webmap_1_04.png
[CONTROLS]: Images/webmap_1_05.png
[GEOLOCATE]: Images/webmap_1_06.png
[COORDINATES]: Images/webmap_1_07.png
[INFO]: Images/webmap_1_08.png
[MARKER]: Images/webmap_1_09.png
[IMAGE]: Images/webmap_1_10.png
[MULTI]: Images/webmap_1_11.png
[TOKEN]: Images/webmap_1_2-1.png

# Tutorial 10: Web Mapping 3

In previous tutorials, we learned how to [set up a Mapbox project](8_WebMapping1.md) and [create custom tilesets based on data](9_WebMapping2.md). We've also placed our own markers and learned how to make calculations based on users' geolocated position.

So far, we've treated datasets as complete—they are datapoints in files of various formats, such as csv, GeoJSON, or shapefiles, that we've added to our maps prior to their use. But as we've seen in class, web-based maps often use databases that are constantly being updated. Furthermore, smart phones are rich sensing devices that allow for the gathering of text, photos, audio, video, GPS position, and accelerometer data. Any of these might be leveraged in myriad ways to contribute to a real-time map.

In this tutorial, we will use the sensing capacity of our devices to make GPS drawings, an activity with a rich precedent including [You Are Here](https://www.macba.cat/en/exhibition-laura-kurgan) by C4SR's Laura Kurgan, [Amsterdam Realtime](https://waag.org/en/project/amsterdam-realtime) by Esther Polak and Jeroen Kee, and drawings by [Jeremy Wood](http://www.gpsdrawing.com/gallery.html). Contemporary devices and Mapbox's API make it straightforward for us to get similar results to what was technically very challenging at the time these works were made.


## Databases

Our web-based maps run via javascript in the browser. For them to interact with a database, the database also has to be accessible online. For many projects, you'll want to set up your own database server. That's beyond the scope of our exercise now, however, so we are going to make use of a service, [mLab](https://mlab.com/), that will host a database that we can use (yet another account to create!).

![mLab account]

After creating your account and logging in, create a new Mongo DB Deployment. Mongo DB is a type of database that stores javascript-style objects such as the GeoJSON format we have previously discussed, so it will be ideal for our purposes. mLab manages the deployment of the database, and it gives us several options of where to host it in the "cloud" (aka massive datacenters owned and operated by Amazon, Google, and Microsoft). We'll use Amazon Web Services, with a free sandbox plan, and host it in the `US East` region. Call it `drawing-db`.

![mLab sandbox]

![mLab confirmation]

Click the blue button in the bottom right corner that says "Submit Order", and you should be up and running.

Once you've created and deployed your database, you'll need to get your API key. You'll find this under your "user" settings. Click the blue link that has your username in the upper right corner, and scroll down to the section that says "API Key." Copy your key (paste it into another document or note application if you need to). You'll also need to `Enable Data API Access`.

![mLab db user]
![mLab API Enable]


## Setting up our template

Just like for the [previous web mapping tutorials](9_WebMapping2.md#start-a-web-project), you'll need to set up a new github project. Call this repository "gps_drawing". The `index.html`, `style.css`, and `map.js` can be the same as what we used in the previous tutorial — refer to those tutorials to get your initial files set up. This is a good practice to get familiar with: most programming projects begin in this way, by assembling relevant pieces from past projects. One advantage of using Github is that you'll have all those projects organized and accessible to reference when you need them.

Once you've created the initial files (`index.html`, `style.css`, and `map.js`), we'll need to make a few small changes. In this case, the first customization we'll do is to change the title in the `<title></title>` tags of our `index.html` file: change it to "GPS Drawing".

Additionally, you'll also want to create a new Mapbox style for this project, so that you can customize it without altering your previous maps. Go over to your Mapbox account, click on "Studio" in the upper right corner. Under "Styles," create a new style (refer to the steps in the [previous tutorial](9_WebMapping2.md#mapbox-styles) if you need a reminder how to do this). Once you've created a style, you can rename it by opening it (click "Menu>Details"), and then on the next page, "Edit this style". Once you've renamed the style (you can call it whatever you want, or "GPS_Drawing" for consistency), make sure you copy the new "Style URL", and put that style URL into your code in your `map.js` file. You can edit this style to adjust the aesthetics however you want at a later point if you wish.

<!--![Mapbox Duplicate]

Under "Your Styles," choose one of your existing styles (we can use "Rats_NYC" from our previous tutorial), click the "Menu" to the right and select "Duplicate". Once the style is duplicated, you can rename it by opening it (click "Menu>Details"), and then on the next page, "Edit this style". Once you've renamed the style (you can call it whatever you want, or "GPS_Drawing" consistency), make sure you copy the new "Style URL", and put that style URL into your code in your `map.js` file.-->


## Interfacing with the database

We're going to use some prewritten code to interface with the mLab API. This consists of two functions—inserting data, and recalling data. Save this code in a new file, `db.js`, and put in your API key from mLab.

```javascript
let base = "https://api.mlab.com/api/1/databases/"
let apiKey = "YOURKEYHERE"
let database = "drawing-db"

class DB {

    get(f) {
        console.log('GET')
        let url = base + database + "/collections/paths?apiKey=" + apiKey
        let request = new XMLHttpRequest()
        request.open('GET', url)
        request.onload = function() {
          if (this.status >= 200 && this.status < 400) {
            f(JSON.parse(this.response))
          } else {
            console.log(this.status)
            console.log(this.response)
          }
        }
        request.onerror = function() {
            console.log(this.status)
            console.log(this.response)
        }
        request.send()
    }

    insert(path) {
        console.log("INSERT")
        let url = base + database + "/collections/paths?apiKey=" + apiKey
        let request = new XMLHttpRequest()
        request.open('POST', url)
        request.setRequestHeader('Content-Type', 'application/json')
        request.onload = function() {
          if (this.status >= 200 && this.status < 400) {
            console.log(this.response)
          } else {
            console.log(this.status)
            console.log(this.response)
          }
        }
        request.onerror = function() {
            console.log(this.status)
            console.log(this.response)
        }
        let encoded = JSON.stringify({path: path})
        console.log(encoded)
        request.send(encoded)
    }

}

let db = new DB()
```

To use this in your map code, you'll also need to load `db.js` within your HTML. You can do this by adding a script tag within the `<head>` portion of your HTML.

```html
<head>

...
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.50.0/mapbox-gl.js'></script>
    <script src='db.js'></script>    
</head>
<body>

...

```


### Map programming

While building this map, remember to save periodically and test using your browser and the javascript console. You don't need to push to Github to do that—just open `index.html` directly in your browser. But adding your files, committing them, and pushing to Github is a great way to keep track of your progress and to have a fallback if something breaks.

In `map.js`, you should be creating a map object, adding navigation and scale controls as desired, and including a geolocation control. We'll be begin adding code with the geolocation handler.

```javascript
// create a variable to keep track of the user's current location
// we're going to initialize it to the default center of the map
let current_location = [-73.96216, 40.80779]

// update the variable whenever a geolocation event fires
geolocate.on('geolocate', function(event) {
    current_location = [event.coords.longitude, event.coords.latitude]
    console.log('geolocated', current_location)   
})

// for testing purposes, also update the variable whenever you click on the map
map.on('click', function(event) {
    current_location = [event.lngLat.lng, event.lngLat.lat]
    console.log('clicked', current_location)        
})
```

`current_location` will now hold the most up-to-date coordinates. It will update when geolocation is determined, but since we're programming this on computers, using the `click` handler provides an easier way to test things—you can just click the map to simulate movement.

![Clicked map]

For GPS drawing, we are going to need a way to start and stop "drawing" coordinates. This will make our map begin to feel like a data gathering interface. To do this, we'll add a button. There are three steps to doing this: we'll have to alter the HTML, the css, and the javascript.

First, the HTML. Between the body tags, it should look like this:
```html
<body>
    <div id='map'></div>
    <input type='button' id='draw_btn' value='Start' />
    <script src='map.js'></script>    
</body>
```

We also need to position that `draw_btn` element. We can do that by adding the following block to the css file:
```css
#draw_btn {
    position: absolute;
    left: 10px;
    top: 200px;
}
```

Make sure your files are saved, and reload the page with your browser. You should see the button appear.

![Made button]


Now we can add a reference to it in the javascript, at the very bottom of `map.js` below the map handler:
```javascript
// variable which references the HTML button element
let draw_btn = document.getElementById('draw_btn')

// a handler that is called when the button is clicked
draw_btn.addEventListener('click', function() {

    // print something in the console to test
    console.log('clicked draw_btn')                 

})
```

Test it now. You should see the message appear in the javascript console.

![Clicked button]

To add functionality to this, think about what this button does. It's actually two things: on the first click it should start drawing, and on the second, stop drawing. We're going to create a new function for each of those two behaviors, along with a variable that keeps track of whether we're drawing or not.

<!--BRIAN: there was a shift in use of variables here. i changed all the `drawing` to `active`, to match with your final code-->

```javascript
let active = false       // keeps track of whether or not we're drawing

function startDrawing() {

    active = true

}

function stopDrawing() {

    active = false

}
```

So far this is still just a placeholder. But as we proceed, we'll incrementally add code to these two functions to accomplish more things. First, let's modify `startDrawing` so that it adds a marker at the current location:

```javascript
let active = false
let start_marker = new mapboxgl.Marker()    

function startDrawing() {

    active = true

    start_marker.setLngLat(current_location)
    start_marker.addTo(map)    

}
```

We also want to provide the user with some indication that location is being recorded. We can do this by modifying the button itself.


```javascript
let active = false
let start_marker = new mapboxgl.Marker()    

function startDrawing() {

    active = true

    start_marker.setLngLat(current_location)
    start_marker.addTo(map)

    draw_btn.style['background-color'] = "red"         // make the button red
    draw_btn.style['color'] = "white"                  // make it's text white
    draw_btn.value = 'Stop and save'                   // change the text to the opposite state

}

function stopDrawing() {

    active = false

    draw_btn.style['background-color'] = "white"      // make the button white again
    draw_btn.style['color'] = "black"                 // make the text black
    draw_btn.value = 'Start'                          // change the text

}
```

These functions are still not connected to our button. To do that, we'll need to modify our button's `click` handler. We'll make use of a conditional `if` statement, one of the fundamental logic components of programming. Which code will run is determined by the value of our `active` variable:

```javascript
draw_btn.addEventListener('click', function() {

    console.log('clicked draw_btn')

    if (active) {            // if we're already drawing, stop drawing
        stopDrawing()
    } else {                    // otherwise, start drawing
        startDrawing()
    }

})
```

If you save and test at this point, you should have a button that changes color.

![Button indicator]


So far so good. We have the user interaction down, but now we need to keep track of the path itself as a sequence of points. We'll do that with a variable we will call `path`, which we'll make an array, and we can declare it with our other variables like this:

```javascript
let active = false
let start_marker = new mapboxgl.Marker()     
let path = []               // this array will hold the sequence of points in our path
```

When we hit start, we want to add the current location to the path. Add this line to the `startDrawing` function:

```javascript
function startDrawing() {
    active = true                                
    draw_btn.style['background-color'] = "red"    
    draw_btn.style['color'] = "white"             
    draw_btn.value = 'Stop and save'              

    start_marker.setLngLat(current_location)
    start_marker.addTo(map)

    path.push(current_location)         // add the current location to the path
}
```

Now what? Well, each time `current_location` is updated, we want to add it to the path. So we have to modify our `geolocate` handler and the `click` handler on our map. Once again, we'll use a conditional statement so that it only happens when we are in record mode. Add the following `if` statements to the handlers:

```javascript
geolocate.on('geolocate', function(event) {
    current_location = [event.coords.longitude, event.coords.latitude]
    console.log('geolocated', current_location)   

    if (active) {                           // if we're drawing
        path.push(current_location)         // add the current location to the path
    }

})

map.on('click', function(event) {
    current_location = [event.lngLat.lng, event.lngLat.lat]
    console.log('clicked', current_location)        

    if (active) {                           // if we're drawing
        path.push(current_location)         // add the current location to the path
        console.log(path)                   // ...and for testing purposes, log the path so far to the console.
    }

})
```

We included a `log` statement in the `click` handler so we can see what's going on. Try it by reloading the page. Notice how once you click the record button, every click shows an array in the console. And the array grows with each click. If you open up the array in the console to see the details (click on the small arrow), you can see the coordinates.

![Test coordinates]

Now for the fun part. To show this path on the map, we need to create and continuously modify a map layer via javascript. To do this, we'll use the `addLayer` method of our map object to add a drawing layer. What's tricky about this, however, is that we have to wait until the map style is fully loaded before adding our layer. Therefore, we'll make use of another event handler on our map object, `load`, which is called only once the map is fully in place and ready to be modified.

```javascript
map.on('load', function() {             // 'load' event handler
    map.addLayer({                      // add a layer
        'id': 'drawing',
        'type': 'line',
        'source': {
            'type': 'geojson',
            'data': null
        },
        'layout': {
            'line-cap': 'round',
            'line-join': 'round'
        },
        'paint': {
            'line-color': '#50C3DF',
            'line-width': 5,
            'line-opacity': .8
        }
    })
})
```

You'll notice that the layer we're adding is defined by an elaborate object structure. This includes parameters for `type`, `layout`, and `paint`, all of which you may modify to alter the style of the drawing.

For our purposes now, the most interesting section is `source`. This tells the layer that we will be providing data in the form of geojson. To start with, that data is `null`, meaning there is nothing there. But we can create a geojson object which we will be able to modify on the fly. Add the following variable at the bottom of your code:

```javascript
let geojson = {
    "type": "FeatureCollection",
    "features": []
}
```

This is a minimal definition of a geojson object. Notice that `features` is an array within it. When we start a path, we will also need to create a new feature, and add it to this array. Once again we'll modify our `startDrawing` function:

```javascript
function startDrawing() {
    active = true                              

    start_marker.setLngLat(current_location)
    start_marker.addTo(map)

    draw_btn.style['background-color'] = "red"  
    draw_btn.style['color'] = "white"           
    draw_btn.value = 'Stop and save'            

    path.push(current_location)

    geojson.features.push({                     // add a new feature to the geojson
        "type": "Feature",
        "geometry": {
            "type": "LineString",
            "coordinates": path                 // the coordinates of this feature are our path array
        }
    })    
    map.getSource('drawing').setData(geojson)   // update the drawing layer with the latest geojson

}
```

Notice that last line—each time we update the geojson, we also have to tell the map layer to update. Therefore, we'll also need to add that line to our `geolocate` and `click` handlers:


```javascript
geolocate.on('geolocate', function(event) {
    current_location = [event.coords.longitude, event.coords.latitude]
    console.log('geolocated', current_location)   

    if (active) {
        path.push(current_location)
        map.getSource('drawing').setData(geojson)   // update the layer because the path has changed
    }

})

map.on('click', function(event) {
    current_location = [event.lngLat.lng, event.lngLat.lat]
    console.log('clicked', current_location)        

    if (active) {                
        path.push(current_location)
        console.log(path)           
        map.getSource('drawing').setData(geojson)   // update the layer because the path has changed        
    }

})
```

Now would be a good time to save, reload, and try out the map. If all has gone well, you should be able to click the record button to create a path with subsequent clicks. And if you push it to github and load it on your mobile device, you can walk around to create your path by geolocation.

![Drawing]


### Database functions

One thing that our code doesn't yet do, however, is save paths in the database. If you reload the page, the paths will disappear. We've already included `db.js` in our setup—now we just have to make the appropriate calls.

We want to save a path every time the `stopDrawing` function is called, so we'll add that to the function. We'll also make sure to reset our path variable:

```javascript
function stopDrawing() {

    active = false

    draw_btn.style['background-color'] = "white"  
    draw_btn.style['color'] = "black"             
    draw_btn.value = 'Start'                      

    db.insert(path)                         // insert the path into the database
    path = []                               // reset the path

}
```

Now, when you complete a path by clicking "Stop and save" on your map, it really is saving, and you'll see that in your console:

![Stop and save]


We're now saving the paths that we create. However, they're still not showing up when we reload the page. To do that, we'll need to query the database right away and draw those paths from the get-go. We'll modify the same `load` event handler that we used to create our layer, which will ensure that everything happens in the correct order.

```javascript
map.on('load', function() {
    map.addLayer({
        'id': 'drawing',
        'type': 'line',
        'source': {
            'type': 'geojson',
            'data': null
        },
        'layout': {
            'line-cap': 'round',
            'line-join': 'round'
        },
        'paint': {
            'line-color': '#50C3DF',
            'line-width': 5,
            'line-opacity': .8
        }
    })

    // get the previously created paths from the database and add them as features
    db.get(function(data) {
        for (let item of data) {
            if (!item.path) continue
            geojson.features.push({
                "type": "Feature",
                "geometry": {
                    "type": "LineString",
                    "coordinates": item.path
                }
            })
            map.getSource('drawing').setData(geojson)
        }
    })

})
```

Phew. That's it! Play around with your map and create some paths. When you reload the page, they should show up again. You're live!

The intent here is that we'll use this app on our mobile devices, not via the web. So we can delete our `click` handler at this point. Better yet, we can "comment it out" so that it will be disabled, but we can still restore it if we need to experiment more. To do this, just add the comment slashes `//` before each line:

```javascript
// map.on('click', function(event) {
//     current_location = [event.lngLat.lng, event.lngLat.lat]
//     console.log('clicked', current_location)        
//
//     if (active) {
//         path.push(current_location)
//         console.log(path)   
//         map.getSource('drawing').setData(geojson)    
//     }
//
// })
```

Now you'll see that clicking on the map has no effect. But geolocating tracking still does.

One last thing: we didn't add any functionality to _delete_ paths, but you can do this through your mLab account. If you click on your database, you'll see your "Collections". One of those will be "paths", and if you click on that, you can see the coordinate data in GeoJSON format, as well as edit it directly.

![mLab collections]
![mLab data]

## Deliverables

Use the interface on your mobile device to draw a picture for the class, and submit the url to your map. Yes, you could do this by clicking. But it will be so much more interesting to see it produced on the street.

One caveat to keep in mind—we've built this in javascript, so it's not quite the same as an app you would download from the app store, for example. One big  difference is that it does not run in the background. So as you move around, you'll need to have the browser on your device open for it to be recording your path.

Happy drawing!

______________________________________________________________________________________________________________


Tutorial written by Brian House for Mapping for Architecture, Urbanism, and the Humanities ([Fall 2018](https://github.com/brianhouse/mapping-architecture-urbanism-humanities)).




[mLab account]: Images/webmap_3_mlab_account.png
[mLab sandbox]: Images/webmap_3_mlab_sandbox.png
[mLab confirmation]: Images/webmap_3_mlab_confirmation.png
[mLab db user]: Images/webmap_3_mlab_db_user.png
[mLab API Key]: Images/webmap_3_mlab_api_key.png
[mLab API Enable]: Images/webmap_3_mlab_api_enable.png
[Clicked map]: Images/webmap_3_clicked_map.png
[Made button]: Images/webmap_3_made_button.png
[Clicked button]: Images/webmap_3_clicked_button.png
[Button indicator]: Images/webmap_3_button_indicator.png
[Test coordinates]: Images/webmap_3_test_coordinates.png
[Drawing]: Images/webmap_3_drawing.png
[Stop and save]: Images/webmap_3_save.png
[mLab collections]: Images/webmap_3_mlab_collections.png
[mLab data]: Images/webmap_3_mlab_data.png
[Mapbox Duplicate]: Images/webmap_3_duplicate.png