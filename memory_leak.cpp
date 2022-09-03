#include <iostream>
using namespace std; 
class Rectangle{
	private: 
		int length; 
		int breadth;
	public: 
		Rectangle(){
			cout<<"Hola, soy el constructor"<<endl;
		}
		void fun(){
			//reservamos espacio de memoria para p
			//p termina  cuando la salga de la funcion (vida util )
			Rectangle *p = new Rectangle();//reseramos memoria de manera explicita
		}
		//liberamos memoria de manera  explicita
		~Rectangle(){
				cout<<"Hola;soy  el destructor"<<endl;
			}
};
int main(){
	int i=0;
	//infinite  loop
	while(i<5){
		Rectangle r1;
		r1.fun();
		i++;	
	}
	return 0;  
}
