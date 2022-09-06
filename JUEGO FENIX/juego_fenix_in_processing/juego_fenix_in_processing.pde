Nave nve = new Nave();
ArrayList<Bala> balas=new ArrayList<Bala>();
void setup() {
  size(500, 500);
  background(0);
  fill(255);
  stroke(255);
}

int x=250;
int y=480;

boolean derecha=false;
boolean izquierda = false;

void draw() {
  background(0);
  nve.avanzar();
  nve.dibujar();
  for (Bala x:balas) {
    x.avanzar();
    x.dibujar();
  }
}

void keyPressed() {
  nve.teclaApretada(keyCode);
}

void keyReleased() {
  nve.teclaSoltada(keyCode);
}
class Nave {
  int x=250;
  int y=480;

  boolean derecha=false;
  boolean izquierda = false;

  void dibujar() {
    ellipse(x, y, 10, 10);
  }
  void avanzar() {
    if (derecha) {
      x=x+3;
    } else if (izquierda) {
      x=x-3;
    }
  }
  void teclaApretada(int code) {
    if (code==39) {
      derecha=true;
    } else if (code==37) {
      izquierda=true;
    } else if (code==32) {
      Bala aux=new Bala(x, y);
      balas.add(aux);
    }
  }
  void teclaSoltada(int code) {
    if (keyCode==39) {
      derecha=false;
    } else if (keyCode==37) {
      izquierda=false;
    }
  }
}

class Bala {
  int x=0;
  int y=0;
  Bala(int px, int py) {
    x=px;
    y=py;
  }
  void dibujar() {
    ellipse(x, y, 5, 5);
  }
  void avanzar() {
    y=y-4;
  }
}
