// First, if we're the host we should notify the client so that it will run this code too.
if(instance_exists(obj_gameserver)) {
    write_ubyte(obj_gameserver.opponentSocket, 2);
    write_ubyte(obj_gameserver.opponentSocket, PLAYER_SCORE);
    write_ubyte(obj_gameserver.opponentSocket, argument0);
}

// Then, we actually perform the score event.
sound_play(ScoreSnd);

//Reset Ball Position and set score
obj_scoreboard.scored = argument0;
obj_ball.x = room_width/2;
obj_ball.y = room_height/2;
obj_ball.hspeed = 0
obj_ball.vspeed = 0
if(obj_scoreboard.scored == 1) {
    obj_scoreboard.player1score += 1;
} else {
    obj_scoreboard.player2score += 1;
}
with(obj_scoreboard)
{
    alarm[0] = 2 * room_speed;
}

//If the next point is the match point
if obj_scoreboard.player1score = (global.points - 1)
{
    instance_create(0,0,obj_matchpoint)
}
if obj_scoreboard.player2score = (global.points - 1)
{
    instance_create(0,0,obj_matchpoint)
}

//If Player 1 or Player 2 Wins
if obj_scoreboard.player1score = (global.points)
{
    if instance_exists(obj_gameserver)
    {
        if obj_scoreboard.player2score = 0
        {
            gj_trophy_get("5038")
        }
        show_message("You have WON the Pong Match!")
        gj_trophy_add("5034")
        room_goto(rm_menu)
        with(obj_gameserver)
        {
            instance_destroy();
        }
    }
    else
    {
        show_message("You have LOST the Pong Match!")
        room_goto(rm_menu)
        gj_trophy_add("43962")
        with(obj_client)
        {
            instance_destroy();
        }
    }
}
if obj_scoreboard.player2score = (global.points)
{
    if instance_exists(obj_client)
    {
        if obj_scoreboard.player1score = 0
        {
            gj_trophy_get("5038")
        }
        show_message("You have WON the Pong Match!")
        room_goto(rm_menu)
        gj_trophy_add("5034")
        with(obj_client)
        {
            instance_destroy();
        }
    }
    else
    {
        show_message("You have LOST the Pong Match!")
        room_goto(rm_menu)
        gj_trophy_add("43962")
        with(obj_gameserver)
        {
            instance_destroy();
        }
    }
}
