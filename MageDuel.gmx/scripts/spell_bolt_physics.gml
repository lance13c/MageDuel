/// Sets the Physics Attributes for the specific spell

fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, 2);
physics_fixture_set_density(fix, 0.5);
return fix;
