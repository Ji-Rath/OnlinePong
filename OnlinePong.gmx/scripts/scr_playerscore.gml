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

//If the next point is the match point
if obj_sp_scoreboard.player1score = (global.points - 1)
{
    instance_create(0,0,obj_matchpoint)
}
if obj_sp_scoreboard.player2score = (global.points - 1)
{
    instance_create(0,0,obj_matchpoint)
}

if obj_sp_scoreboard.player1score = (global.points)
{
        if obj_sp_scoreboard.player2score = 0
        {
            if gj_user_isloggedin()
            {
                gj_trophy_add("5038")
                obj_gamejolt_control.request[2] = gj_trophy_get_id("5038"); // Request for loading a trophy
            }        
        }
        if gj_user_isloggedin()
        {
            gj_trophy_add("5034")
            obj_gamejolt_control.request[2] = gj_trophy_get_id("5034"); // Request for loading a trophy
        }
        room_goto(rm_menu)
        show_message("You have WON the Pong Match!")
}
if obj_sp_scoreboard.player2score = (global.points)
{
        if gj_user_isloggedin()
        {
            gj_trophy_add("43962")
            obj_gamejolt_control.request[2] = gj_trophy_get_id("43962"); // Request for loading a trophy
        }
        room_goto(rm_menu)
        show_message("You have LOST the Pong Match!")
}
