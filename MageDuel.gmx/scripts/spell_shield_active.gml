// This is the code that happens while the spell is active - Player Runs It

// arg0 = dir    The direction of the spell
var dir = argument0

// Go through all spellstructures, change only ones for this spell and this player created
with(SpellStructure){
    if (self.activeSpell == "spell_shield" && self.belongTo == other.playerID){
        //dir = point_direction(other.x,other.y,mouse_x,mouse_y);
        x = lengthdir_x(other.len,(dir+360)-(offset)) + other.x;
        y = lengthdir_y(other.len,(dir+360)-(offset)) + other.y;
    }
}
