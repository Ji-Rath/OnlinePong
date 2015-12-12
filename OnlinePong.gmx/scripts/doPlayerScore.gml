// First, if we're the host we should notify the client so that it will run this code too.
if(instance_exists(obj_gameserver)) {
    write_ubyte(obj_gameserver.opponentSocket, 2);
    write_ubyte(obj_gameserver.opponentSocket, PLAYER_SCORE);
    write_ubyte(obj_gameserver.opponentSocket, argument0);
    with (obj_scoreboard)
    {
    alarm[1] = 10
    }
}
else
{
    with (obj_scoreboard)
    {
    alarm[1] = 10
    }
}

// Then, we actually perform the score event.
sound_play(ScoreSnd);
image_blend = c_white

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


