// This is the code that happens while the spell is active - Player Runs It

// arg0 = dirRec    The direction of the spell, Rec for received
var dirRec = argument0

// Go through all spellstructures, change only ones for this spell and this player created
with(SpellStructure){
    if (self.activeSpell == "spell_shield" && self.belongTo == other.playerID){
        //dir = point_direction(other.x,other.y,mouse_x,mouse_y);
        dir = (dirRec+360)-(offset); // Needed with collisions
        //x = lengthdir_x(other.len,dir) + other.x;
        //y = lengthdir_y(other.len,dir) + other.y;
        phy_position_x = lengthdir_x(other.len,dir) + other.x;
        phy_position_y = lengthdir_y(other.len,dir) + other.y;
        // Add physics gravity reverse
        //physics_apply_force(other.x,other.y,0,-1.5); // Continuously Add Force Upward Cancelling Gravity
    }
}
