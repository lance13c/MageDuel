// Controls Clients connects and disconects inside the server

var t = ds_map_find_value(async_load, "type");

var sock = ds_map_find_value(async_load, "socket");

var ip = ds_map_find_value(async_load, "ip");

if (t == network_type_connect){
    ds_list_add( socketlist, sock);
    
    var temp = 0;
    var inst;
    // If Local Player is in game, only create network players
    
    
    if (!instance_exists(PlayerLocal)){
        inst = instance_create(sPos[0,0],sPos[0,1],PlayerLocal); // Refactor Later
    }else{
        inst = instance_create(sPos[1,0],sPos[1,1],PlayerNetwork); // Refactor Later
    }
    ds_map_add(Clients, sock, inst);
    network_ServerSendSetupInfo(inst,sock);
}else{
    
    var inst = ds_map_find_value(Clients, sock);
    // Character will disapear, this is where to add effect of disconnect
    
    ds_map_delete(Clients, sock);
    with(inst){
        instance_destroy();
    }
    // Delete socket from global list
    var index =ds_list_find_index(socketlist,sock);
    ds_list_delete(socketlist,index);
}
