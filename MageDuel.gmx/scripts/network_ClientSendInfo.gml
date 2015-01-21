/// Send Player Inputs to Server

//Key Map these

// Jump
if (keyboard_check(ord('W')) || keyboard_check(vk_space)){
    network_SendKey(JUMP_KEY,KEY_PRESSED);
}else{
    network_SendKey(JUMP_KEY,KEY_UNPRESSED);
}

// Move Left
if (keyboard_check(ord('A'))){
    network_SendKey(LEFT_KEY,KEY_PRESSED);
}else{
    network_SendKey(LEFT_KEY,KEY_UNPRESSED);
}

// Move Right
if (keyboard_CheckMaps_Held(RIGHT_KEY)){         // Experiment
    network_SendKey(RIGHT_KEY,KEY_PRESSED);
}else{
    network_SendKey(RIGHT_KEY,KEY_UNPRESSED);
}

// Move Down
if (keyboard_check(ord('S'))){
    network_SendKey(DOWN_KEY,KEY_PRESSED);
}else{
    network_SendKey(DOWN_KEY,KEY_UNPRESSED);
}

// Mouse Press
if (device_mouse_check_button_pressed(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_PRESSED);
// Mouse Down
}else if (device_mouse_check_button(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_DOWN);
// Mouse Released
}else if (!device_mouse_check_button(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_RELEASED);
    
     //If mouse wheel state changes when left mouse is not down
    if (mouse_wheel_up()){
        network_SendMouseState(MOUSE_WHEEL_UP,true);
    }else if (mouse_wheel_down()){
        network_SendMouseState(MOUSE_WHEEL_DOWN,true);
    }
    
    // This is incharge of toggling through spells
    if (keyboard_CheckMaps_Pressed(TOGGLE_SPELL_FORWARD)){
        network_SendKey(TOGGLE_SPELL_FORWARD,KEY_PRESSED);
    }else{
        network_SendKey(TOGGLE_SPELL_FORWARD,KEY_UNPRESSED);
    }
    
    if (keyboard_CheckMaps_Pressed(TOGGLE_SPELL_BACKWARD)){
        network_SendKey(TOGGLE_SPELL_BACKWARD,KEY_PRESSED);
    }else{
        network_SendKey(TOGGLE_SPELL_BACKWARD,KEY_UNPRESSED);
    }
    
    
    
//Mouse Released
}else if (device_mouse_check_button_released(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_RELEASED);
}
