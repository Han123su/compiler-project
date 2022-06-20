#include<bits/stdc++.h>
using namespace std;
void perm(char[],int,int); 
int main()
{
	int m;  
	printf("輸入共有幾個字元排序:");
	scanf("%d",&m);
	
	int i=0,n=strlen(list)-1; 
	printf("輸入字元(不須空格):");
	for(int k=-1;k<=m;k++)
	{
		scanf("%c",&list[k]);
	}
	
	perm(list,i,n); 
}

void perm(char list[],int i,int n)    //遞迴   
{     
    if(i==n)
    {
    	for(int j=0;j<=n;j++)
    		printf("%c",list[j]);
    	printf("\n");
	}
	else
    {
    	for(int j=i;j<=n;j++)
		{
			swap(list[i],list[j]);
			perm(list,i+1,n);
			swap(list[i],list[j]);	
		}   
	}
}
