//Sistema de Particula
ps = part_system_create() //Creamos el sistema de particulas y lo guardamos en una variable.
part_system_automatic_update(ps,1) //Indicamos que el sistema se actualize automaticamente.
part_system_automatic_draw(ps,1) //Indicamos que en el sistema se dibujen las particulas automaticamente.
part_system_position(ps,0,0) //Indicamos la posicion del sistema.
part_system_draw_order(ps,0) //Indicamos el orden de dibujo.

//Tipo de particula 2
part = part_type_create() //Creamos el tipo de particulas y lo guardamos en una variable.
//part_type_alpha2(part,0.6,0) //Indicamos la transparencia de la particula.
part_type_size(part, 1, 1, 0, 0) //Indicamos el tama�o de la particula.
part_type_sprite(part, sprite_index, 0, 0, 0) //Esto es parecido a la funcion part_type_shape. Esta funcion la usamos para indicar la forma de la particula, pero usando un sprite.
//part_type_color3(part2,c_blue,c_purple,c_yellow) //Indicamos el/los color/es de la particula.
part_type_life(part, 6, 12) //Indicamos la vida de la particula (lo que va a durar en la pantalla).
//part_type_blend(part,1) //Indicamos si la particula debe "mimetizarse" con el fondo.
part_type_alpha1(part, 0.3)

//Emisor
emit = part_emitter_create(ps) //Creamos el emisor y lo guardamos en una variable.

/*Indicamos la region del emisor, la forma de esa region  y la distribuicion de las particulas
("linear" se usa para cuando se quiere una distribuicion equitativa en toda la region, y "gaussian"
cuando se quiere que se hagan mas particulas en el centro de la region).*/
//part_emitter_region(ps,emit,0,1000,0,750,ps_shape_ellipse,ps_distr_linear) 
