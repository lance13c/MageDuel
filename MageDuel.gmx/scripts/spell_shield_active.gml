// This is the code that happens while the spell is active - Player Runs It

// arg0 = dir    The direction of the spell
var dir = argument0

with(SpellStructure){
    if (self.activeSpell == spell_shield){
        //dir = point_direction(other.x,other.y,mouse_x,mouse_y);
        x = lengthdir_x(other.len,(dir+360)-(offset)) + other.x;
        y = lengthdir_y(other.len,(dir+360)-(offset)) + other.y;
    }
}
