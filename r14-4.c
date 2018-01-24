/* 38番 若山稜太
   「」 */

#include<stdio.h>

int num(int, char*);

int main(int argc, char *argv[])
{
	int num1, num2, sum;
	int i, j, keta[2];
	char arg1[100], arg2[100];
	argv[3][0] = 0;

	printf("%s %s\n", argv[1], argv[2]);

	if(argc != 3){
		printf("使用方法：./r14-4 自然数 自然数\n");
		return 1;
	}

	for(i=1;i<=2;i++){
		j = 0;
		while(argv[i][j] != argv[i+1][0]){
			keta[i-1]++;
			j++;
			printf("+");
		}
	}

	for(j=0;j<keta[j];j++){
		arg1[j] = argv[1][j];
		arg2[j] = argv[2][j];
	}

	num1 = num(keta[0], arg1);
	num2 = num(keta[1], arg2);

	sum = num1 + num2;

	return 0;
}

int num(int nketa, char *numc)
{
	int i, number;
	int numi[nketa];

	for(i=0;i<nketa;i++){
		numi[i] = numc[i] - '0';
	}

	number = numi[0];

	for(i=1;i < nketa;i++){
		number = number * 10 + numi[i];
	}

	return number;
}
