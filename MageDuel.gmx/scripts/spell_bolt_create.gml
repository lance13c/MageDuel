// Player Executes this Script

// In charge of creating spell structures
len = 30; // Pixels Aways for Player
dir = argument0 // direction to fire the bolt
boltSpeed = 15; // How fast the bolt travels in frames per second

lx = lengthdir_x(len,(dir+360));
ly = lengthdir_y(len,(dir+360));

// Create the bolt
with(instance_create(x+lx,y+ly,SpellStructure)){
    //Set Bolt/SpellStructure properties
    dir = (other.dir+360); // The added 360 is to keep it positive when subtracting
    belongTo = other.playerID; // The player this belongs to
    activeSpell = other.activeSpell; // String Value
    spell = asset_get_index(activeSpell); // All spell structures need to have an activeSpell
    parts = ds_map_find_value(other.partsForSpells,activeSpell); // Looks up the particals
    partsAmount = array_length_1d(parts); // The amount of different particals
    speed = other.boltSpeed; // How fast the bolt travels in frames per second
    direction = self.dir; // The direction the bolt is traveling
}
