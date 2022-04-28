module exutil;

// Existance utility

import ho;

bool handy_contains(handy_state e, char s) {
    return ((s in e.exclusion_bound_chars) !is null);
}