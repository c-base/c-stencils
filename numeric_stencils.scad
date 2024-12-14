// text_on_cube.scad - Example for text() usage in OpenSCAD

echo(version=version());

include <specs.scad>;

module render_stencils(number, border=10) {
    // Loop to generate 10 plates
    for (i = [0:number]) {
        plate_row= i>4 ? -plate_height - border : 0;
        n= i>4 ? i-5 : i;
        
        // Translate each plate to its position
        translate([n * (plate_width + border), plate_row, 0]) {
            union() {
                if (i == 0 || i == 4 || i == 6 || i == 8 || i == 9) {
                    if (i == 0 || i == 6 || i == 8) { 
                        translate([plate_width / 2 - stegbreite, font_size / 2, 0]) {
                            color("hotpink") {
                                cube([stegbreite*2, font_size/5, plate_thickness]);
                            }
                        }
                    }
                    if (i == 4 || i == 6 || i == 8 || i == 9) {
                        translate([plate_width / 2 - stegbreite, font_size/1.45, 0]) {
                            color("hotpink") {
                                cube([stegbreite*2, font_size/5, plate_thickness]);
                            }
                        }
                    }
                    if (i == 0 || i== 8 || i == 9) {
                        translate([plate_width / 2 - stegbreite, font_size/1.06, 0]) {
                            color("hotpink") {
                                cube([stegbreite*2, font_size/8.33, plate_thickness]);
                            }
                        }
                    }
                }
            difference() {
                // Create the plate
                color("skyblue", 0.5) {
                    difference() {
                        cube([plate_width, plate_height, plate_thickness]);
                        translate([plate_width / 2, 4.5, -0.1]) {
                            cylinder(h=0.8, d=5.1);
                        }
                    }
                }
                

                color("hotpink");
                // Emboss the number
                translate([plate_width/2, plate_height/2, -plate_thickness]) {
                        linear_extrude(plate_thickness*4) {
                            text(str(i), font=font, size=font_size, halign="center",       valign="center");
                        }
                    }
                }
            }
        }
    }
}

rotate([180,0,0]) {
    render_stencils(9, 2);
}