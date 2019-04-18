
/// Cargar musica
http_get_file("https://raw.githubusercontent.com/Glioce/GMLive_examples/master/audio_3D/espera.ogg",
    "espera.ogg");
descargado = false; //archivo descargado
trace("-.-");
//emitter = audio_emitter_create();
//audio_emitter_position(emitter, 200, 200, 0);
//audio_play_sound_on(emitter, music, 1, 1);

/*
x = 100;
y = 200;
audio_listener_position(x, y, 0);
*/

#define step
if (descargado == false) and file_exists("espera.ogg") {
    descargado = true;
    music = audio_create_stream("espera.ogg");
    audio_play_sound(music, 1, true);
    trace(":)");
}

kL = keyboard_check(vk_left);
kR = keyboard_check(vk_right);
kU = keyboard_check(vk_up);
kD = keyboard_check(vk_down);

x += 4*(kR - kL);
y += 4*(kD - kU);
//audio_listener_position(x, y, 0);


/*#define draw
draw_rectangle(195, 195, 205, 205, true);
draw_circle(x, y, 5, false);
draw_text(0,0, file_exists("espera.ogg"));
*/
