randomise();

health_points = 100;
max_health_points = 100;

path = path_add();

target = obj_player;

state = "idle";

detection_range = 92;
detection_timer = irandom_range(5, 10);
detection_timer_reset = detection_timer;
		
nothing_here_timer = 120;
nothing_here_timer_reset = nothing_here_timer;

walksp = random_range(0.75,1);

last_frame_pos = [x,y];

start_pos = [x, y]; // Enemy's own start position
target_pos = [x, y]; // Where it moves toward
target_obj_pos = [target.x, target.y]; // Cached player position

ai_refresh = 10;

draw_xscale = choose(-1,1);
draw_angle = 0;

attack_timer = 15;
attack_timer_reset = attack_timer;

previous_state = "idle";

// debugging
detection_angle = 0;

alarm[0] = ai_refresh;

global.entity_count++;