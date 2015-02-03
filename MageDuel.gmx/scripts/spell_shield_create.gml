// Player Executes this Script

// In charge of creating spell structures
angle = 50; // Half of how wide of a curve and SpellStructures it makes
inc = 3; // The amount of space between each SpellStructure
len = 50; // Pixels Aways for Player
dir = argument0 // direction middle of curve is

fix = spell_shield_physics(); // Sets up physics attibutes


// Other Side of Curve
for(i=0;i<(angle);i+=inc){
    lx = lengthdir_x(len,(dir+360)-(i));
    ly = lengthdir_y(len,(dir+360)-(i));
    
    
    with(instance_create(x+lx,y+ly,SpellStructure)){
        //physics_set_density()
        
        
        spell_shield_physics_bind(other.fix); // Binds the physics attributes to the instance
        
        offset = -1*other.i; // This is the position offset, -1 to offset side
        dir = (other.dir+360)-(offset); // This angle is used with collisions
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        belongTo = other.playerID; // The player this belongs to
        spell = asset_get_index(activeSpell); // All spell structures need to have an activeSpell
        parts = ds_map_find_value(other.partsForSpells,activeSpell); // Looks up the particals
        partsAmount = array_length_1d(parts); // The amount of different particals
        //spell_shield_part_create(); // This is specific to this script
    }
}
// One Side of Curve
for(i=0;i<(angle);i+=inc){
    lx = lengthdir_x(len,(dir+360)+(i));
    ly = lengthdir_y(len,(dir+360)+(i));
    with(instance_create(other.x+lx,other.y+ly,SpellStructure)){
        //Might cause slow spell casting
        
        spell_shield_physics_bind(other.fix); // Binds the physics attributes to the instance
        
        offset = other.i; // This is the given angle position
        dir = (other.dir+360)-(offset); // This angle is used with collisions
        system = other.system;
        activeSpell = other.activeSpell; // String Value
        belongTo = other.playerID; // The player this belongs to
        spell = asset_get_index(activeSpell); // All spell structures need to have an activeSpell
        parts = ds_map_find_value(other.partsForSpells,activeSpell); // Looks up the particals
        partsAmount = array_length_1d(parts); // The amount of different particals
        //spell_shield_part_create();
    }
}

spell_shield_physics_del(); // Deletes fixture, prevents memory leaks
