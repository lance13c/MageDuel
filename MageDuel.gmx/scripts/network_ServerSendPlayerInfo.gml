
global.playerTotal = ds_list_size(socketlist); // How many clients/players

if (global.playerTotal > 0){

    //global.player_buffer = player_buffer;
    buffer_seek(player_buffer, buffer_seek_start, 0);
    
    
    buffer_write(player_buffer, buffer_u16, PLAYER_CMD); // Tell Client this is player data
    buffer_write(player_buffer, buffer_u16, global.playerTotal);
    //buffer_write(player_buffer, buffer_s16, 0); // client x
    //buffer_write(player_buffer, buffer_s16, 0); // client y
    
    
    // All active Players
    with(Player){
        buffer_write(other.player_buffer, buffer_s16, x);
        buffer_write(other.player_buffer, buffer_s16, y);
        buffer_write(other.player_buffer, buffer_s16, sprite_index);
        buffer_write(other.player_buffer, buffer_s16, image_index);
        buffer_write(other.player_buffer, buffer_s32, image_blend);
        buffer_write(other.player_buffer, buffer_string, name);
        buffer_write(other.player_buffer, buffer_s16, playerID); // playerID
        buffer_write(other.player_buffer, buffer_string,script_get_name(activeSpell)); // player active spell
        buffer_write(other.player_buffer, buffer_u16, activeSpellIndex); // player active spell index
        buffer_write(other.player_buffer, buffer_u16, mana); // player mana
    }
    
    var buffer_size = buffer_tell(player_buffer);
    
    //Send data to clients
    
    for(var i=0;i<global.playerTotal;i++){
        // get socket
        var sock = ds_list_find_value(socketlist,i);
        
        // Write in client location
        //buffer_seek(player_buffer, buffer_seek_start, 4);
        
        // Get the player's instance
        //var inst = ds_map_find_value(Clients, sock);
        //buffer_write(global.player_buffer, buffer_s16, inst.x);
        //buffer_write(global.player_buffer, buffer_s16, inst.y);
        
        // Send Data
        network_send_packet( sock, player_buffer, buffer_size);
    }
}
