/// Use this to map keys aka setup controls for the user
// Only works for keyboards so far

// arg0 = the key map to change -- keys_primary_map or keys_secondary_map
// arg1 = action being changed -- Jump,Left,Right,Toggle Spell Forward ...
// arg2 = key changing to

// return false if key is already mapped, otherwise true and it is assigned

var map = argument0 // Primary or Secondary
var action = argument1;
var key = argument2; // key changing to

var map1 = keys_primary_map;
var map2 = keys_secondary_map;

//Check all mapped keys, if any match key2 tell user it is being used

for (var i=0;i<KEY_MAP_SIZE;i++){
    if (ds_map_find_value(map1,i) == key || ds_map_find_value(map1,i) == key){
        return false
    }
}
// Set key in map and return true
ds_map_replace(map,action,key);
return true;

