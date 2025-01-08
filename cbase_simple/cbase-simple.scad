scale = 1;


difference() {

    union () {
        difference() {
            translate([-100,-90, 0]) {
                cube([200, 180,1]);
            }
            translate([-10,5,0]){
                scale([scale, scale, 0.5]) {
                    rotate([0,0,45]) {
                        linear_extrude(height=12, center=true)
                        import(file="cbase.svg", center=true);
                    }
                }
            }
        }
        for(i=[0:2]) {
            rotate([0, 0, 90*i]){
                addition = i==1 ? 10 : 0;

                translate([-100+addition, -25, 0]){
                    cube([2, 50, 2.5]);   
                }
            }
        }
    }
    rotate([0,0,45]){
        translate([-150,90,0]){
            cube([300,200,10]);
        }
    }
    rotate([0,0,225]){
        translate([-150,70,0]){
            cube([300,200,10]);
        }
    }
}