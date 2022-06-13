int main()
{
	int N=5;
	int i,j,k;
		
		for(k=1;k<=N;k++) 
		{
			for(i=N-k;i>=1;i--)  
				printf("_");
				
			for(j=1;j<=k;j++)
				printf("+");
			printf("\n");		
		} 
	return 0;
} 
