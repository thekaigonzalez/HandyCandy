module hcdu;

// Handy array char util

import ho;

import hchars;

void handy_add_excl_char(handy_state s, char m, handy_charstate C) {
    s.exclusion_bound_chars[m] = C;
}