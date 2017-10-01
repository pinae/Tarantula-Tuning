use <Profiles.scad>
res=32;

module bed_support() {
    difference() {
        translate([0, 0, 2.5]) cube([220, 220, 5], center=true);
        for(i=[-1, 1]) {
            for(j=[-1, 1]) {
                translate([i*208.4/2, j*208.8/2, -1]) cylinder(d=3, h=7, $fn=res);
                for(k=[0, 1]) {
                    translate([i*60/2, j*(220/2-(29-16)/2)+j*k*-16, -1]) cylinder(d=5, h=7, $fn=res);
                }
            }
        }
        hull() {
            for(i=[-1, 1]) {
                for(j=[-1, 1]) {
                    translate([i*180/2, j*(220/2-29-8), -1]) cylinder(d=16, h=7, $fn=res);
                }
            }
        }
    }
}
bed_support();