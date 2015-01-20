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
if (keyboard_check(ord('D'))){
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
// Mouse Up
}else if (!device_mouse_check_button(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_UP);
//Mouse Released
}else if (device_mouse_check_button_released(0,mb_left)){
    network_SendMouseState(mb_left,MOUSE_RELEASED);
}

