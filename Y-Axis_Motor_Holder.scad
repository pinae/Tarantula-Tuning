res=64;

module motor_holder_right() {
    render(convexity=8) difference() {
        union() {
            translate([0, -48, 0]) cube([15, 48, 40-0.2]);
            translate([0, -91, 0]) cube([6, 48, 48]);
            translate([0, -91, 0]) cube([45, 71, 5]);
            translate([0, -91, 0]) cube([25, 91, 5]);
            translate([25, -20, 0]) cylinder(d=40, h=5, $fn=res);
            translate([-6.2, -52, 46]) rotate([0, 90, 0]) cylinder(d=28, h=12.5, $fn=res);
            translate([-6.5, -52, 46]) rotate([0, 90, 0]) cylinder(d=10, h=12.5, $fn=res);
            translate([-6.5, -85.5+31/2, 7.5]) rotate([0, 90, 0]) cylinder(d=15, h=10, $fn=res);
            translate([-6.5, -85.5, 31]) rotate([0, 90, 0]) cylinder(d=15, h=12.5, $fn=res);
            translate([25, -40.5, 33]) rotate([90, 0, 0]) cylinder(d=40, h=7.5, $fn=res);
            translate([0, -48, 3]) cube([45, 7.5, 30]);
            translate([0, -48, 3]) cube([25, 7.5, 50]);
        }
        translate([-16, -40.2, 40-0.2]) cube([50, 50, 50]);
        translate([-16, -70, 27]) rotate([0, 90, 0]) cylinder(d=24, h=50, $fn=res);
        for(i=[0, 1]) {
            for(j=[0, 1]) {
                translate([-1, -30+i*20, 10+j*20]) rotate([0, 90, 0]) cylinder(d=4.3, h=50, $fn=res);
                translate([15, -30+i*20, 10+j*20]) rotate([0, 90, 0]) cylinder(d=10, h=50, $fn=res);
            }
            translate([-1, -85.5+i*31, 11.5]) rotate([0, 90, 0]) cylinder(d=3.5, h=50, $fn=res);
        }
        translate([-1, -85.5, 11.5+31]) rotate([0, 90, 0]) cylinder(d=3.5, h=50, $fn=res);
        translate([-4, -52, 46]) rotate([0, 90, 0]) cylinder(d=8, h=100, $fn=6);
        translate([-50, -52, 46]) rotate([0, 90, 0]) cylinder(d=4.3, h=100, $fn=res);
        translate([-4, -85.5+31/2, 7.5]) rotate([0, 90, 0]) cylinder(d=8, h=16, $fn=6);
        translate([-50, -85.5+31/2, 7.5]) rotate([0, 90, 0]) cylinder(d=4.3, h=100, $fn=res);
        translate([-4, -85.5, 31]) rotate([0, 90, 0]) cylinder(d=8, h=100, $fn=6);
        translate([-50, -85.5, 31]) rotate([0, 90, 0]) cylinder(d=4.3, h=100, $fn=res);
        translate([35, -20, -1]) cylinder(d=4, h=7, $fn=res);
        translate([35, -20, 2.9]) cylinder(d1=4, d2=8, h=3, $fn=res);
        translate([0, -91, 48]) rotate([45, 0, 0]) cube([80, 6, 6], center=true);
        translate([-10, -40.2, 31]) cube([10, 10, 10]);
    }
}

module motor_holder_left() {
    render(convexity=8) difference() {
        union() {
            translate([-15, -70, 0]) cube([15, 70, 40-0.2]);
            translate([-15, -52, 46]) rotate([0, 90, 0]) {
                cylinder(d=7.8, h=28.5, $fn=res);
                cylinder(d=10, h=21.4, $fn=res);
                cylinder(d=28, h=21, $fn=res);
            }
            hull() {
                translate([-15, -85.5, 31]) rotate([0, 90, 0]) cylinder(d=15, h=28.5, $fn=res);
                translate([-15, -85.5+31/2, 7.5]) rotate([0, 90, 0]) cylinder(d=15, h=28.5, $fn=res);
                translate([-15, -85.5+31/2, 32.3]) rotate([0, 90, 0]) cylinder(d=15, h=15, $fn=res);
            }
        }
        translate([0, -70, 27]) rotate([0, 90, 0]) cylinder(d=24, h=50, $fn=res);
        translate([6, -70, 27-24/2]) cube([8, 50, 24]);
        translate([-16, -52, 46]) rotate([0, 90, 0]) cylinder(d=4.3, h=50, $fn=res);
        translate([-16, -52, 46]) rotate([0, 90, 0]) cylinder(d=8, h=28.5-20+6.5+1, $fn=res);
        translate([-16, -40.2, 40-0.2]) cube([50, 50, 50]);
        for(i=[0, 1]) {
            for(j=[0, 1]) {
                translate([-16, -30+i*20, 10+j*20]) rotate([0, 90, 0]) cylinder(d=4.3, h=50, $fn=res);
            }
        }
        translate([-16, -85.5, 31]) rotate([0, 90, 0]) {
            cylinder(d=4.3, h=50, $fn=res);
            cylinder(d=8, h=28.5-20+6.5+1, $fn=res);
        }
        translate([-16, -85.5+31/2, 7.5]) rotate([0, 90, 0]) {
            cylinder(d=4.3, h=50, $fn=res);
            cylinder(d=8, h=28.5-20+6.5+1, $fn=res);
        }
    }
}

translate([-60, -40, 6.5]) rotate([0, -90, 180]) motor_holder_right();
translate([42, 38, 15]) rotate([0, -90, 0]) motor_holder_left();