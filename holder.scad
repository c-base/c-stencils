include <specs.scad>;
use <numeric_stencils.scad>;

border = 2;
fit = 0.2;
holder_thickness = 15;

render_stencils = true;

translate([0, 0, -1]) {
    difference() {
        difference() {
            color("white" ,1) {
                cube([border*3 + plate_width * 3, border*4 + plate_height, holder_thickness]);
            }
            color("deepskyblue", 0.3) {
                union() {
                    translate([2*border-1, 2*border-2*fit, 1]) {
                        cube([(plate_width * 3)-0.5, plate_height+(4*fit), holder_thickness + 3]);
                        }            
                    translate([2*border + 2, 2*border+1.5, 0.3]) {
                        cube([plate_width*3-5, 6.2, 2.5]);
                    }
                    translate([2*border + 2, border + plate_height - 5.5, 0.3]) {
                        cube([plate_width*3-5, 6.2, 2.5]);
                    }
                }
            }
        }
        color("hotpink", 0.4) {
            translate([2*border+1.5, 6*border-(2*fit)+1, -1]) {
                cube([(plate_width * 3)-5, plate_height - 8*border-2, 10]);
            }
        }
        color("green", 0.4) {
            translate([1, 1, 5]) {
                cube([plate_width * 3 + 3* border-2, plate_height + 4 * border-2, 40]);
            }
        }
    }
};


if (render_stencils) {
    color("yellow", 0.2) {
        translate([2*border-0.9, 2*border, 0.4]) {
            render_stencils(2, border=-0.2);
        }
    }
}