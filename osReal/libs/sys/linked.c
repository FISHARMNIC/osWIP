typedef struct
{
    void *item;
    void *next;
} linked_raw_t;

typedef linked_raw_t *linked_t;

int linked_length(linked_raw_t *list)
{
    if (list == 0)
        return 0;

    int scan = 1;
    do
    {
        if (list->next == 0)
        {
            return scan;
        }
        list = (linked_raw_t *)list->next;
        scan++;
    } while (1);
    return scan;
}

linked_raw_t *linked_read_link(linked_raw_t *list, int index)
{
    int scan = 0;
    int fin = index == -1 ? __INT_MAX__ : index;
    while (scan < fin)
    {
        if (list->next == 0)
        {
            return index == -1 ? list : 0; // if given -1 as index, return last value. Otherwise, return 0 on null (OOB)
        }
        list = (linked_raw_t *) list->next;
        scan++;
    }
    return list;
}

#define linked_read(list, index, type) (type)(linked_read_link(list, index)->item)

void linked_add(linked_raw_t **list, void *item) // needs dp because we want to load the variable itself if it's null
{
    linked_raw_t *new = (linked_raw_t *)malloc(sizeof(linked_raw_t));
    *new = (linked_raw_t){
        .item = item,
        .next = 0
    };

    if (*list == 0) // if null pointer
    {
        *list = new;
    }
    else
    {
        linked_raw_t *ret = *list;
        while(ret->next != 0)
        {
            ret = ret->next;
        }
        ret->next = new;
    }
}

static void *remove_noFree(linked_raw_t **list, int index)
{
    if(index == 0)
    {
        void* copy = (void*) *list;
        *list = (*list)->next;
        return copy;
    } else {
        linked_raw_t *leftHand = linked_read_link(*list, index - 1);
        linked_raw_t *rightHand = (linked_raw_t *)((linked_raw_t *)leftHand->next)->next;
        void *save = leftHand->next;
        leftHand->next = rightHand;
        return save;
    }
}

void linked_remove(linked_raw_t **list, int index)
{
    free(remove_noFree(list, index));
}

void linked_moveToEnd(linked_raw_t **list, int index)
{
    linked_raw_t *copy = (linked_raw_t *) remove_noFree(list, index);
    linked_add(list,copy->item);
}