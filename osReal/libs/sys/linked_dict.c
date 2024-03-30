typedef struct
{
    char* key;
    void* value;
} linked_dict_t;

void linked_dict_add(linked_raw_t **list, void *value, char* key)
{
    linked_dict_t* d = (linked_dict_t*) malloc(sizeof(linked_dict_t));
    d->value = value;
    d->key = key;
    linked_add(list, (void *)d);
}

void* linked_dict_read_link(linked_raw_t *list, char* key)
{
    while (1)
    {
        if (list->next == 0)
        {
            return 0; // if given -1 as index, return last value. Otherwise, return 0 on null (OOB)
        }
        if(strcmp(((linked_dict_t*)(list->item))->key, key) == 0)
        {
            return list;
        }
        list = (linked_raw_t *) list->next;
    }
    return list;
}

#define linked_dict_read(list, key, type) ((type)(((linked_dict_t*)(((linked_raw_t*)linked_dict_read_link(list, key))->item))->value))
