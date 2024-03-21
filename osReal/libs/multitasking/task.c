// todo, make dynamic and use malloc

volatile func_t *allTasks[8] = {0, 0, 0, 0, 0, 0, 0, 0};
static volatile int currentTask;
static volatile int numberOfTasks;

void tasks_init(func_t *kernel)
{
    allTasks[0] = kernel;
    currentTask = 0;
    numberOfTasks = 1;
}

void task_create(func_t *func)
{
    if (numberOfTasks <= 7)
    {
        allTasks[numberOfTasks] = func;
        numberOfTasks++;
    }
    else
    {
        int index = 0;
        while (index < numberOfTasks)
        {
            if (allTasks[index] == 0)
            {
                allTasks[index] = func;
                return
            }
            index++
        }
    }
}

void task_destroy(func_t *func)
{
    int index = 0;
    while (index < numberOfTasks)
    {
        if (allTasks[index] == func)
        {
            allTasks[index] = 0;
            return
        }
        index++
    }
}

static void onTimerInt()
{
    currentTask++;
}

void task_beginMulti()
{
    currentTask = 0;
    while(1)
    {
        if(allTasks[currentTask] != 0)
        {
            allTasks[currentTask]();
        }
    }
}