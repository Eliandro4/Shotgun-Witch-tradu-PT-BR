draw_set_color(c_white)
draw_set_font(fnt_standard)
draw_set_halign(fa_center)
draw_text((room_width / 2), 250, "FIM DE JOGO")
if global.infinite
    draw_text((room_width / 2), 400, ((((((("VOCÊ CHEGOU NA " + string(global.wave_reached)) + "º ONDA EM ") + string((global.time_elasped div 3600))) + ":") + string((global.time_elasped div 60))) + ":") + string((global.time_elasped % 60))))
draw_text((room_width / 2), (room_height / 2), "[R] PRA REINICIAR A ONDA - F1 PRA SAIR")
draw_set_halign(fa_left)
