draw_self()
if hovered
    draw_set_color(c_black)
else
    draw_set_color(c_white)
draw_set_font(fnt_standard)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x, y, "TESTE BOSS")
draw_set_halign(fa_left)
