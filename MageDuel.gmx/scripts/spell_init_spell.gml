// Init current spell if it is not already, DONT USE
if (!initSpell){
    var spellName = activeSpell + "_part_create";
    var spell = asset_get_index(spellName);
    script_execute(spell);
    initSpell = true;
}
