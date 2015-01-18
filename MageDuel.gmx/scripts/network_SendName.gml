// Send Name event to the Server
// arg0 = name of Player

buffer_seek(buff, buffer_seek_start, 0);

// Write Command
buffer_write(buff, buffer_s16,NAME_CMD);
buffer_write(buff, buffer_string, argument0);

// Send to Server
network_send_packet(client, buff, buffer_tell(buff));