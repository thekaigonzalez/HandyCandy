import handycandy;
import std.stdio;

void mycallback(string str)
{
    writeln(str);
}

void main()
{
    auto ms = handy_newstate();

    /* You can change things before and after you parse, if you allow callbacks, you need to create a callback function or else you'll get SEGFAULT. */
    handy_set_callback(ms, &mycallback);

    handy_allow_callback(ms);

    handy_parse_result(ms, "[1,2,3]");

    writeln(ms.result);
}
