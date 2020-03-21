// programme pour calculer la somme des carres d'une suite d'entiers consécutifs
	
void angle(int i, int * j);
int min= 0x7fffffff;
int max=0;
int j =0;
int i = 0 ;
	

int main(void){

	for(i=0;i<64;i++){
		angle(i, &j);
		if(max<j)
			max=j;
		if(min>j)
			min=j;
	}
	while (1) {}
}
