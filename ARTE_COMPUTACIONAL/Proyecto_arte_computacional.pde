import processing.sound.*;

import processing.sound.*;
SoundFile sonido;
//Lista serpientes
Serpiente[] serpientes = new Serpiente[0];
Serpiente[] ser_aux;
Serpiente[] ser_aux2;
Serpiente[] elim_serp = new Serpiente[0];

//Lista pelotas
ArrayList<Pelota> balas = new ArrayList<Pelota>();
ArrayList<Pelota> pelotas_a_eliminar = new ArrayList<Pelota>();
color[] colores = new color[6];
//Imagenes
PImage fondo, verde, amarillo, azul, rojo, morado, gris, sapo1, sapo2;
PImage calavera, cal1, cal2, cal3, cal4, cal5, cal6;
//Fuente
PFont fuente;

color colorRandom;
color colord = 0;
int n_de_pelotas = 5;
int diametro = 46;
int puntuacion = 0;
int punt_maxima = 80;
int tiempo = 0;
float rotar = 0;

boolean iniciar = false;
boolean game_over = false;

void setup() {
  noStroke();
  size(1000, 650);
  background(255);
  
  sonido = new SoundFile(this,"01.mp3");
  sonido.play();
  
  colores[0] = color(255, 0, 0 );
  colores[1] = color(0, 255, 0);
  colores[2] = color(0, 0, 255);
  colores[3] = color(255, 255, 0);
  colores[4] = color(255, 255, 0);
  colores[5] = color(0, 255, 0);

  colorRandom = colores[(color)random(0, colores.length)];

  for (int i = 0; i < n_de_pelotas; i++) {
    Serpiente aux = new Serpiente(-(width / 2) - (diametro * i), -height/ 2 + diametro + 5, colores[(color)random(0, colores.length)]);
    serpientes = (Serpiente[]) append(serpientes, aux);
  }
  //Imagenes
  imageMode(CENTER);
  //Colores
  verde = loadImage("verde.png");
  azul = loadImage("azul.png");
  amarillo = loadImage("amarillo.png");
  rojo = loadImage("rojo.png");
  morado = loadImage("morado.png");
  gris = loadImage("gris.png");
  
  //Calavera
  calavera = loadImage("calavera.png");
  cal1 = loadImage("cfase1.png");
  cal2 = loadImage("cfase2.png");
  cal3 = loadImage("cfase3.png");
  cal4 = loadImage("cfase4.png");
  cal5 = loadImage("cfase5.png");
  cal6 = loadImage("cfase6.png");


  fondo = loadImage("fondo.jpg");
  sapo1 = loadImage("sapo1.png");
  sapo2 = loadImage("sapo2.png");
  //Musica
  //Fuente
  fuente = loadFont("fuente.vlw");
}

void draw() {
  
  if (iniciar == true) {
    fondo.resize(width, height);
    image(fondo, width/2, height/2);
    personaje();
    destino();
    for (Pelota x : balas) {
      x.avanzar();
    }
    for (int i = 0; i < serpientes.length; i ++) {
      serpientes[i].avanzar();
    }
    serpientes[serpientes.length - 1].a();



    indice_();
    barra_de_puntos();
    puntos_y_generacion();
    colision_Proyectil_Serpiente();
    colision_serpiente_serpiente();
    
    colision_serpiente_destino();
    juego_terminado();
    eliminar();
  }
}
void mousePressed() {
  iniciar = true;
  if (mousePressed) {
    Pelota aux = new Pelota(mouseX, mouseY, colorRandom);
    balas.add(aux);
    colorRandom = colores[(color)random(0, 6)];
  }
}


void personaje() {
  pushMatrix();
  translate(width / 2, height / 2);
  fill(colorRandom);
  rotar= atan2(mouseY-height/2, mouseX-width/2 );
  rotate(rotar);
  ellipse(-30, 0, diametro, diametro );
  image(sapo1, 0, 0);
  sapo1.resize(diametro*4, diametro*4);
  if (colorRandom == -16711936) {
    verde.resize(diametro, diametro);
    image(verde, 40, 0);
  }
  if (colorRandom == -16776961) {
    azul.resize(diametro, diametro);
    image(azul, 40, 0);
  }
  if (colorRandom == -256) {
    amarillo.resize(diametro, diametro);
    image(amarillo, 40, 0);
  }
  if (colorRandom ==  -65536) {
    rojo.resize(diametro, diametro);
    image(rojo, 40, 0);
  }
  if (colorRandom == -65281) {
    morado.resize(diametro, diametro);
    image(morado, 40, 0);
  }if (colorRandom == -10197916) {
    gris.resize(diametro, diametro);
    image(gris, 40, 0);
  }

  sapo2.resize(diametro*4, diametro*4);
  image(sapo2, 0, 0);

  popMatrix();
}

