res=64;

module Y_endstop_holder() {
    render(convexity=6) difference() {
        union() {
            hull() {
                for(i=[-1, 1]) {
                    translate([0, i*10, 0]) rotate([0, 90, 0]) cylinder(d=20, h=15, $fn=res);
                }
            }
            hull() {
                for(i=[0, 1]) {
                    translate([0, 0, -1.5+i*6.5]) rotate([90, 0, 90]) cylinder(d=10, h=29.5, $fn=res);
                }
            }
        }
        for(i=[-1, 1]) {
            translate([-1, i*10, 0]) rotate([0, 90, 0]) cylinder(d=4.3, h=30, $fn=res);
        }
        for(i=[0, 1]) {
            translate([-1, 0, -1.5+i*6.5]) rotate([90, 0, 90]) cylinder(d=2, h=100, $fn=res);
            translate([-1, 0, -1.5+i*6.5]) rotate([90, 0, 90]) cylinder(d=5, h=26, $fn=res);
        }
    }
}

module Y_endstop_trigger() {
    render(convexity=6) difference() {
        union() {
            hull() {
                translate([0, 30, 0]) rotate([0, 180, 0]) cylinder(d=16, h=10, $fn=res);
                translate([0, 0, 0]) rotate([0, 180, 0]) cylinder(d=16, h=1, $fn=res);
                translate([0, 0, -25]) sphere(d=16, $fn=res);
            }
        }
        for(i=[0, 1]) {
            translate([0, 10+i*20, -100]) cylinder(d=4.3, h=111, $fn=res);
            translate([0, 10+i*20, -100]) cylinder(d=8, h=90, $fn=6);
        }
        translate([-25, -50, -100]) cube([50, 50, 110]);
    }
}

translate([-20, 0, 0]) rotate([0, -90, 0]) Y_endstop_holder();
translate([0, -18, 0]) rotate([0, 180, 0]) Y_endstop_trigger();