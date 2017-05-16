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

spreizwinkel = 45;
filamentrollendurchmesser = 155;
filamentrollenbreite = 38.6;
//filamentrollenbreite = 64;
skateboardrollendurchmesser = 68.75;
skateboardrollenbreite = 55.8;
skateboardrolle_innendurchmesser = 8;
skateboardrolle_ueberhang = 13.8;
kugellagerdurchmesser = 13;
kugellagerbreite = 5;
kugellager_innendurchmesser = 4;
hoehe_unterkante = 40;
color("springgreen") translate([0, 0, filamentrollendurchmesser/2+hoehe_unterkante]) 
    rotate([-90, 0, 0]) 
       Filamentrolle(filamentrollendurchmesser, filamentrollenbreite, 4.4);
x = sin(spreizwinkel)*(filamentrollendurchmesser/2+skateboardrollendurchmesser/2);
for(i=[-1, 1]) {
    translate([i*x, 33, hoehe_unterkante+filamentrollendurchmesser/2-cos(spreizwinkel)*(filamentrollendurchmesser/2+skateboardrollendurchmesser/2)]) 
        rotate([-90, 0, 0]) 
            Skateboardrolle(skateboardrollendurchmesser, skateboardrollenbreite, skateboardrolle_innendurchmesser, skateboardrolle_ueberhang);
    translate([i*sin(spreizwinkel)*(filamentrollendurchmesser/2+kugellagerdurchmesser/2), 0, hoehe_unterkante+filamentrollendurchmesser/2-cos(spreizwinkel)*(filamentrollendurchmesser/2+kugellagerdurchmesser/2)]) 
        rotate([-90, 0, 0]) {
            Kugellager(kugellagerdurchmesser, kugellagerbreite, kugellager_innendurchmesser);
            difference() {
                union() {
                    translate([0, 0, -5]) cylinder(d=kugellagerdurchmesser+3, h=5, $fn=32);
                    translate([0, 0, kugellagerbreite]) cylinder(d=kugellagerdurchmesser+3, h=5, $fn=32);
                }
                translate([0, 0, -6]) cylinder(d=kugellager_innendurchmesser, h=12+kugellagerbreite, $fn=32);
            }
        }
}