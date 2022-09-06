class Pelota {
  float posx;
  float posy;
  float vx;
  float vy;
  float iniciox;
  float inicioy;
  color Color;
  Pelota(float tempPosx, float tempPosy, color tempColor) {
    posx = tempPosx - width / 2;
    posy = tempPosy - height / 2;
    Color = tempColor;
    iniciox = 0;
    inicioy = 0;
  }
  void dibujar() {
    fill(Color);
    if (Color == -16711936) {
      verde.resize(diametro, diametro);
      image(verde, iniciox, inicioy);
    }
    if (Color == -16776961) {
      azul.resize(diametro, diametro);
      image(azul, iniciox, inicioy);
    }
    if (Color == -256) {
      amarillo.resize(diametro, diametro);
      image(amarillo, iniciox, inicioy);
    }
    if (Color == -65536) {
      rojo.resize(diametro, diametro);
      image(rojo, iniciox, inicioy);
    }
    if (Color == -65281) {
      morado.resize(diametro, diametro);
      image(morado, iniciox, inicioy);
    }
    if (Color == -10197916) {
      gris.resize(diametro, diametro);
      image(gris, iniciox, inicioy);
    }
  }

  void avanzar() {
    pushMatrix();
    translate(width / 2, height / 2 );
    vx = posx / 15;
    vy = posy / 15;
    iniciox += vx;
    inicioy += vy;
    dibujar();
    popMatrix();
  }
}
