
//Create Players
global.players = 1; // How many players are in the game
instance_create(0,0,Client);
instance_create(room_width/3,room_height*2/3,PlayerLocal);
