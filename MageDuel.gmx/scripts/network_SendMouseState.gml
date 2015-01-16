/// Send a mouse "event" to the server - command

/// arg0 == mouse button
/// arg1 = pressed=0, down=1, released=2

buffer_seek(buff, buffer_s16, KEY_CMD);

buffer_write(buff, buffer_s16, KEY_CMD);
buffer_write(buff, buffer_s16, argument0);
buffer_write(buff, buffer_s16, argument1);

// Send Data
network_send_packet(client, buffer, buffer_tell(buff));
