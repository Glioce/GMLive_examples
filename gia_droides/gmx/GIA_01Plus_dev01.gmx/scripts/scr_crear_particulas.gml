//Mi version
part_type_scale(part, face, 1)
part_system_depth(ps,(x / 4) + 1) //Indicamos la profundidad del sistema.
part_emitter_region(ps, emit, x, x, y, y, ps_shape_ellipse, ps_distr_linear)
part_emitter_burst(ps, emit, part, 1) //Esto emite una unica ves una cantidad de 5 particulas de la particula "part".
