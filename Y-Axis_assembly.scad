use <Profiles.scad>
use <Drylin_WS4010_bed_support.scad>
use <NormParts.scad>
use <Nema17.scad>
res=32;

pos = -30;

translate([0, pos, 0]) color("violet") bed_support();
translate([0, 420/2, -30-18]) rotate([90, 0, 0]) profileI5double(420);
translate([0, 420/2, -18]) rotate([90, 0, 0]) DrylinWS4010(420);
for(i=[0, 1]) {
    for(j=[0, 1]) {
        translate([0, pos+-41+j*111+i*-29, -18]) rotate([90, 0, i*180]) Drylin10slider();
    }
}
translate([11.25, -240, -31]) rotate([0, -90, 0]) pulley20teeth(5);
translate([63, -240, -31]) rotate([0, -90, 0]) Nema17();