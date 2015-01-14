// Player Executes this Script

// In charge of creating spell structures
angle = 60; // Half of how wide of a curve and SpellStructures it makes
inc = 3; // The amount of space between each SpellStructure
len = 50; // Pixels Aways for Player
dir = point_direction(x,y,mouse_x,mouse_y); // direction middle of curve is

// Other Side of Curve
for(i=0;i<(angle/2);i+=inc){
    lx = lengthdir_x(len,(dir+360)-(i));
    ly = lengthdir_y(len,(dir+360)-(i));
    with(instance_create(x+lx,y+ly,SpellStructure)){
        offset = other.i; // This is the position offset
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        script_execute(spell_shield_on_create);
    }
}
// One Side of Curve
for(i=0;i<(angle/2);i+=inc){
    lx = lengthdir_x(len,(dir+360)+(i));
    ly = lengthdir_y(len,(dir+360)+(i));
    with(instance_create(other.x+lx,other.y+ly,SpellStructure)){
        offset = other.i; // This is the given angle position
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        script_execute(spell_shield_on_create);
    }
}
