/// Send the local data spell list to the server, -- Client sends this to server

buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, SPELL_LIST_CMD);
for (var k=0;k<MAX_SPELLS;k++){
    buffer_write(buff, buffer_string, spellsKnown[k]);
}

// Send to Server
network_send_packet(client, buff, buffer_tell(buff));
