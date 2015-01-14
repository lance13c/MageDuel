e_shield = part_emitter_create(system);  // Emitter
    part_emitter_region(system,e_shield1,-1*sprite_width,sprite_width,-1*sprite_height,sprite_height,ps_shape_ellipse,ps_distr_linear);

p_shield1 = part_type_create(); // Partical 1
    part_type_alpha1(p_shield1,1);
    part_type_colour1(p_shield1,c_aqua);
    part_type_life(p_shield1,10,15);
    part_type_speed(p_shield1,0.3,0.5,0.1,0.1);
    part_type_shape(p_shield1,pt_shape_pixel);

part_emitter_burst(system,e_shield, parttype, number);