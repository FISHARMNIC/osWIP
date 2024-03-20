#pragma once
int numLen(unsigned x)
{
    // this is either a fun exercise in optimization
    // or it's extremely premature optimization.
    if (x >= 100000)
    {
        if (x >= 10000000)
        {
            if (x >= 1000000000)
                return 10;
            if (x >= 100000000)
                return 9;
            return 8;
        }
        if (x >= 1000000)
            return 7;
        return 6;
    }
    else
    {
        if (x >= 1000)
        {
            if (x >= 10000)
                return 5;
            return 4;
        }
        else
        {
            if (x >= 100)
                return 3;
            if (x >= 10)
                return 2;
            return 1;
        }
    }
}
