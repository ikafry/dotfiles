/************************************************************
 **                     暗号生成と解読                     **
 ** 生成時の出力：シード値と暗号化後の入力値の両方を含む値 **
 **         入力：暗号化したいchar型の文字列               **
 ************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main()
{
	int mode;
	time_t timer;

	printf("<Select Mode>\n");
	printf("Generate Code : 0\n");
	printf("Decord Code : 1\n\n");
	printf("(0 or 1) ");
	scanf("%d", &mode);

	switch (mode) {
		case 0:   //For Generate
			srand(time(&timer));



		break;
	}

}

