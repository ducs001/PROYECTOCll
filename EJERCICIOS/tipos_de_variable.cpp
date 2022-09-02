/*Variable de referencia:Es un alias, es decir, otro nombre para una variable ya existente. 
Una vez que se inicializa una referencia con una variable, se puede usar el nombre
de la variable o el nombre de la referencia para hacer referencia a la variable*/

#include<iostream>
using namespace std; 

int main(){	 
	//variables normales  
	int a;
	float b;
	//variables  de  referencia
	int & aa=a;
	float &bb=b;
	//variables de puntero
	int *ptr=&a;
	float *ptr1=&b; 
	
	cout<<"valor de a: "<<a;
	cout<<"valor de b: "<<b; 
	
	cout<<"referencia de a: "<<aa;
	cout<<"referencia de  b: "<<bb;
}
