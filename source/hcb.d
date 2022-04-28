module hcb;

// Handy callback

import ho;

void handy_set_callback(handy_state s, void function(string) cb)
{
    s.cb = cb;
}

void handy_run_callback(handy_state s, string arg)
{
    s.cb(arg);
}
