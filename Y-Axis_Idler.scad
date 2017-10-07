res=32;

module idler_wheel() {
    render(convexity=4) difference() {
        union() {
            translate([0, 0, -2]) cylinder(d1=41, d2=37, h=2, $fn=64);
            cylinder(d=37, h=7, $fn=64);
            translate([0, 0, 7]) cylinder(d1=37, d2=41, h=2, $fn=64);
        }
        cylinder(d=22.2, h=10, $fn=64);
        translate([0, 0, -3]) cylinder(d=20, h=10, $fn=64);
    }
}

module idler_right() {
    render(convexity=4) difference() {
        union() {
            cube([15, 61, 40-0.2]);
            difference() {
                hull() {
                    translate([-13.6, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=42, h=28.6, $fn=64);
                    translate([-13.6, 61, 21]) rotate([0, 90, 0]) cylinder(d=42, h=28.6, $fn=64);
                }
                translate([-4-19, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=43, h=19, $fn=64);
            }
            translate([-6.4, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=11, h=21.4, $fn=32);
            translate([-13.6, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=7.8, h=28.4, $fn=32);
        }
        translate([-24, 31, 17]) cube([20, 30, 10]);
        translate([-24, 31, 17]) cube([20, 20, 30]);
        for(i=[0, 1]) {
            for(j=[0, 1]) {
                translate([16, 10+i*22, 10+j*20]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
            }
            translate([16, 50+i*20, 12]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
            translate([16, 50+i*20, 12]) rotate([0, -90, 0]) cylinder(d=8, h=18, $fn=32);
        }
        translate([16, 61, 38.5]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
        translate([16, 61, 38.5]) rotate([0, -90, 0]) cylinder(d=8, h=18, $fn=32);
    }
}

module idler_left() {
    render(convexity=4) difference() {
        union() {
            translate([-15, 0, 0]) cube([15, 60, 40-0.2]);
            difference() {
                hull() {
                    translate([-15, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=42, h=21.5, $fn=64);
                    translate([-15, 61, 21]) rotate([0, 90, 0]) cylinder(d=42, h=21.5, $fn=64);
                }
                translate([4, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=43, h=10, $fn=64);
            }
            translate([-15, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=42, h=19, $fn=64);
            translate([-15, 61, 38.5]) rotate([0, 90, 0]) cylinder(d=11, h=21.4, $fn=32);
        }
        translate([4, 31, 17]) cube([20, 30, 10]);
        translate([4, 31, 17]) cube([20, 20, 30]);
        for(i=[0, 1]) {
            for(j=[0, 1]) {
                translate([1, 10+i*22, 10+j*20]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
            }
            translate([16, 50+i*20, 12]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
            translate([1.4, 50+i*20, 12]) rotate([0, -90, 0]) cylinder(d=8, h=50, $fn=6);
        }
        translate([16, 61, 38.5]) rotate([0, -90, 0]) cylinder(d=4.5, h=50, $fn=32);
        translate([1.4, 61, 38.5]) rotate([0, -90, 0]) cylinder(d=8, h=50, $fn=6);
    }
}

translate([45, 0, 15]) rotate([0, -90, 0]) idler_left();
translate([0, -5, 15]) rotate([0, 90, 90]) idler_right();
translate([-36, 69, 2]) rotate([0, 0, 0]) idler_wheel();
for(i=[0, 1]) {
    translate([33, 50+i*20, 0]) color("blue") cylinder(d=4.5, h=16.4, $fn=32);
    translate([-50-i*20, 7, 0]) color("blue") cylinder(d=4.5, h=17, $fn=32);
}
translate([6.5, 61, 0]) color("blue") cylinder(d=4.5, h=16.4, $fn=32);
translate([-61, 33.5, 0]) color("blue") cylinder(d=4.5, h=17, $fn=32);