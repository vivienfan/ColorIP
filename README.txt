ROM initialized with a .coe file contains a image (see /Python/FourColors.jpg). Image is 100x60 for testing purpose only, the final image would be 1280x720.

4 ColorDetect ip blocks are connected to ROM to detect RGBY coordinates.

ColorDetect:
    general inputs: 
        - RESET: initial everything on negedge of this signal
        - CLK: acts on posedge of this signal

    input from ROM:
	- DATA_IN[23:0]: color of each pixel (RGB - 8:8:8)
    output to ROM:
	- ADDR[13:0]: the pixel to read

    input from MotionIP:
	- EN: this module only runs when EN is high; and when EN is low, everything is reset to initial values
	- COLOR[1:0]: 0-Red, 1-Green, 2-Blue, 3-Yellow
    output to MotionIP:
	- READY: this flag is set to high once coordinate is ready (aka, the entire frame has been processed)
	- COORDINATE[31:0]: this wire contains the column(x) and row(y) information of the centre of the specified color ([31:16]-x, [15:0]-y)