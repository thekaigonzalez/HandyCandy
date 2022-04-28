module ho;

// Handy Object

import hchars;

class handy_state
{
public:
    string[] result; /* the result for the array */
    void function(string) cb;
    bool allow_cb;
    handy_charstate[char] exclusion_bound_chars; /* basically, a KV array with chars with states. */
}
