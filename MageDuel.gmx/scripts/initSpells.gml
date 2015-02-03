/// Initializes all spells in local data spell list
var size = ds_list_size(spellList);
for(var j=0;j<size;j++){
    var spellName = ds_list_find_value(spellList,j);
    var spellNameCreate = spellName + "_part_create";
    var spellScript = asset_get_index(spellNameCreate);
    var partList = script_execute(spellScript); // Returns list of particals related to the spell
    
    // This being intialized in client's and player's with statment for localData
    ds_map_add(other.partsForSpells,spellName,partList); // Adding partical list to map
}
