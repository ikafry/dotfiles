/* 38番 若山稜太
   「」 */

#include<stdio.h>

int main()
{
	int i = 0;
	int count[26] = {0};
	char s, c, fn[100];
	FILE *fp;

	printf("ファイル名 = ");
	scanf("%s", fn);

	if((fp = fopen(fn, "r")) == NULL){
		printf("error!!\nThis file was deleted\n");
		return 1;
	}

	for(c='A';c<='Z';c++){
		while(fscanf(fp, "%c", &s) != EOF){
			if(s == c)
				count[i]++;
		}
		i++;
	}

	c = 'A';

	for(i=0;i<26;i++){
		printf("%c : %d\n", c, count[i]);
		c++;
	}

	fclose(fp);

	return 0;
}
