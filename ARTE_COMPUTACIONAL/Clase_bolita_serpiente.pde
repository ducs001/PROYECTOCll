class Serpiente {
  color Color;
  float posx;
  float posy;
  float vx;
  float vy;
  int index;
  float vx_;
  boolean auxvuelta;
  boolean vuelta;
  float tiempo;
  boolean mov;
  Serpiente(float tempPosx, float tempPosy, color tempColor) {
    posx = tempPosx;
    posy = tempPosy;
    Color = tempColor;
    vx = 0.0000001;
    vy = 0;
    index = 0;
    tiempo = 0;
    mov = false;
    vuelta = auxvuelta = false;
    vx_ = 0.8;
  }
  void dibujar() {
    fill(Color);
    if (Color == -16711936) {
      verde.resize(diametro, diametro);
      image(verde, posx, posy);
    }
    if (Color == -16776961) {
      azul.resize(diametro, diametro);
      image(azul, posx, posy);
    }
    if (Color == -256) {
      amarillo.resize(diametro, diametro);
      image(amarillo, posx, posy);
    }
    if (Color == -65536) {
      rojo.resize(diametro, diametro);
      image(rojo, posx, posy);
    }
    if (Color == -65281) {
      morado.resize(diametro, diametro);
      image(morado, posx, posy);
    }
    if (Color == -10197916) {
      gris.resize(diametro, diametro);
      image(gris, posx, posy);
    }
  }
  void avanzar() {
    pushMatrix();
    translate(width / 2, height / 2);
    posx += vx;
    posy += vy;
    //Trayectoria
    if (posx > width / 2 + diametro + 10  && index != serpientes.length-1) {
      posy = -height / 2 + diametro * 2 + 15;
      vx = -0.0000001;
      vuelta = true;
    }
    if (posx < -width / 2 - diametro -10 && vuelta == true && index != serpientes.length-1 ) {
      posy = -height / 2 + (diametro*13);
      vx = abs(vx);
    }

    dibujar();
    popMatrix();
  }
  void a() {
    pushMatrix();
    translate(width / 2, height / 2);
    //Bolita indice length - 1
    if (mov) {
      vx = vx_;
      if (index == serpientes.length - 1 ) {
        if (posx > width / 2 + 60) {
          vx_ = -0.5;
          posy = -height / 2 + diametro * 2 + 15;
          auxvuelta = true;
        }
        if (posx < -width / 2 -60 && auxvuelta == true ) {
          posy = -height / 2 + (diametro*13);
          vx_ = 0.5;
        }
      }
      posx += vx;
      posy += vy;
      dibujar();
    }
    popMatrix();
  }
}
