# crystalliser
A Processing project that crystallises a given image into triangles. Essentially a more pretty version of a pixelliser 

An example of the output it produces:

Input Image
![alt text](http://i.imgur.com/MpPghfa.jpg "Example input image")

Output Image
![alt text](http://i.imgur.com/ohBpvMW.png "Example output image")

## TODO

- Currently only works on images with dimensions that are completely divisible by 10, otherwise the application crashes. An obviously lazy implementation, it should either crop the image until the dimensions are divisible by 10 or dynamically changing the 'chunk size' to accomodate the dimensions, or a combination.
- Need to fix the weird wrap-around effect where triangles drawn from the left hand side of the image are written on the right margin.
- Need to put in a file dialog that allows you to pick an image rather than just using a hardcoded image name.
