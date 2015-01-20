// This draws all the spell particals given by the server

var indexS = 0;
var numberOfSpells = ds_list_find_value(spellDataR,indexS++);

for (var k=0;k<numberOfSpells;k++){
    var spell = ds_list_find_value(spellDataR,indexS++); // spell
    var spellX = ds_list_find_value(spellDataR,indexS++); // x
    var spellY = ds_list_find_value(spellDataR,indexS++); // y
    
    var spellScript = asset_get_index(spell); // spell script to execute
    script_execute(spellScript,spellX,spellY);
}
