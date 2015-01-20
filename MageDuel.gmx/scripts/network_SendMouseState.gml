/// Send a mouse "event" to the server - command

/// arg0 == mouse button, or wheel
/// arg1 = pressed=0, down=1, released=2, or true or false

buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, MOUSE_CMD);
buffer_write(buff, buffer_s16, argument0);
buffer_write(buff, buffer_s16, argument1);
buffer_write(buff, buffer_s16, mouse_x);
buffer_write(buff, buffer_s16, mouse_y);

// Send Data
network_send_packet(client, buff, buffer_tell(buff));
