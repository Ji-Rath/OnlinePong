// Then, we actually perform the score event.
sound_play(ScoreSnd);

obj_sp_scoreboard.scored = argument0;
obj_sp_ball.x = room_width/2;
obj_sp_ball.y = room_height/2;
obj_sp_ball.hspeed = 0
obj_sp_ball.vspeed = 0
if(obj_sp_scoreboard.scored == 1) {
    obj_sp_scoreboard.player1score += 1;
} else {
    obj_sp_scoreboard.player2score += 1;
}
with(obj_sp_scoreboard)
{
alarm[0] = 2 * room_speed;
}

if obj_sp_scoreboard.player1score = (global.points)
{
        if obj_sp_scoreboard.player2score = 0
        {
            gj_trophy_get("5038")
        }
        show_message("You have WON the Pong Match!")
        gj_trophy_add("5034")
        room_goto(rm_menu)
}
if obj_sp_scoreboard.player2score = (global.points)
{
        show_message("You have LOST the Pong Match!")
        room_goto(rm_menu)
        gj_trophy_add("43962")
}
