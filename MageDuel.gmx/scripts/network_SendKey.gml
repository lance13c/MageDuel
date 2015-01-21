/// Send a key "event" to the server - command

/// arg0 == key
/// arg1 = not pressed=0, pressed=1

buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, KEY_CMD);
buffer_write(buff, buffer_s16, argument0);
buffer_write(buff, buffer_bool, argument1);

// Send Data
network_send_packet(client, buff, buffer_tell(buff));
