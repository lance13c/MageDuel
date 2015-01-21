/// Read incoming data to the server

var buff = ds_map_find_value(async_load, "buffer");

//The command
var cmd = buffer_read(buff, buffer_s16);

//Get Socket ID - This is the Client socket ID - key for clients ds_map
var sock = ds_map_find_value(async_load, "id");

var inst = ds_map_find_value(Clients, sock);

show_debug_message(string(inst) + " : " + string(cmd)); // Debuging

    // Check if KEY command
    if (cmd == KEY_CMD){
        
        // Read key
        var key = buffer_read(buff, buffer_s16);
        
        // Is key pressed or not
        var pressed = buffer_read(buff, buffer_bool); // PRESSED = 1, UNPRESSED = 0
        
        // Translate keypress into index for player array
        //if (key == ord('W') || key == vk_space){
            //key = JUMP_KEY;
        //}else if (key == ord('A')){
            //key = LEFT_KEY;
        //}else if (key == ord('D')){
            //key = RIGHT_KEY;
        //}else if (key == ord('S')){
            //key = DOWN_KEY;
        //}else if (key == 
        
        // Translate pressed into a bool for player array
        if (pressed == KEY_UNPRESSED){
            inst.keys[key] = false;
        }else{
            inst.keys[key] = true;
        }
    }else if (cmd == NAME_CMD){
        inst.name = buffer_read(buff, buffer_string);
    }else if (cmd == MOUSE_CMD){
        // Read button
        var mouseButton = buffer_read(buff, buffer_s16);
        // Read State , 0,1,2 : pressed, down, released
        var mouseState = buffer_read(buff, buffer_s16);
        var mouseX =  buffer_read(buff, buffer_s16); // Get Mouse X Position
        var mouseY =  buffer_read(buff, buffer_s16); // Get Mouse Y Position
        
        var dir = point_direction(inst.x,inst.y,mouseX,mouseY); // Direction
        
        if (mouseButton == MOUSE_WHEEL_UP || mouseButton == MOUSE_WHEEL_DOWN){
            inst.mouseWheelInputs[mouseButton] = mouseState;
        }else{
            inst.mouseInputs[mouseButton] = mouseState;
            inst.spellDir = dir; // Only need to set this when spell is active
        }
        
        
    }else if (cmd == PING_CMD){
        // keep alive so ignore
        // Need direction of mouse and player
        // Need mouse x and y position
        //inst.activeSpell = buffer_read(buff, buffer_string);
    }else if (cmd == PARTICAL_CMD){
        // get x
        // get y
        // get how many
        // get particals -- all particals will be set on setup of client
        // get number
        // put is ds_list of particals to display, set with part_particles_create();
        
        //This might not be nessessary
    }else if (cmd == SPELL_LIST_CMD){
        for(var k=0;k<MAX_SPELLS;k++){
            inst.spellsKnown[k] = buffer_read(buff,buffer_string);
        }
    }
