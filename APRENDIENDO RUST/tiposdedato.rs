//variables  por defecto inmutables 
//mutable
//inmutable
//tipo de  dato
//constante
//sobreando de variables 

fn main() {
    let mut x=10;
    println!("{}", x);
    x=4_0;
    println!("{}", x);
    
    //const MI_CONSTANTE:u32=10_000;
    //println!("{}", MI_CONSTANTE);
    
    //sombreado de  variables: cambiar  el tipo de  dato 
    let x="Hola mundo";
    println!("{}", x);
    let x=x.len();
    println!("{}",x);
    //la variables es mutable  pero no se puede  mutar a  otro tipo de  dato
    //let mut x= "hola mundo"; 
    //println!({},x);
    //x=x.len();
}