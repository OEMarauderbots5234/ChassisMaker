# ChassisMaker
Automation to produce a basic chassis layout. Helps to accelerate CAD efforts.

This doc is still a work in progress.

Used FreeCAD with the OpenSCAD integration to write the code for the chassis. This could be done directly in OpenSCAD as well however FreeCAD is able to export the generated model as a .STEP file where OpenSCAD lacks this feature directly. From there the file can be imported into pretty much any of the more familiar CAD packages to modify further from there.

Our team is using OnShape for CAD, when importing the .STEP file into OnShape select "Combine to a single Part Studio" option this seems to work best.