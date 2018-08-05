# framer-MagicBox

The MagicBox module adds a zoom control to scale your Framer prototype gracefully for different devices and environments.

[Read more on Medium](https://medium.com/@kasimte/magicbox-for-framer-b932427206bc)

# Demo Project

[Click here to see the demo project on Framer Cloud](https://framer.cloud/PQVYx)

# Installation

[![Install with Framer Modules](https://www.framermodules.com/assets/badge.png)](https://open.framermodules.com/ModuleBox)

or 

1. Download the `MagicBox.coffee` module file from this repository.
2. Drag and drop it to the `modules` directory of your prototype.
3. Add `{MagicBox} = require "MagicBox"` to the top of your prototype file.

# Usage

After installation, any prototype can be placed in a MagicBox like so:

```
# Example root layer
myPrototypeLayer = new Layer
  image: "myImage.jpg"

# Create a new MagicBox layer and add your root prototype layer to it.
magicBox = new MagicBox
magicBox.addLayer(myPrototypeLayer)
```

# License

MIT

# Authors

* Yukyung Kim ([designer.yuk@gmail.com](designer.yuk@gmail.com))
* Kasim Te ([kasimte@gmail.com](kasimte@gmail.com))




