include <specs.scad>;
use <numeric_stencils.scad>;

border = 10;
fit = 0.2;
holder_thickness = 20;

render_stencils = false;

translate([0, 0, -1]) {
    difference() {
        difference() {
            color("white" ,0.4) {
                cube([border*4 + plate_width * 3, border*4 + plate_height, holder_thickness]);
            }
            color("deepskyblue", 0.3) {
                union() {
                    translate([2*border-1, 2*border-2*fit, 2.5]) {
                        cube([(plate_width * 3)-0.5, plate_height+(4*fit), holder_thickness + 3]);
                        }            
                    translate([2*border + 2, 2*border+1.5, 0.8]) {
                        cube([plate_width*3-5, 6.2, 2.5]);
                    }
                    translate([2*border + 2, border + plate_height + 2, 0.8]) {
                        cube([plate_width*3-5, 6.2, 2.5]);
                    }
                }
            }
        }
        color("hotpink", 0.4) {
            translate([2*border+1.5, 3*border-(2*fit), -1]) {
                cube([(plate_width * 3)-5, plate_height - 2*border, 10]);
            }
        }
        color("green", 0.4) {
            translate([1.5, 1.5, 8]) {
                cube([plate_width * 3 + 4* border-3, plate_height + 4 * border-3, 45]);
            }
        }
    }
};


if (render_stencils) {
    color("yellow", 1) {
        translate([2*border-0.9, 2*border, 1]) {
            render_stencils(2, border=-0.2);
        }
    }
}