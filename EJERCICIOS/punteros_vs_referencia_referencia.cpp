#include <iostream>
using namespace std;

int suma(int &,int &);

int main(){
	int a=4; 
	int b=5;
	cout<<"suma: "<<suma(a,b);
	return  0; 
}
int suma(int &x,int &y){//int & x=a//int &y=b;
	return x+y; 
}
