# Add the following line to your project in Framer Studio. 
#
# {MagicBox} = require "MagicBox"
#
# Create a new MagicBox layer like any other layer:
#
# magicBox = new MagicBox
# magicBox.addLayer(myMainLayer)

#### CONSTANTS

iPhone8Width = 375
iPhone8Height = 667
masterScale = Screen.width/iPhone8Width
if Utils.isPhone() == true
    masterScale = Screen.width/iPhone8Width
else
    masterScale = 1


#### MagicBox

class exports.MagicBox extends Layer
   constructor: (@options={}) ->
      @options.backgroundColor ?= "black"
      @options.width ?= Screen.width
      @options.height ?= Screen.height
        
      super @options

      @states = 
        zoomOut:
          y: 0    

      @parentViewer = new Layer
        name: "viewerContainer"
        parent: this
        backgroundColor: "black"
        width: Screen.width
        height: Screen.height
        
      @viewer = new Layer
        parent: @parentViewer
        name: "viewer"
        scale: masterScale
        width: iPhone8Width
        height: iPhone8Height
        clip: true
        borderColor: "white"
      @viewer.center()
      @viewer.animationOptions = time: .3
        
      @viewer.states =
        zoomOut:
          scale: masterScale*.7

      @zoomButton = new Layer
        name: "zoomButton"
        parent: this
        backgroundColor: "blue"
        width: iPhone8Width/4
        height: iPhone8Height/25
        x: Align.center()
        opacity: 0.6
      @zoomButton.viewer = @viewer
      @zoomButton.parentViewer = @parentViewer

      @zoomButton.onTap ->
        this.viewer.states.next()
        this.parentViewer.states.next()
        
      @zoomButtonLabel = new TextLayer
        name: "zoomText"
        parent: @zoomButton
        text: "Zoom +/-"
        fontSize: 14
        color: "white"
      @zoomButtonLabel.center()    

   addLayer: (layer) ->
      layer.parent = @viewer
      layer.size = @viewer.size