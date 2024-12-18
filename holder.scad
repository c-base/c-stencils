include <specs.scad>;
use <numeric_stencils.scad>;

border = 2;
fit = 0.2;
holder_thickness = 15;

counterplate_width = 12.1;
counterplate_thickness = 0.2;
cp_half = counterplate_width / 2;
counterplate_height = 6.2;

render_stencils = false;

translate([0, 0, -1]) {
    difference() {
        difference() {
            color("white" ,1) {
                cube([border*3 + plate_width * 3, border*4 + plate_height, holder_thickness]);
            }
            color("deepskyblue", 0.3) {
                union() {
                    translate([2*border-1, 2*border-2*fit, 0.5]) {
                        cube([(plate_width * 3)-0.8, plate_height+(4*fit), holder_thickness + 3]);
                        }
                
                    translate([2*border-0.5, 2*border+1, counterplate_thickness]) {
                        for(i=[0:2]) {
                            translate([plate_width * i + plate_width/2-(counterplate_width / 2), 0, 0]){
                                cube([counterplate_width, counterplate_height, 1]);
                            }
                        }
                    }
                    translate([2*border-0.5, border + plate_height - 5.5, counterplate_thickness]) {
                        for(i=[0:2]) {
                            translate([plate_width * i + plate_width/2-(counterplate_width / 2), 0, 0]){
                                cube([counterplate_width, counterplate_height, 1]);
                            }
                        }
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
            translate([1, 1, 3]) {
                cube([plate_width * 3 + 3* border-2, plate_height + 4 * border-2, 40]);
            }
        }
    }
};


if (render_stencils) {
    color("yellow", 0.2) {
        translate([2*border-0.9, 2*border, -0.2]) {
            render_stencils(2, border=-0.4);
        }
    }
}