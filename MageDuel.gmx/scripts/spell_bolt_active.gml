// This is the code that happens while the spell is active - Player Runs It

// arg0 = dirRec    The direction of the spell, Rec for received
// Not needed for the Bolt Spell    var dirRec = argument0

// Go through all spellstructures, change only ones for this spell and this player created
with(SpellStructure){
    if (self.activeSpell == "spell_bolt" && self.belongTo == other.playerID){
        //dir = point_direction(other.x,other.y,mouse_x,mouse_y);
        //dir = dir-(offset); // Needed with collisions
        //x = lengthdir_x(other.len,dir) + other.x;
        //y = lengthdir_y(other.len,dir) + other.y;
    }
}
