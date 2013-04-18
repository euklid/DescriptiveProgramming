#include <stdio.h>
#include <string.h>
#include <time.h>

typedef struct {
	int first;
	int second;
	enum {plus, minus} op;
} task;

void printTask(task t) {
	char operator[4];
	switch(t.op) {
		case plus:
			strcpy(operator," + ") ; break;
		case minus:
			strcpy(operator," - "); break; 
	}
	printf("%d%s%d = ____\n",t.first, operator, t.second);
}

int main()
{
	int plusTasks=10, minusTasks=10;
	enum {plus, minus} tasktype;
	task tasks;
	time_t seed;
	srand((unsigned int) time(&seed));
	while(plusTasks+minusTasks>0)
	{
		tasktype = rand()%2;
		if(tasktype==plus && plusTasks>0) {
			tasks.first=rand()%100; /*0 to 99 */
			tasks.second=rand()%(100-tasks.first); /*0+(100-first-1)+first=99 */
			tasks.op=tasktype;
			plusTasks--;
			printTask(tasks);
		} else if(tasktype == minus && minusTasks>0) 
		{
			tasks.first = rand()%100; /* 0 to 99*/
			tasks.second = rand()%(tasks.first+1);/*0 to first+1-1  =  0 to first */
			tasks.op=tasktype;
			minusTasks--;
			printTask(tasks);
		}
	}
	return 0;
}
