module la;

// load array

import ho;
import hst;
import std.stdio;
import hcb;
import he;
import std.string;
import stat;
import he;
import exutil;
import hchars;

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
        else if (handy_contains(s, l))
        {
            if (handy_excl_status(s, l) == handy_charstate.stringlike && state == hand_parse_state
                .collecting)
            {
                state = hand_parse_state.ignorant;
            }
            else if (handy_excl_status(s, l) == handy_charstate.stringlike && state == hand_parse_state
                .ignorant)
            {
                state = hand_parse_state.collecting;
            }
        }

        else if (l == ',' && state == hand_parse_state.collecting)
        {
            s.result = s.result ~ strip(bf);
            if (s.allow_cb)
                handy_run_callback(s, strip(bf));

            bf = "";
        }

        else if (l == ']' && state == hand_parse_state.collecting)
        {
            if (bf.length > 0)
            {
                s.result = s.result ~ strip(bf);
                if (s.allow_cb)
                    handy_run_callback(s, strip(bf));
            }
            bf = "";

            state = hand_parse_state.dead;

        }
        else if (l == ']' && state != hand_parse_state.collecting)
        {
            throw new HandyBadToken("]");
        }
        else if (l == '[' && state == hand_parse_state.dead)
        {
            throw new HandyNonMultipleException("Multiple array instances are not allowed.");
        }
        else
        {
            bf = bf ~ l;
        }

    }
}
