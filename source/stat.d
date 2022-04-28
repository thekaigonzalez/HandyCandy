module stat;

// Status

import he;
import exutil;
import ho;
import hchars;

handy_charstate handy_excl_status(handy_state e, char l) {
    if (!handy_contains(e, l)) throw new HandyNonExistantExclusionChar("That exclusion-based character does not exist.");
    return e.exclusion_bound_chars[l];
}