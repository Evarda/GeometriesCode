# GeometryCodes
Repository for the codes I use to make geometries

## Matlab

### Bowtie

- Give a bowtie size, a gap size, a bias, and a potential.
- Outputs an array of bowtieSizeY by bowtieSizeX + separation
- Bias is added to the left triangle
- The values surrounding the bowtie = potential

`makeBowtie(bowtieSizeX, bowtieSizeY, separation, bias, potential)`

- bowtieSizeY = total height  of 1 triangle
- bowtieSizeX = total width of 2 triangles
- separation  = distance between triangle tips (gap size)
- bias = height of one triangle with respect to the other


An array with a bowtie shape where values in the bowtie are 0 and the surrounding space are 1 
can be written as:

`makeBowtie(bowtieSizeX, bowtieSizeY, separation, 0, 1)`

#### Example

`makeBowtie(1000, 1000, 100, 10, 20)`

![alt text][makeBowtieExample]

[makeBowtieExample]: Matlab/makeBowtieExample.jpg "makeBowtie Example"
