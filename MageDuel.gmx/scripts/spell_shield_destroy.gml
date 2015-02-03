
with(SpellStructure){
    if (self.activeSpell == "spell_shield" && self.belongTo == other.playerID){
        instance_destroy();
    }
}