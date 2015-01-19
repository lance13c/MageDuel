/// Send a mouse "event" to the server - command

/// arg0 == mouse button
/// arg1 = pressed=0, down=1, released=2

buffer_seek(buff, buffer_s16, 0);

buffer_write(buff, buffer_s16, MOUSE_CMD);
buffer_write(buff, buffer_s16, argument0);
buffer_write(buff, buffer_s16, argument1);
var dir = point_direction(playerX,playerY,mouse_x,mouse_y); // Mouse direction
buffer_write(buff, buffer_s16, dir);

// Send Data
network_send_packet(client, buff, buffer_tell(buff));
