--- cson

styles: [
  '/assets/styles/app.css']
scripts: [
  '/assets/globals/vendors.js'
  'https://maps.googleapis.com/maps/api/js?key=AIzaSyBmuLInLT_gBvFNlal0h_d5p0Z-TjmdX-U'
  '/assets/modules/app.bundle.js']

---


doctype 5
html ->

  head ->
    
    meta charset:"utf-8"
    
    #insert styles using frontend plugin
    for url in @assets('styles')
      link rel:"stylesheet", href:url, media:"all"

  body ->

    div id:"map", class:"map"
    text @partial('title-bar.html.coffee')
    h1 "Content"
    div id:"example"

    #insert script using frontend plugin
    #this picks up incrementally-named document scripts as well
    for url in @assets('scripts')
      script src:url