void destino() {
  pushMatrix();
  translate(width / 2, height / 2);
  calavera.resize(diametro*3, diametro*3);
  image(calavera, width / 2 - 65, -height/2 + (diametro*13));
  float dis = sqrt(pow((width / 2 - 65) - serpientes[1].posx, 2) + pow(-height/2 + (diametro*13) - serpientes[1].posy, 2));
  
  if(dis > 900  && serpientes[1].posy == -height/2 + (diametro*13)){
    cal2.resize(diametro*3, diametro*3);
    image(cal2, width / 2 - 65, -height/2 + (diametro*13));
  }else{
    if(dis > 600 && serpientes[1].posy == -height/2 + (diametro*13)){
      cal3.resize(diametro*3, diametro*3);
      image(cal3, width / 2 - 65, -height/2 + (diametro*13));
    }else{
      if(dis > 300 && serpientes[1].posy == -height/2 + (diametro*13)){
        cal4.resize(diametro*3, diametro*3);
        image(cal4, width / 2 - 65, -height/2 + (diametro*13));
      }else{
        if(dis > 100 && serpientes[1].posy == -height/2 + (diametro*13)){
          cal5.resize(diametro*3, diametro*3);
          image(cal5, width / 2 - 65, -height/2 + (diametro*13));
        }else{
          if(dis > 10 && serpientes[1].posy == -height/2 + (diametro*13)){
            cal6.resize(diametro*3, diametro*3);
            image(cal6, width / 2 - 65, -height/2 + (diametro*13));
          }else{
            cal1.resize(diametro*3, diametro*3);
            image(cal1, width / 2 - 65, -height/2 + (diametro*13));
          }
        }
      }
    }
  
  }
  fill(colord);

  if (dis < 5) {
    for (int i = 2; i < serpientes.length - 1; i++) {
      serpientes[i]. vy = random(-10, 10);
      serpientes[i]. vx = random(-10, 10);
    }
    game_over = true;
  }
  fill(colord);
  

  popMatrix();
}

void eliminar() {
  for (Pelota i : balas) {
    if (i.iniciox > width / 2 || i.inicioy > height / 2  || i.iniciox < -(width / 2)  || i.inicioy < -(height / 2) ) {
      pelotas_a_eliminar.add(i);
    }
  }
  balas.removeAll(pelotas_a_eliminar);
}

