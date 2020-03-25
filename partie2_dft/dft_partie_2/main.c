// programme pour calculer la somme des carres d'une suite d'entiers consécutifs
int calculk(short * tabSig,int k,short * tabCosSin);
int k = 0;
int tab[64];
extern short TabSin ;
extern short TabCos ;
extern short TabSig ;

int main(void){
	for (k=0 ; k<64; k++){
			tab[k]=calculk(&TabSig,k,&TabCos);
	}

	while (1) {}
}
