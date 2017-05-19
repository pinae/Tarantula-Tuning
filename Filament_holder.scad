module Filamentrolle(durchmesser, breite, randstaerke) {
    cylinder(d=durchmesser, h=randstaerke, $fn=128);
    translate([0, 0, randstaerke]) cylinder(d=durchmesser-4, h=breite-2*randstaerke, $fn=128);
    translate([0, 0, breite-randstaerke]) cylinder(d=durchmesser, h=randstaerke, $fn=128);
}

module Skateboardrolle(durchmesser, breite, lochdurchmesser, ueberhang) {
    color("red") {
        difference() {
            cylinder(d=durchmesser, h=breite, $fn=64);
            translate([0, 0, -1]) cylinder(d=lochdurchmesser, h=breite+2, $fn=32);
            translate([0, 0, -0.001]) 
                cylinder(d1=durchmesser-13, d2=20, h=ueberhang, $fn=32);
            translate([0, 0, ueberhang+25]) 
                cylinder(d1=20, d2=durchmesser-20, h=breite-ueberhang-25+0.001, $fn=32);
        }
    }
}

module Kugellager(durchmesser, breite, lochdurchmesser) {
    color("red") {
        difference() {
            cylinder(d=durchmesser, h=breite, $fn=32);
            translate([0, 0, -1]) cylinder(d=lochdurchmesser, h=breite+2, $fn=32);
        }
    }
}

module Fuss() {
    difference() {
        union() {
            translate([0, 0, 0]) cylinder(d=23, h=5, $fn=6);
            translate([0, 0, 5]) cylinder(d1=23, d2=14, h=5, $fn=6);
        }
        translate([0, 0, -1]) cylinder(d=4.2, h=12, $fn=32);
        translate([0, 0, 10-3.2-0.1]) cylinder(d=7.66+0.5, h=3.2+0.2, $fn=6);
    }
}

spreizwinkel = 30;
filamentrollendurchmesser = 200;//155;
filamentrollenbreite = 38.6;
//filamentrollenbreite = 64;
skateboardrollendurchmesser = 68.75;
skateboardrollenbreite = 55.8;
skateboardrolle_innendurchmesser = 8;
skateboardrolle_ueberhang = 13.8;
kugellagerdurchmesser = 13;
kugellagerbreite = 5;
kugellager_innendurchmesser = 4;
hoehe_unterkante = 65;
/*color("springgreen") translate([0, 0, filamentrollendurchmesser/2+hoehe_unterkante]) 
    rotate([-90, 0, 0]) 
       Filamentrolle(filamentrollendurchmesser, filamentrollenbreite, 4.4);*/
x = sin(spreizwinkel)*(filamentrollendurchmesser/2+skateboardrollendurchmesser/2);
for(i=[-1, 1]) {
    translate([i*x, 33, hoehe_unterkante+filamentrollendurchmesser/2-cos(spreizwinkel)*(filamentrollendurchmesser/2+skateboardrollendurchmesser/2)]) 
        rotate([-90, 0, 0]) {
            //Skateboardrolle(skateboardrollendurchmesser, skateboardrollenbreite, skateboardrolle_innendurchmesser, skateboardrolle_ueberhang);
            //color("green") translate([0, 0, -10]) cylinder(d=8, h=80, $fn=8);
            difference() {
                union() {
                    translate([0, 0, skateboardrolle_ueberhang-0.2]) cylinder(d=skateboardrolle_innendurchmesser+2, h=0.2, $fn=32);
                    cylinder(d1=skateboardrollendurchmesser-25, d2=15, h=skateboardrolle_ueberhang-0.2, $fn=64);
                    translate([0, 0, -10]) cylinder(d=skateboardrollendurchmesser-25+10, h=10, $fn=5);
                    translate([0, 0, skateboardrolle_ueberhang+25]) cylinder(d=10, h=0.2, $fn=32);
                    translate([0, 0, skateboardrolle_ueberhang+25.2]) cylinder(d1=15, d2=45, h=skateboardrollenbreite-skateboardrolle_ueberhang-25.2, $fn=32);
                    translate([0, 0, skateboardrollenbreite]) cylinder(d=55, h=10, $fn=5);
                }
                translate([0, 0, -11]) cylinder(d=skateboardrolle_innendurchmesser+0.2, h=skateboardrollenbreite+22, $fn=32);
                translate([0, 0, -11]) rotate([0, 0, 60/2]) cylinder(d=14.38+0.5, h=15.5+0.1+5, $fn=6);
            }
        }
    translate([i*sin(spreizwinkel)*(filamentrollendurchmesser/2+kugellagerdurchmesser/2), 0, hoehe_unterkante+filamentrollendurchmesser/2-cos(spreizwinkel)*(filamentrollendurchmesser/2+kugellagerdurchmesser/2)]) 
        rotate([-90, 0, 0]) {
            //Kugellager(kugellagerdurchmesser, kugellagerbreite, kugellager_innendurchmesser);
            difference() {
                union() {
                    translate([0, 0, -5]) cylinder(d=kugellagerdurchmesser+3+3, h=5-0.2, $fn=5);
                    translate([0, 0, -0.2]) cylinder(d=kugellager_innendurchmesser+1, h=0.2, $fn=32);
                    translate([0, 0, kugellagerbreite]) cylinder(d=kugellager_innendurchmesser+1, h=0.2, $fn=32);
                    translate([0, 0, kugellagerbreite+0.2]) cylinder(d=kugellagerdurchmesser+3+3, h=5+-0.2, $fn=5);
                    translate([0, 0, kugellagerbreite+5]) cylinder(d1=kugellagerdurchmesser+3+3, d2=13, h=3.2-1-0.2, $fn=5);
                }
                translate([0, 0, -6]) cylinder(d=kugellager_innendurchmesser+0.2, h=12+kugellagerbreite, $fn=32);
                translate([0, 0, kugellagerbreite+4]) rotate([0, 0, 60/2]) cylinder(d=7.66+0.5, h=3.2+0.1, $fn=6);
            }
        }
    translate([i*90, -10, 0]) Fuss();
    translate([i*40, 30, 0]) Fuss();
    translate([i*40, 90, 0]) Fuss();
    translate([i*90, 130, 0]) Fuss();
}