void colision_Proyectil_Serpiente() {
  for (Pelota b : balas) {
    for (Serpiente s : serpientes) {
      float distancia = sqrt(pow(b.iniciox - s.posx, 2) + pow(b.inicioy - s.posy, 2));

      if (s.index == serpientes.length - 1)continue;
      if (distancia < diametro ) {
        if (s.vx > 0) {
          if (b.iniciox >= s.posx ) {
            Serpiente nuevo = new Serpiente(s.posx, s.posy, b.Color);
            nuevo.vx = 0.00001;
            serpientes = (Serpiente[]) splice(serpientes, nuevo, s.index);
          }
          if (b.iniciox < s.posx ) {
            Serpiente nuevo = new Serpiente(s.posx, s.posy, b.Color);
            nuevo.vx = 0.00001;
            serpientes = (Serpiente[]) splice(serpientes, nuevo, s.index + 1);
          }
        } else {
          if (b.iniciox <= s.posx ) {
            Serpiente nuevo = new Serpiente(s.posx, s.posy, b.Color);
            nuevo.vx = -0.00001;
            nuevo.vuelta = true;
            serpientes = (Serpiente[]) splice(serpientes, nuevo, s.index);
          }
          if (b.iniciox > s.posx ) {
            Serpiente nuevo = new Serpiente(s.posx, s.posy, b.Color);
            nuevo.vx = -0.00001;
            nuevo.vuelta = true;
            serpientes = (Serpiente[]) splice(serpientes, nuevo, s.index+1);
          }
        }

        pelotas_a_eliminar.add(b);
        break;
      }
    }
  }
}
void colision_serpiente_serpiente() {
  int a;
  int b;
  int auxa;
  int auxb;
  int derecha = 0;
  int izquierda = 0;
  serpientes[0]. posy = -height /2 - (diametro * 2);
  serpientes[0]. vx = 0;
  serpientes[serpientes.length - 1].Color = 100;
  for (Serpiente ser : serpientes) {
    if (ser.posy > -height / 2 - diametro) {
      a = auxa = ser.index;
      b = auxb = ser.index - 1;
      if (b == -1 || auxb == -1) {
        b = auxb = 0;
        a = auxa = 1;
      }
      float dis = sqrt(pow(serpientes[a].posx - serpientes[b].posx, 2) + pow(serpientes[a].posy - serpientes[b].posy, 2));
      if (serpientes[a].vx > 0) {
        if (dis < diametro) {
          serpientes[b].posx += 7;
        } else {
          serpientes[b].posx += abs(0.0001);
        }

        if (dis < diametro/2) {
          while (serpientes[b].Color == serpientes[a].Color && a < serpientes.length-1  ) {
            izquierda += 1;
            a += 1;
            b += 1;
          }
          while (serpientes[auxb].Color == serpientes[auxa].Color && auxb > 0 ) {
            derecha += 1;
            auxa -= 1;
            auxb -= 1;
          }
        }
      } else {
        if (serpientes[a].vx < 0 ) {
          if (dis < diametro ) {

            serpientes[b].posx -= 7;
          } else {
            serpientes[b].posx -= 0.0001;
          }
          if (dis < diametro /2) {
            while (serpientes[b].Color == serpientes[a].Color && a < serpientes.length -1 ) {
              izquierda += 1;
              a += 1;
              b += 1;
            }
            while (serpientes[auxb].Color == serpientes[auxa].Color && auxb > 0 ) {
              derecha += 1;
              auxa -= 1;
              auxb -= 1;
            }
          }
        }
      }
      if (derecha + izquierda >= 3 ) {
        puntuacion += derecha + izquierda;
        ser_aux = new Serpiente[0];
        ser_aux2 = new Serpiente[0];
        for (int k = ser.index + izquierda; k < serpientes.length; k ++) {

          ser_aux = (Serpiente[]) append(ser_aux, serpientes[k]);
        }
        for (int l = 0; l < ser.index - derecha; l ++) {

          ser_aux2 = (Serpiente[]) append(ser_aux2, serpientes[l]);
        }
        serpientes = (Serpiente[])concat(ser_aux2, ser_aux);
        break;
      }
      derecha = 0;
      izquierda = 0;
    }
  }
}
void colision_serpiente_destino() {
  float d = sqrt(pow(200 - serpientes[1].posx, 2) + pow(-height/2 + (diametro*10) - serpientes[1].posy, 2));
  if (d < 1)game_over = true;
}
void indice_() {
  for (int i = serpientes.length-1; i > 0; i--) {
    serpientes[i].index = i;
  }
}
void barra_de_puntos() {
  int trayectoria = 0;
  pushMatrix();
  rectMode(CENTER);
  fill(0, 120);
  scale(3);
  //Barra
  rect(165, 60, 100, 5);
  //Bandera1
  bandera(165, -50);
  //Bandera2
  bandera(165, -18);
  //Bandera3
  bandera(165, 18);
  //Bandera4
  bandera(165, 50);
  //Personaje
  fill(255, 255, 0);
  trayectoria = puntuacion * 100 / punt_maxima;
  if (trayectoria > 100) {
    trayectoria = 100;
  }
  ellipse(115 + trayectoria, 60, 5, 5);
  popMatrix();
}
void bandera(int x, int punt) {
  fill(0, 120);
  rect(x + punt, 58, 2, 10);
  fill(255, 0, 0,120);
  triangle(x + punt-1, 52, x + punt-1, 58, x + punt + 4, 55);
}
void puntos_y_generacion() {
  tiempo += 1;
  if (puntuacion < punt_maxima && game_over == false) {
    if (tiempo % 35 == 0) {
      Serpiente se = new Serpiente(serpientes[serpientes.length - 1].posx, -height/ 2 + diametro + 5, colores[(color)random(0, colores.length)]);
      serpientes = (Serpiente[]) splice(serpientes, se, serpientes.length-1);
    }
  } else {
    serpientes[serpientes.length - 1].mov = true;
  }

  if (puntuacion > punt_maxima / 3) {
    colores[4] = color(255, 0, 255);
  }
  if (puntuacion > 2 *punt_maxima / 3) {
    colores[5] = color(100);
  }
}

void juego_terminado() {
  if (serpientes.length == 2) {
    serpientes[1].vx = 0;
    serpientes[1].posy = 100;
    fill(255, 255, 0);
    textAlign(CENTER);
    textFont(fuente);
    textSize(100);
    text("VICTORIA", width / 2, height / 2 - 200);
    textSize(25);
    text("Puntuación: " + puntuacion, width / 2, height / 2 - 100);
  }
  if (game_over) {
    serpientes[1].vx = -5;
    fill(255, 255, 0);
    textAlign(CENTER);   
    textFont(fuente);
    textSize(100);
    text("JUEGO TERMINADO", width / 2, height / 2 - 200);
    textSize(25);
    text("Puntuación: " + puntuacion, width / 2, height / 2 - 100);
  }
}
