module la;

// load array

import ho;
import hst;
import std.stdio;
import hcb;
import std.string;

void handy_parse_result(handy_state s, string arr)
{
    auto state = hand_parse_state.idle;
    string bf = "";
    foreach (char l; arr)
    {
        if (l == '[' && state == hand_parse_state.idle)
        {
            state = hand_parse_state.collecting;
        }
        else if (l == ',' && state == hand_parse_state.collecting)
        {
            s.result = s.result ~ strip(bf);
            if (s.allow_cb)
                handy_run_callback(s, strip(bf));

            bf = "";
        }
        else
        {
            bf = bf ~ l;
        }

    }
}
