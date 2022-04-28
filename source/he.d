module he;

// Handy Exceptions

class HandyBadToken : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @safe
    {
        super("Unexpected token: `" ~ msg ~ "'", file, line, nextInChain);
    }
}

class HandyNonMultipleException : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @nogc @safe
    {
        super(msg, file, line, nextInChain);
    }
}

class HandyNonExistantExclusionChar : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @nogc @safe
    {
        super(msg, file, line, nextInChain);
    }
}
