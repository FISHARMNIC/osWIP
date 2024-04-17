int __DATA_SEGMENT_OFFSET__ = 0;

void main();

void _start(int data_segment)
{
    __DATA_SEGMENT_OFFSET__ = data_segment;
    main();
}