/// When user releases control of the spell, release mouse click

with(SpellStructure){
    if (self.activeSpell == "spell_bolt" && self.belongTo == other.playerID){
        instance_destroy();
    }
}
