// Send client setup data

global.player_buffer = player_buffer;
buffer_seek(player_buffer, buffer_seek_start, 0);

buffer_write(player_buffer, buffer_u32, SETUP_CMD); // Tell Client this is player data
buffer_write(player_buffer, buffer_u32, global.playerTotal); // total amount of players
buffer_write(global.player_buffer, buffer_s16, 0); // client x
buffer_write(global.player_buffer, buffer_s16, 0); // client y

with(Player){
    buffer_write(global.player_buffer, buffer_s16, other.sPos[self.playerID,0]);
    buffer_write(global.player_buffer, buffer_s16, other.sPos[self.playerID,1]);
    buffer_write(global.player_buffer, buffer_s16, sprite_index);
    buffer_write(global.player_buffer, buffer_s16, image_index);
    buffer_write(global.player_buffer, buffer_s32, image_blend);
    buffer_write(global.player_buffer, buffer_string, name);
    buffer_write(global.player_buffer, buffer_s16, playerID); //playerID
}
