//Create Particals Here, Client and Player Use this

//particals = ds_list_create(); // All particals
//particals is an array, test for better preformance

// Naming convention: p_(Spell Name)(partical #)
p_bolt1 = part_type_create(); // Partical 1
    part_type_alpha1(p_bolt1,1);
    part_type_colour2(p_bolt1,c_red,c_purple);
    part_type_life(p_bolt1,1,1);
    part_type_speed(p_bolt1,0,0,0,0);
    part_type_shape(p_bolt1,pt_shape_flare);
    part_type_size(p_bolt1,0.1,0.15,0,0.1);
    part_type_direction(p_bolt1,0,360,0,0.1);
    //part_type_shape(p_shield1,pt_shape_pixel);
    //ds_list_add(particals,p_shield1);
    particals[0] = p_bolt1;
    
return particals;
