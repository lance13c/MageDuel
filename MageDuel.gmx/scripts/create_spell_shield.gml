// Player Executes this Script

// In charge of creating spell structures
angle = 40; // Half of how wide of a curve and SpellStructures it makes
len = 30; // Pixels Aways for Player
dir = point_direction(x,y,mouse_x,mouse_y); // direction middle of curve is

// Other Side of Curve
for(i=0;i<(angle/2);i+=2){
    lx = lengthdir_x(len,(dir+360)-(i));
    ly = lengthdir_y(len,(dir+360)-(i));
    instance_create(x+lx,y+ly,SpellStructure);
}
// One Side of Curve
for(i=0;i<(angle/2);i+=2){
    lx = lengthdir_x(len,(dir+360)+(i));
    ly = lengthdir_y(len,(dir+360)+(i));
    instance_create(x+lx,y+ly,SpellStructure);
}

