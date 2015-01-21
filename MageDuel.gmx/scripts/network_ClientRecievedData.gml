/// Network Client Controls

var eventid = ds_map_find_value(async_load, "id"); // Gets the socket

// Check if the data is for this client
if (client == eventid){

    switch(global.NetworkState){
        
        case NETWORK_PLAY:
        {
            var buff = ds_map_find_value(async_load, "buffer");
            cmd = buffer_read(buff, buffer_s16);
            // Read all data...
            
            
            if (cmd == PLAYER_CMD){
                
                // Read out OUR location  (follow scrolling maps)
                //clientx = buffer_read(buff, buffer_s16); // x
                //clienty = buffer_read(buff, buffer_s16); // y
            
                // Get number of (player's data) sent
                global.playerTotal = buffer_read(buff, buffer_s16);
                
                // Clear list and add this client's information
                ds_list_clear(playerDataR);
                
                for(var i=0;i<global.playerTotal;i++){
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //x
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //y
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //sprite_index
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //image_index
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s32)); //image_blend
                    ds_list_add(playerDataR, buffer_read(buff,buffer_string)); //player name
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //playerID
                    ds_list_add(playerDataR, buffer_read(buff,buffer_string)); //active spell
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //active spell index
                    ds_list_add(playerDataR, buffer_read(buff,buffer_s16)); //mana
                }
            }else if(cmd == SETUP_CMD){
                // Clear list and add this client's information
                // Get number of (player's data) sent
                global.playerTotal = buffer_read(buff, buffer_u16);
                
                ds_list_clear(playerDataRSetup);
                
                //for(var i=0;i<global.playerTotal;i++){ // Might be mistake
                    //playerX = buffer_read(buff,buffer_s16) //x
                    //playerY = buffer_read(buff,buffer_s16); //y
                    //playerSpriteIndex = buffer_read(buff,buffer_s16); //sprite_index
                    //playerImageIndex =  buffer_read(buff,buffer_s16); //image_index
                    //playerImageBlend =  buffer_read(buff,buffer_s32); //image_blend
                    localPlayerID = buffer_read(buff,buffer_s16); //playerID;
                //}
            }else if(cmd == SPELL_CMD){
                ds_list_clear(spellDataR);
                
                var numOfSpells = buffer_read(buff, buffer_s16)// Number of spells being sent
                ds_list_add(spellDataR, numOfSpells);
                for(var i=0;i<numOfSpells;i++){
                    ds_list_add(spellDataR, buffer_read(buff,buffer_string)); //spell
                    ds_list_add(spellDataR, buffer_read(buff,buffer_s16)); //x
                    ds_list_add(spellDataR, buffer_read(buff,buffer_s16)); //y
                }
            }
        } 
    }
}