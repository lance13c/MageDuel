//Create Particals Here, Client and Player Use this

//particals = ds_list_create(); // All particals
//particals is an array, test for better preformance

// Naming convention: p_(Spell Name)(partical #)
p_shield1 = part_type_create(); // Partical 1
    part_type_alpha1(p_shield1,1);
    part_type_colour1(p_shield1,c_aqua);
    part_type_life(p_shield1,1,1);
    part_type_speed(p_shield1,0,0,0,0);
    part_type_shape(p_shield1,pt_shape_flare);
    part_type_size(p_shield1,0.1,0.15,0,0.1);
    part_type_direction(p_shield1,0,360,0,0.1);
    //part_type_shape(p_shield1,pt_shape_pixel);
    //ds_list_add(particals,p_shield1);
    particals[0] = p_shield1;
    
return particals;