/// Network Client Controls

var eventid = ds_map_find_value(async_load, "id"); // Gets the socket

// Check if the data is for this client
if (client == eventid){

    switch(global.NetworkState){
        
        case NETWORK_PLAY:
        {
            // Read all data...
            var buff = ds_map_find_value(async_load, "buffer");
            
            // Get number of sprites sent
            global.playerTotal = buffer_read(buff, buffer_u32);
            
            // Read out OUR location  (follow scrolling maps)
            clientx = buffer_read(buff, buffer_s16); // x
            clienty = buffer_read(buff, buffer_s16); // y
        
            
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
                ds_list_add(playerDataR, buffer_read(buff,buffer_s32)); //active spell
            }
        } 
    }
}
