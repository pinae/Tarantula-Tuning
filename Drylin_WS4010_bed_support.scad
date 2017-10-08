use <Profiles.scad>
res=32;

module bed_support() {
    difference() {
        translate([0, 0, 2.5]) cube([220, 220, 5], center=true);
        for(i=[-1, 1]) {
            for(j=[-1, 1]) {
                translate([i*208.4/2, j*208.8/2, -1]) cylinder(d=3, h=7, $fn=res);
                for(k=[0, 1]) {
                    translate([i*60/2, j*(220/2-(29-16)/2-40)+j*k*-16, -1]) cylinder(d=5, h=7, $fn=res);
                }
                translate([i*6, j*64, -1]) cylinder(d=3, h=7, $fn=res);
            }
            translate([47, 61+10*i, -1]) cylinder(d=4, h=10, $fn=res);
        }
        hull() {
            for(i=[-1, 1]) {
                for(j=[-1, 1]) {
                    translate([i*180/2, j*(220/2-29-8-40), -1]) cylinder(d=16, h=7, $fn=res);
                }
            }
        }
        hull() {
            for(i=[-1, 1]) {
                for(j=[-1, 1]) {
                    translate([i*200/2-(j+1)*i*38, j*20-29-8-60, -1]) cylinder(d=16, h=7, $fn=res);
                }
            }
        }
        hull() {
            for(i=[-1, 1]) {
                for(j=[-1, 1]) {
                    translate([i*200/2+(j-1)*i*38, j*20+29+8+60, -1]) cylinder(d=16, h=7, $fn=res);
                }
            }
        }
    }
}
bed_support();