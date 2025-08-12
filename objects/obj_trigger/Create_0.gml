/// Default values (can be overridden in Room Creation Code)
trigger_function = function () { }; // empty default function

target_obj      = obj_player; // who can activate it
trigger_repeat  = false;      // can trigger more than once?
trigger_done    = false;      // internal tracking

timed_trigger   = false;      // trigger after a delay?
trigger_timer   = 60;         // delay in steps

end_on_key      = false;      // require a key press to trigger?
end_on_pressed  = vk_space;   // which key?

end_function = function () { };