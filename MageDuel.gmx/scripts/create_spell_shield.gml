// Player Executes this Script
//system = argument0; // The Player Partical System
//activeSpell = argument1; // The Player Current Spell Used -- String Value

// In charge of creating spell structures
angle = 40; // Half of how wide of a curve and SpellStructures it makes
len = 30; // Pixels Aways for Player
dir = point_direction(x,y,mouse_x,mouse_y); // direction middle of curve is

// Other Side of Curve
for(i=0;i<(angle/2);i+=2){
    lx = lengthdir_x(len,(dir+360)-(i));
    ly = lengthdir_y(len,(dir+360)-(i));
    with(instance_create(x+lx,y+ly,SpellStructure)){
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        script_execute(on_create_spell_shield);
    }
}
// One Side of Curve
for(i=0;i<(angle/2);i+=2){
    lx = lengthdir_x(len,(dir+360)+(i));
    ly = lengthdir_y(len,(dir+360)+(i));
    with(instance_create(other.x+lx,other.y+ly,SpellStructure)){
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        script_execute(on_create_spell_shield);
    }
}
