/// Read incoming data to the server

var buff = ds_map_find_value(async_load, "buffer");

//The command
var cmd = buffer_read(buff, buffer_s16);

//Get Socket ID - This is the Client socket ID - key for clients ds_map
var sock = ds_map_find_value(async_load, "id");

var inst = ds_map_find_value(Clients, sock);

// Check if KEY command
if (cmd == KEY_CMD){
    
    // Read key
    var key = buffer_read(buff, buffer_s16);
    
    // Is key pressed or not
    var pressed = buffer_read(buff, buffer_s16);
    
    // Translate keypress into index for player array
    if (key == ord('W') || key == vk_space){
        key = JUMP_KEY;
    }else if(key == vk_left){
        key = LEFT_KEY;
    }else if (key == vk_right){
        key = RIGHT_KEY;
    }
    
    // Translate pressed into a bool for player array
    if (pressed == 0){
        inst.keys[key] = false;
    }else{
        inst.keys[key] = true;
    }
}else if (cmd == NAME_CMD){
    inst.PlayerName = buffer_read(buff, buffer_string);
}else if (cmd == PING_CMD){
    // keep alive so ignore
}