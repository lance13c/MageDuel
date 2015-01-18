// Send client setup data, This gives the client the starting attributes

var inst = argument0 // The instance 

global.player_buffer = player_buffer;
buffer_seek(player_buffer, buffer_seek_start, 0);

buffer_write(player_buffer, buffer_u32, SETUP_CMD); // Tell Client this is player data
buffer_write(player_buffer, buffer_u32, global.playerTotal); // total amount of players

with(inst){
    buffer_write(global.player_buffer, buffer_s16, other.sPos[self.playerID,0]); // x
    buffer_write(global.player_buffer, buffer_s16, other.sPos[self.playerID,1]); // y
    buffer_write(global.player_buffer, buffer_s16, sprite_index);
    buffer_write(global.player_buffer, buffer_s16, image_index);
    buffer_write(global.player_buffer, buffer_s32, image_blend);
    buffer_write(global.player_buffer, buffer_s16, playerID); //playerID
}
