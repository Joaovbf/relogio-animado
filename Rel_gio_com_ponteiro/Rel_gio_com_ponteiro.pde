void setup() {
  size(800, 600);
   println(hour());
}

float centroX = 200;
float centroY = 200;
float div_rad = 0.104719;
int second = second();
float anguloSegundo = -1.57 + second * div_rad;
int minute = minute();
float anguloMinuto = -1.57 + minute * div_rad + (div_rad / 60 * second) ; 
int hour = hour();
float anguloHora = -1.57 + (hour >= 12 ? hour - 12 : hour) * 0.523598 + (0.523598 / 60 * minute);
float raio = 150;
float larguraPonteiro = raio/20;
float velocidadeAngularSegundo = 0.00174532925;
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = velocidadeAngularMinuto/60;
int offset_y =360;
void draw() {
  stroke(0);
  background(255, 255, 255);
  translate(200, 100);

  //Aba superior
  fill(57,57,57);
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
  fill(27,27,27);
  circle(centroX, centroY, 420);

  //Circulo de fundo do relogio
  fill(37,37,37);
  circle(centroX, centroY, 400);
  
  
  noStroke();
  //Text
  fill(245,203,155);
  textSize(32);
  text("12", centroX - 15, 50); 
  textSize(32);
  text("6", centroX - 15, 380); 
  textSize(32);
  text("3", 360, centroY + 15); 
  textSize(32);
  text("9", 20, centroY + 15); 
  
  
  
  fill(245,203,155);
  translate(centroX,centroY);
  //Marcações
  float angle = 0;
  float marker_position_x = 0;
  float marker_position_y = 0;
  
  //Gambiarra de posicionamento
  int[] correcao = {999, -10, 10, 999, -10, 10, 999, -10, 10, 999, -10, 10, 999};
  
  
  for (int i = 1; i <= 12; i++) {
    if(i > 0 && i % 3 == 0){
      continue;
    }
    angle = i * PI / 6;
    marker_position_x = (cos(angle) > 0 ? 30 : -30);
    marker_position_y = (sin(angle) > 0 ? 30 : -30);
    translate(marker_position_x, marker_position_y);
    rotate(angle);
    rect(100, correcao[i], 50, 10);
    rotate(-angle);
    translate(-marker_position_x, -marker_position_y);

  }
  
  translate(-centroX,-centroY);


  //Ponteiros
  anguloSegundo += velocidadeAngularSegundo;
  fill(255, 0, 0);
  triangle(centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo + Math.PI/2)), centroY+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo + Math.PI/2)), //Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo - Math.PI/2)), centroX+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo - Math.PI/2)), //Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloSegundo)), centroX+raio*(float)(Math.sin(anguloSegundo)));//Coordenadas X e Y da ponta do ponteiro

  anguloMinuto += velocidadeAngularMinuto;
  fill(245,203,155);
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto + Math.PI/2)), centroY+(larguraPonteiro)*(float)(Math.sin(anguloMinuto + Math.PI/2)), //Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto - Math.PI/2)), centroX+(larguraPonteiro)*(float)(Math.sin(anguloMinuto - Math.PI/2)), //Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloMinuto)), centroX+raio*(float)(Math.sin(anguloMinuto)));//Coordenadas X e Y da ponta do ponteiro

  anguloHora += velocidadeAngularHora;
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora + Math.PI/2)), centroY+(larguraPonteiro)*(float)(Math.sin(anguloHora + Math.PI/2)), 
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora - Math.PI/2)), centroX+(larguraPonteiro)*(float)(Math.sin(anguloHora - Math.PI/2)), 
    centroX+(raio/1.25)*(float)(Math.cos(anguloHora)), centroX+(raio/1.25)*(float)(Math.sin(anguloHora)));

  //Circulo do meio
  fill(255, 0, 0);  
  circle(centroX, centroY, 30);
}
