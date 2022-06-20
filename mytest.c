#include<stdio.h>
#include<stdlib.h>
int i=0,k,s[99999];
int reverse(int k)
{
	if(k>0)
	{
    	printf("%d ",s[i]);
    	i--;
    	reverse(k-1);
	}
}
int array(int k)
{
    if(k>0)
    {
    	i++;
    	scanf("%d",&s[i]);
    	array(k-1);
	}
}

int main()
{
	scanf("%d",&k);
    array(k);
	reverse(k);
}
