// This will draw the given player

/// Draw Player Info -- FOR CLIENT DRAW ONLY, some varriables are different
// This is the gui that will appear above the players head relaying player info

// arg0 = ds_list of the player data receieved
playerDataR = argument0;

// Get data
    var index = 0;
    var sp,spindex,col,activeSpell,activeSpellIndex,mana
    for(var i=0;i<global.playerTotal;i++){
        
        
        playerX = ds_list_find_value(playerDataR,index++);
        playerY = ds_list_find_value(playerDataR,index++);
        sp = ds_list_find_value(playerDataR,index++);
        spindex = ds_list_find_value(playerDataR,index++);
        col = ds_list_find_value(playerDataR,index++);
        name = ds_list_find_value(playerDataR,index++);
        playerID = ds_list_find_value(playerDataR,index++);
        activeSpell = ds_list_find_value(playerDataR,index++);
        activeSpellIndex = ds_list_find_value(playerDataR,index++);
        mana = ds_list_find_value(playerDataR,index++);
        
        
        draw_sprite(sp,spindex,playerX,playerY);

        var spriteW = sprite_get_width(sp);
        var spriteH = sprite_get_height(sp);
        // Draw
        
        var blocks = 3; // How many cubes above the head: the spell in use
        var height = 40; // How far above head
        var size = 4; // Side dimension of block
        var active = c_blue; // The spell in use
        var unActive = c_gray; // Not a spell in use
        var outline = c_ltgray; // Color of outline
        
        
        var y1 = playerY-height-(size/2);
        var y2 = playerY-height+(size/2);
        
        // Drawing blocks that show which spell is activated -- Blocks start at zero, i does not
        for(var j=1;j<blocks+1;j++){
            var x1 = playerX-(spriteW/4) + (spriteW/2)*(j/4)-(size/2);
            var x2 = playerX-(spriteW/4) + (spriteW/2)*(j/4)+(size/2);
            
            if (j-1 == activeSpellIndex){
                
                draw_rectangle_colour(x1,y1,x2,y2,active,active,active,active,false);
                draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);
            }else{
                draw_rectangle_colour(x1,y1,x2,y2,unActive,unActive,unActive,unActive,false);
                draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);
            }
        }
        
        // Mana Bar
        var height = 32; // Height above player
        var length = 30;
        var width = 4;  // Width of Bar
        var inline = c_blue;
        var outline = c_white;
        
        var x1 = playerX-(spriteW/2) + (spriteW-length)/2;
        var x2 = x1 + ((mana/100) * length);
        var y1 = playerY - height - (width/2);
        var y2 = playerY - height + (width/2);
        
        draw_rectangle_colour(x1,y1,x2,y2,inline,inline,inline,inline,false);
        draw_rectangle_colour(x1,y1,x2,y2,outline,outline,outline,outline,true);
        
        
        //Draw Player Name
        
        //Draw Debug Player Number
        var height = 60; // Height above player
        var color = c_red;
        var text = string(playerID);
        var textLength = string_width(text); // Number of pixels in text
        var x1 = playerX-(spriteW/2) + (spriteW-textLength)/2;
        
        draw_text_colour(x1,playerY-height,text,color,color,color,color,1);
    }
