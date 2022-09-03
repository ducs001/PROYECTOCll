//explicito  e implicito en funciones  
#include <iostream>
using namespace std; 
class A{
	int x;
	public: 
		A(){
			x=0;
			cout<<"create A:0"<<endl;
		}
		A(int a){
			x=a;
			cout<<"Create A "<<x<<endl; 
		}
		~A(){
			cout<<"Delete A "<<x<<endl;
		}
};
int main(){
	A a1;//el compilador  llama a A(implicito)
	A *a2=new A(10);//explicitamente llamamos a A
	delete a2;//liberacion explicita
}

