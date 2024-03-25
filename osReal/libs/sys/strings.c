void itoa(int32_t number, char* buff)
{
    if(number < 0)
    {
        number = -number;
        *(buff++) = '-';
    }

    int len = numLen(number) - 1;
    buff += len + 1;
    *(buff--) = 0;

    if (number == 0) {
        *buff = '0';
    }
    else
    {
        while (number >= 1)
        {
            *buff = (char)(number % 10) + 48;
            number /= 10;
            buff--;
        }
    }
}