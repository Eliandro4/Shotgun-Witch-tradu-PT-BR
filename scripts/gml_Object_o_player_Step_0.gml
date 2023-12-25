key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")))
key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")))
key_up = (keyboard_check(vk_up) || keyboard_check(ord("W")))
key_down = (keyboard_check(vk_down) || keyboard_check(ord("S")))
if (hp <= 0)
{
    global.death_x = x
    global.death_y = y
    global.death_f = image_xscale
    room_goto(End)
}
dashtimer--
knockbacktimer--
if (knockbacktimer <= 0)
    hit = 0
if ((keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_shift)) && dashtimer <= 0)
{
    audio_play_sound(snd_woosh, 1, false)
    knockbacktimer = 30
    hit = 1
    image_speed = 3
    dashtimer = 45
    state = (1 << 0)
    ported = 0
}
else
{
    if (!ported)
    {
        ported = 1
        instance_create_layer(x, y, "Debris", o_debris_enem)
        instance_create_layer(x, y, "Debris", o_debris_enem)
        instance_create_layer(x, y, "Debris", o_debris_enem)
        instance_create_layer(x, y, "Debris", o_debris_enem)
        instance_create_layer(x, y, "Debris", o_debris_enem)
        instance_create_layer(x, y, "Debris", o_debris_enem)
    }
    image_speed = 1
    state = (0 << 0)
}
var hmove = (key_right - key_left)
var vmove = (key_down - key_up)
if (hmove != 0 || vmove != 0)
    msp = 5
else
    msp = 10
if (mouse_x > x)
    image_xscale = 1
else
    image_xscale = -1
if (state == (1 << 0))
{
    msp *= 20
    instance_create_layer(x, y, "Bullet", o_player_puff)
    flash = 10
}
hsp = (hmove * msp)
vsp = (vmove * msp)
if (hsp != 0 || vsp != 0)
{
    if (mouse_x < x)
    {
        if key_right
            sprite_index = s_player_backwards
        else
            sprite_index = s_player_walk
    }
    else if key_left
        sprite_index = s_player_backwards
    else
        sprite_index = s_player_walk
}
else
    sprite_index = s_player
if place_meeting((x + hsp), y, o_wall)
{
    while (!(place_meeting((x + sign(hsp)), y, o_wall)))
        x += sign(hsp)
    hsp = 0
}
if place_meeting(x, (y + vsp), o_wall)
{
    while (!(place_meeting(x, (y + sign(vsp)), o_wall)))
        y += sign(vsp)
    vsp = 0
}
if place_meeting((x + hsp), y, o_pedestal)
{
    while (!(place_meeting((x + sign(hsp)), y, o_pedestal)))
        x += sign(hsp)
    hsp = 0
}
if place_meeting(x, (y + vsp), o_pedestal)
{
    while (!(place_meeting(x, (y + sign(vsp)), o_pedestal)))
        y += sign(vsp)
    vsp = 0
}
x = clamp((x + hsp), 105, 1429)
y = clamp((y + vsp), 32, 1126)
window_set_cursor(cr_none)
