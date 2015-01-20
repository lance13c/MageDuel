// Player Executes this Script

// In charge of creating spell structures
angle = 50; // Half of how wide of a curve and SpellStructures it makes
inc = 3; // The amount of space between each SpellStructure
len = 50; // Pixels Aways for Player
dir = point_direction(x,y,mouse_x,mouse_y); // direction middle of curve is

// Other Side of Curve
for(i=0;i<(angle);i+=inc){
    lx = lengthdir_x(len,(dir+360)-(i));
    ly = lengthdir_y(len,(dir+360)-(i));
    with(instance_create(x+lx,y+ly,SpellStructure)){
        offset = -1*other.i; // This is the position offset, -1 to offset side
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        belongTo = other.playerID; // The player this belongs to
        spell = asset_get_index(activeSpell); // All spell structures need to have an activeSpell
        parts = ds_map_find_value(other.partsForSpells,activeSpell); // Looks up the particals
        partsAmount = array_length_1d(parts); // The amount of particals
        //spell_shield_part_create(); // This is specific to this script
    }
}
// One Side of Curve
for(i=0;i<(angle);i+=inc){
    lx = lengthdir_x(len,(dir+360)+(i));
    ly = lengthdir_y(len,(dir+360)+(i));
    with(instance_create(other.x+lx,other.y+ly,SpellStructure)){
        offset = other.i; // This is the given angle position
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        belongTo = other.playerID; // The player this belongs to
        spell = asset_get_index(activeSpell); // All spell structures need to have an activeSpell
        parts = ds_map_find_value(other.partsForSpells,activeSpell); // Looks up the particals
        partsAmount = array_length_1d(parts); // The amount of particals
        //spell_shield_part_create();
    }
}
