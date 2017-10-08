res = 32;

module belt_stamp(width) {
    td = 1.25+0.2+0.2;
    tw = 37.52/20;
    h=1.87;
    count = 10;
    color("Red") render(convexity=4) {
        union() {
            for(i=[0:count]) {
                difference() {
                    translate([i*tw, -width/2, 0]) rotate([-90, 0, 0]) cylinder(d=td, h=width, $fn=res/2);
                    translate([-tw, -1-width/2, -tw]) cube([(count+2)*tw, width+2, tw]);
                }
            }
            translate([-tw/2, -width/2, -(h-td+0.1)]) cube([(count+1)*tw, width, h-td+0.1]);
        }
    }
}

belt_stamp(7);
