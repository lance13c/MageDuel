/// Ping the server once in a while to let it know this client is still connected

buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, PING_CMD);

// Send to Server
var size = network_send_packet(client, buff, buffer_tell(buff));
if (size<=0){
    network_destroy(client);
    buffer_delete(buff);
    game_restart();
}
