void setup(){
  size(800,600);
}

float centroX = 200;
float centroY = 200;
float anguloMinuto = -1.5;
float anguloHora = -1.5;
float anguloSegundo = -1.5;
float raio = 150;
float larguraPonteiro = raio/15;
float velocidadeAngularSegundo = 0.00174532925;
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = velocidadeAngularMinuto/60;
int offset_y =360;
void draw(){
  background(255,255,255);
  translate(200,100);
  
  //Aba superior
  beginShape();
  vertex(30, 80);
  vertex(100, -50);
  vertex(300, -50);
  vertex(370, 80);
  vertex(30, 80);
  endShape();
  
  
  //Aba inferior
  beginShape();
  vertex(30, -50 + offset_y);
  vertex(100, 80 + offset_y);
  vertex(300, 80 + offset_y);
  vertex(370, -50 + offset_y);
  vertex(100, -50 + offset_y);
  endShape();
  
  
  //Borda de fundo do relogio
  fill(255,0,100);
  circle(centroX,centroY,420);
  
  //Circulo de fundo do relogio
  fill(255,0,255);
  circle(centroX,centroY,400);
  
  anguloSegundo += velocidadeAngularSegundo;
  fill(255,0,0);
  triangle(centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo + Math.PI/2)),centroY+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo + Math.PI/2)),//Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo - Math.PI/2)),centroX+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo - Math.PI/2)),//Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloSegundo)),centroX+raio*(float)(Math.sin(anguloSegundo)));//Coordenadas X e Y da ponta do ponteiro
  
  anguloMinuto += velocidadeAngularMinuto;
  fill(0,0,0);
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto + Math.PI/2)),centroY+(larguraPonteiro)*(float)(Math.sin(anguloMinuto + Math.PI/2)),//Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto - Math.PI/2)),centroX+(larguraPonteiro)*(float)(Math.sin(anguloMinuto - Math.PI/2)),//Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloMinuto)),centroX+raio*(float)(Math.sin(anguloMinuto)));//Coordenadas X e Y da ponta do ponteiro
    
  anguloHora += velocidadeAngularHora;
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora + Math.PI/2)),centroY+(larguraPonteiro)*(float)(Math.sin(anguloHora + Math.PI/2)),
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora - Math.PI/2)),centroX+(larguraPonteiro)*(float)(Math.sin(anguloHora - Math.PI/2)),
    centroX+(raio/1.25)*(float)(Math.cos(anguloHora)),centroX+(raio/1.25)*(float)(Math.sin(anguloHora)));
    
  //Circulo do meio
  fill(255,0,0);  
  circle(centroX,centroY,30);
}
