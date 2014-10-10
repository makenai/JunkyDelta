center_hole_diameter = 12;
bolt_diameter = 8;
material_thickness=6;
parallelogram_width=30;
distance_from_center=-20;


module bolt_pair() {
	translate([parallelogram_width/2,-distance_from_center,-1])
		cylinder(d=bolt_diameter,h=material_thickness+2);
	translate([-parallelogram_width/2,-distance_from_center,-1])
		cylinder(d=bolt_diameter,h=material_thickness+2);

}

module bolt_triangle() {
	bolt_pair();
	rotate(120)
		bolt_pair();
	rotate(-120)
		bolt_pair();
}





module effector() {
	difference() {
		cylinder(d=65,h=material_thickness,center=true6);
		translate([0,0,-1])
			cylinder(d=center_hole_diameter,h=material_thickness+2);
		bolt_triangle();
	}
}

effector();



