module profileI5(l) {
    color("Silver") render(convexity=8) linear_extrude(height=l, convexity=8) {
        difference() {
            union() {
                for(i=[-1, 1]) {
                    for(j=[-1, 1]) {
                        translate([i*8, j*8, 0]) circle(d=4, $fn=12);
                        translate([i*(10-1.58/2), j*(2.5+5.5/2), 0]) square([1.58, 5.5], center=true);
                        translate([i*(2.5+5.5/2), j*(10-1.58/2), 0]) square([5.5, 1.58], center=true);
                        translate([i*(5.55+1.5/2), j*(10-1.58-1.5/3), 0]) square([1.5, 1.5], center=true);
                        translate([i*(10-1.58-1.5/3), j*(5.55+1.5/2), 0]) square([1.5, 1.5], center=true);
                    }
                    rotate([0, 0, i*45]) square([20, 1.5], center=true);
                }
                square([2*(10-6.35), 2*(10-6.35)], center=true);
            }
            circle(d=4.3, $fn=16);
            for(i=[-1, 1]) {
                for(j=[-1, 1]) {
                    translate([i*5.55, j*(10-1.58-1.5/2), 0]) circle(d=1.5, $fn=8);
                    translate([i*(10-1.58-1.5/2), j*5.55, 0]) circle(d=1.5, $fn=8);
                }
            }
        }
    }
}

module profileI5double(l) {
    color("Silver") render(convexity=8) linear_extrude(height=l, convexity=8) {
        difference() {
            union() {
                for(i=[-1, 1]) {
                    for(j=[-1, 1]) {
                        translate([i*8, j*18+10, 0]) circle(d=4, $fn=12);
                        translate([i*(10-1.58/2), j*(2.5+5.5/2), 0]) square([1.58, 5.5], center=true);
                        translate([i*(10-1.58/2), j*(2.5+5.5/2)+20, 0]) square([1.58, 5.5], center=true);
                        translate([i*(2.5+5.5/2), j*(20-1.58/2)+10, 0]) square([5.5, 1.58], center=true);
                        translate([i*(5.55+1.5/2), j*(20-1.58-1.5/3)+10, 0]) square([1.5, 1.5], center=true);
                        translate([i*(10-1.58-1.5/3), j*(5.55+1.5/2), 0]) square([1.5, 1.5], center=true);
                        translate([i*(10-1.58-1.5/3), j*(5.55+1.5/2)+20, 0]) square([1.5, 1.5], center=true);
                        translate([0, j*10+10, 0]) rotate([0, 0, i*45]) square([26, 1.5], center=true);
                        translate([0, j*10+10, 0]) square([2*(10-6.35), 2*(10-6.35)], center=true);
                        translate([i*8.5, j*2.5+10, 0]) square([2, 2], center=true);
                    }
                    translate([i*9.2, 10, 0]) square([1.6, 7], center=true);
                }
                
            }
            for(i=[-1, 1]) {
                translate([0, i*10+10, 0]) circle(d=4.3, $fn=16);
                translate([i*7.883, 10, 0]) circle(d=1.5, $fn=16);
                for(j=[-1, 1]) {
                    for(k=[0, 20]) {
                        translate([i*5.55, j*(10-1.58-1.5/2)+k, 0]) circle(d=1.5, $fn=8);
                        translate([i*(10-1.58-1.5/2), j*5.55+k, 0]) circle(d=1.5, $fn=8);
                    }
                }
            }
        }
    }
}

module DrylinWS4010(l) {
    color("Silver") render(convexity=8) linear_extrude(height=l, convexity=8) {
        for(i=[-1, 1]) {
            translate([i*20, 9, 0]) circle(d=10, $fn=48);
            translate([i*16.5, 3.5, 0]) rotate([0, 0, i*20]) square([5, 5], center=true);
        }
        translate([0, 5.5/2, 0]) square([40, 5.5], center=true);
    }
}

module Drylin10slider() {
    color("Silver") render(convexity=4) difference() {
        translate([30+6.5-26, 2, 0]) cube([26, 16, 29]);
        translate([20, 9, -1]) cylinder(d=10.1, h=31, $fn=48);
        for(i=[-1, 1]) {
            translate([30, 19, 29/2+i*8]) rotate([90, 0, 0]) cylinder(d=5, h=18, $fn=32);
        }
        translate([-5.5, -8, -1]) cube([26, 16, 31]);
    }
}

Drylin10slider();
DrylinWS4010(30);
//profileI5double(15);
//translate([0, 0, -5]) profileI5(4);
//translate([0, 20, -5]) profileI5(5);