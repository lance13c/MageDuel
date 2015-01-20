/// Send a key "event" to the server - command

/// arg0 == activeSpell
/// arg1 = x
/// arg2 = y

buffer_seek(spell_buffer, buffer_seek_start, 0);

if (global.playerTotal > 0){

    //global.player_buffer = player_buffer;
    buffer_seek(spell_buffer, buffer_seek_start, 0);
    buffer_write(spell_buffer, buffer_u16, SPELL_CMD); // Tell Client this is player data
    
    var numOfSpells = 0; // Number of Spells sending
    buffer_write(spell_buffer, buffer_f16, numOfSpells); // Space holder
    
    with (SpellStructure){
        // Checking if the instance changed, if so send its new info, if no don't send its info
        if (changed){
            other.numOfSpells += 1; // It will always be one extra so in client < this will work
            buffer_write(spell_buffer, buffer_string, activeSpell);
            buffer_write(spell_buffer, buffer_f16, x);
            buffer_write(spell_buffer, buffer_f16, y);
            changed = false;
        }
    }
    var size = buffer_tell(spell_buffer); // Gets the size
    
    // This will overwrite the number of spells to be the correct value
    buffer_seek(spell_buffer, buffer_seek_start, 0);
    buffer_write(spell_buffer, buffer_f16, numOfSpells); // Space holder

    // Send Data
    for(var i=0;i<global.playerTotal;i++){
        var sock = ds_list_find_value(socketlist,i);
        network_send_packet(sock, spell_buffer, size);
    }
}


