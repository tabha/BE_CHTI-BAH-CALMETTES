// programme pour calculer la somme des carres d'une suite d'entiers consécutifs
int calculk(short * tabSig,int k,short * tabCosSin);
int module(short * tabSig, int k);

extern short TabSig ;

int k = 0;
int tab[64];



int main(void){
	for (k=0 ; k<64; k++){
			tab[k]=module(&TabSig,k);
	}

	while (1) {}
}
