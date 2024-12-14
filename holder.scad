include <specs.scad>;
use <numeric_stencils.scad>;

border = 10;
fit = 0.2;

render_stencils = false;

translate([0, 0, -1]) {
    difference() {
        difference() {
            color("white") {
                cube([border*4 + plate_width * 3, border*4 + plate_height, 2]);
            }
            union() {
                color("deepskyblue") {
                    translate([2*border-1, 2*border-fit, 1]) {
                            cube([(plate_width * 3)+2*fit, plate_height+(2*fit), 3]);
                        }
                }
                translate([2*border + 2, 2*border+2, 0.5]) {
                        cube([plate_width*3-5, 5, 2]);
                }
            }
        }
        color("hotpink") {
            translate([2*border-2*fit, 3*border-(2*fit), -1]) {
                cube([(plate_width * 3)-(4*fit), plate_height - 2*border+fit, 10]);
            }
        }
    }
};


if (render_stencils) {
    color("yellow", 0.6) {
        translate([2*border-0.9, 2*border, 0]) {
            render_stencils(2, border=0.1);
        }
    }
}