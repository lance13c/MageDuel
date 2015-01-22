// Player Executes this Script

// In charge of creating spell structures
len = 30; // Pixels Aways for Player
dir = argument0 // direction to fire the bolt

lx = lengthdir_x(len,(dir+360));
ly = lengthdir_y(len,(dir+360));

// Create the bolt
with(instance_create(x+lx,y+ly,SpellStructure)){
    //Set Bolt/SpellStructure properties
    
}
