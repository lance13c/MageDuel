/// Send a key "event" to the server - command

/// arg0 == activeSpell
/// arg1 = x
/// arg2 = y

buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, SPELL_CMD);
buffer_write(buff, buffer_s16, argument0);
buffer_write(buff, buffer_s16, argument1);

// Send Data
network_send_packet(client, buff, buffer_tell(buff));
