include <MCAD/constants.scad>
//Measurements in inches and auto-converted to MM

//Configurable variables
$chassisLength   =   36 * mm_per_inch;
$chassisWidth    =   24 * mm_per_inch;
$drivetrainWidth =	 14 * mm_per_inch;

//Constants
$extH            =   2 * mm_per_inch;
$extW            =   1 * mm_per_inch;
$thickExtWall    =   0.125 * mm_per_inch;
$thinExtWall     =   0.0625 * mm_per_inch;
$batteryL		 =   7.1 * mm_per_inch;
$batteryW		 =	 3.0 * mm_per_inch;
$batteryH		 =	 6.58 * mm_per_inch;

$perimeter = $chassisLength*2 + $chassisWidth*2;
assert($perimeter <= 120 * mm_per_inch, "Chassis is over FRC perimeter limit!");

module End(){
	translate([$chassisWidth/2, $extW/2, $extH/2])
	rotate([-90, 0, 90])
        linear_extrude(height = $chassisWidth)
        difference(){
            square([$extW, $extH], center = true);
            square([$extW - $thickExtWall*2, $extH - $thickExtWall*2], center = true);
        }
}

//Defines the rails on the right half of the bots chassis
module RSide(){
    //innermost rail
    translate([$batteryL/2, $extW, $extH/2])
        rotate([-90, 0, 0])
        linear_extrude(height = $chassisLength - $extW*2)
        difference(){
            square([$extW, $extH], center = true);
            square([$extW - $thickExtWall*2, $extH - $thickExtWall*2], center = true);
        }
    //drivetrain mount rail
    translate([$drivetrainWidth/2+$extW/2, $extW, $extH/2])
        rotate([-90, 0, 0])
        linear_extrude(height = $chassisLength - $extW*2)
        difference(){
            square([$extW, $extH], center = true);
            square([$extW - $thickExtWall*2, $extH - $thickExtWall*2], center = true);
        }
    //outermost rail
    translate([$chassisWidth/2-$extW/2, $extW, $extH/2])
        rotate([-90, 0, 0])
        linear_extrude(height = $chassisLength - $extW*2)
        difference(){
            square([$extW, $extH], center = true);
            square([$extW - $thinExtWall*2, $extH - $thinExtWall*2], center = true);
        }
}


//Call the RSide module to be generated.
RSide();
//Call the RSide module but mirrored on the x axis to make the LSide
mirror([1,0,0])
    RSide();
//Call the End module to be generated
End();
//Call another End module but move it to the opposite side of the chassis
translate([0,$chassisLength-$extW,0])
	End();

