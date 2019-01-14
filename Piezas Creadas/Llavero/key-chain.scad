/*
 * Personal Key Chain
 *   v2.0
 *   January 2019
 *   by Julio Martin
 */
 
 
// The name to display on the key chain.
phone = "000000000";
name = "Maria Jesus";
phone2 = "000000000";
name2 = "Amparo";


/* [Font] */

// The font to write the name in.
font = 2; // [0:Google (give name below), 1:Helvetica, 2:Times, 3:Arial, 4:Courier]
font2 = 2;

// the name of the font to get from https://www.google.com/fonts/
google_font = "Arial Unicode MS";

// The Font Style. Not all styles work with all fonts.
style = 4; // [0:None, 1:Regular, 2:Bold, 3:Italic, 4:Bold Italic]
style2 = 0;
/* [Size] */

// How tall the key chain will be.
width = 20; // [15:30]

// How long the key chain will be. 
length = 63;  // [40:100]

// How thick the key chain will be.
thickness = 5; // [3:10]

// How round the corners will be
roundness = 3;   // [1:5]

/* [Hidden] */

font_list = [undef,
             "Helvetica",
             "Times",
             "Arial Unicode MS",
             "Courier",
             "Symbola",
             "Apple Color Emoji",
             "serif",
             "Code2001"];
             
style_list = [undef, 
              "Regular", 
              "Bold", 
              "Italic", 
              "Bold Italic"];

w = width;
l = length;
d = thickness;
r = roundness;
t = str(phone);
t2 = str(name);
amparo = str(phone2);
amparo2 = str(name2);

fn = (font == 0) ? google_font : font_list[font];
sn = (style_list[style] != undef) ? str(":style=",style_list[style]) : "";
f = str(fn,sn);
sn2 = (style_list[style2] != undef) ? str(":style=",style_list[style]) : "";
fn2 = (font == 0) ? google_font : font_list[font2];
f2 = str(fn2,sn2);
//echo(str("Font Used -> ", f));
 

union(){
  difference(){
    hull(convexity=10){      
      translate([-((w/2)+(l/2)-2.5),0,-0.6])
      minkowski(convexity=10){
        cylinder(h=d-r,d=w/2, center=true, $fn=100);
        sphere(d=r, $fn=100);
      }
      
      minkowski(convexity=10){
        cube([l,w,d-r],true);
        sphere(d=r, $fn=100);
      }
    }
  
    translate([-((w/2)+(l/2)-2.5)+3,0,0])
    difference(){
      cylinder(h=d*2, d=w/2, center=true, $fn=100, convexity=10);
      
      rotate_extrude(convexity=10, $fn=100)
      translate([(w-d+r)/3,0,0])
      minkowski(convexity=10){
        square([d-r,d-r],true);
        circle(d=r,$fn=100);
      }
    }
    
    translate([0,0,0.4])
    linear_extrude(height=d/2, convexity=10)
    text(t, valign="up", halign="center", font=f, $fn=100, script="dingbats");
    translate([0,-6,0.4])
    linear_extrude(height=d/2, convexity=10)
    text(t2, valign="center", halign="center", font=f2,size=7, $fn=100, script="dingbats");
    
    rotate([180,0,180])
    translate([0,0,0.4])
    linear_extrude(height=d/2, convexity=10)
    text(amparo, valign="up", halign="center", font=f2, $fn=100, script="dingbats");
    rotate([180,0,180])
    translate([0,-5,0.4])
    linear_extrude(height=d/2, convexity=10)
    text(amparo2, valign="center", halign="center", font=f2, size=7, $fn=100, script="dingbats");
  }

  
}

