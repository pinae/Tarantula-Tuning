use <Stamps.scad>
res=32;

module belt_clamp() {
    render(convexity=6) difference() {
        translate([0, 0, -5/2]) cube([20, 10, 5], center=true);
        translate([0, -9.4, -0.25]) rotate([180, 0, 90]) belt_stamp(7.2);
        for(i=[-1, 1]) {
            translate([i*6, 0, -6]) {
                cylinder(d=3.3, h=10, $fn=res);
                cylinder(d=6.3, h=3.5, $fn=6);
            }
        }
    }
}
translate([0, 0, 5]) belt_clamp();
/*for(i=[-1, 1]) {
    translate([i*6, 0, 0]) {
        color("blue") cylinder(d=3.3, h=2.5, $fn=res);
    }
}*/