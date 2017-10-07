use <Profiles.scad>
use <Drylin_WS4010_bed_support.scad>
use <NormParts.scad>
use <Nema17.scad>
use <Y-Axis_Idler.scad>
use <Y-Axis_Motor_Holder.scad>
use <Y-Endstop_Holder.scad>
res=32;

pos = -40;

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
translate([-3.5, -222, -12]) rotate([0, 90, 0]) ballbearing608();
translate([-3.5, 231, -19.5]) rotate([0, 90, 0]) idler_wheel();
translate([-3.5, 231, -19.5]) rotate([0, 90, 0]) ballbearing608();
translate([10, 170, -58]) color("green") idler_right();
translate([-10, 170, -58]) idler_left();
translate([10, -170, -58]) color("green") motor_holder_right();
translate([-10, -170, -58]) motor_holder_left();
translate([10, -105, -28]) Y_endstop_holder();
translate([47, pos+41, 0]) Y_endstop_trigger();