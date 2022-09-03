//override: sobreescribir metodos
#include <iostream>
using namespace std; 

class Base{
	public: 
		virtual void imprimir()const{
			cout<<"Metodo de la  clase  base";
		}
};

class Derivada : public Base{
	public:
		void imprimir()const override {
			cout<<"Sobreescriviendo el metodo imprimir de la class  Base";
		}
};

int main(){
	Derivada d1;
	d1.imprimir();
}
