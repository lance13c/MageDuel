// Spell Partical Creation in SpellStructure, This is what the clients will use
//    to display the spell. The server will manage the collisions and objects

// Bolt Spell

//part_emitter_burst(system,e_shield1,p_shield1,5);
//draw_self();

/// arg0 = x
/// arg1 = y
/// arg2 = partical

// For different spells, different amounts of particals will be created
//  and it could be put in a different location relitive to the Spell Structure's
//  x and y

part_particles_create(system,argument0,argument1,argument2,1);