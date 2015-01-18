/// Gets the first open playerID available
for (var i=0;i<MAX_PLAYERS; i++){
    // If the value if false return the number
    if (!ds_list_find_value(global.openPlayerID,i)){
        ds_list_replace(global.openPlayerID,i,true);
        return i;
    }
}
// Otherwise return -1
return -1;
