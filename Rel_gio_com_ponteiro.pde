void setup(){
  size(800,600);
}

float centroX = 200;
float centroY = 200;
float anguloMinuto = -1.5;
float anguloHora = -1.5;
float raio = 150;
float larguraPonteiro = raio/15;
float velocidadeAngularMinuto = 0.0027;
float velocidadeAngularHora = velocidadeAngularMinuto/60;
void draw(){
  background(255,255,255);
  
  fill(255,0,255);
  circle(centroX,centroY,400);
  
  anguloMinuto += velocidadeAngularMinuto;
  fill(0,0,0);
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto + Math.PI/2)),centroY+(larguraPonteiro)*(float)(Math.sin(anguloMinuto + Math.PI/2)),//Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto - Math.PI/2)),centroX+(larguraPonteiro)*(float)(Math.sin(anguloMinuto - Math.PI/2)),//Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloMinuto)),centroX+raio*(float)(Math.sin(anguloMinuto)));//Coordenadas X e Y da ponta do ponteiro
    
  anguloHora += velocidadeAngularHora;
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora + Math.PI/2)),centroY+(larguraPonteiro)*(float)(Math.sin(anguloHora + Math.PI/2)),
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora - Math.PI/2)),centroX+(larguraPonteiro)*(float)(Math.sin(anguloHora - Math.PI/2)),
    centroX+(raio/1.25)*(float)(Math.cos(anguloHora)),centroX+(raio/1.25)*(float)(Math.sin(anguloHora)));
}
