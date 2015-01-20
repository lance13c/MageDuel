// This draws all the spell particals given by the server

var indexS = 0;
var numberOfSpells = ds_list_find_value(spellDataR,index++);

for (var k=0;k<numberOfSpells;k++){
    var spell = ds_list_find_value(spellDataR,index++);
    var spellX = ds_list_find_value(spellDataR,index++);
    var SpellY = ds_list_find_value(spellDataR,index++);
    
    var spellScript = asset_get_index(spell);
    script_execute(spellScript,spellX,spellY);
}
