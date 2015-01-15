// This is the gui that will appear above the players head relaying player info

var blocks = 3; // How many cubes above the head: the spell in use
var height = 40; // How far above head
var size = 4; // Side dimension of block
var active = c_blue; // The spell in use
var unActive = c_gray; // Not a spell in use
var outline = c_ltgray; // Color of outline


var y1 = y-height-(size/2);
var y2 = y-height+(size/2);

draw_self();

// Drawing blocks that show which spell is activated
for(i=1;i<blocks+1;i++){
    var x1 = x-(sprite_width/4) + (sprite_width/2)*(i/4)-(size/2);
    var x2 = x-(sprite_width/4) + (sprite_width/2)*(i/4)+(size/2);
    
    if (i == activeSpellIndex){
        
        draw_rectangle_colour(x1,y1,x2,y2,active,active,active,active,false);
        draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);
    }else{
        draw_rectangle_colour(x1,y1,x2,y2,unActive,unActive,unActive,unActive,false);
        draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);
    }
}

// Mana Bar
var height = 32; // Height above player
var length = 30;
var width = 4;  // Width of Bar
var inline = c_blue;
var outline = c_white;

var x1 = x-(sprite_width/2) + (sprite_width-length)/2;
var x2 = x1 + ((mana/100) * length);
var y1 = y - height - (width/2);
var y2 = y - height + (width/2);

draw_rectangle_colour(x1,y1,x2,y2,inline,inline,inline,inline,false);
draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);



