/// Start game - local client+server
with(TextBox){
    global.ServerName = self.Text;
}
global.ServerName = i;


global.newServer = instance_create(0,0,Server);
if (global.haveserver == false){
    show_debug_message("Can't create server");
}else{
    global.connectip = "127.0.0.1";
    network_destroy(global.broadcast_server);
    global.broadcast_server = -1;
    show_debug_message("_________________");
    show_debug_message("Start game");
    show_debug_message("_________________");
    room_goto(Battle_Room_01);
}