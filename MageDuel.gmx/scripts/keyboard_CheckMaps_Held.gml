/// Checks all maps if the given key input is held down, FOR CLIENT

// arg0 = key - this key is one the constant keys

// Check if key pressed are the ones in either map
if (keyboard_check(ds_map_find_value(keys_primary_map,argument0)) || keyboard_check(ds_map_find_value(keys_secondary_map,argument0))){
    return true;
}
return false;
