PImage correia;
void setup() {
  size(800, 720);
  println(hour());
  
  correia = loadImage("correia.png");
}

float centroX = 200;
float centroY = 200;
float div_rad = 2 * PI / 60;
float hour_rad = 2 * PI / 12;
int second = second();
float anguloSegundo = -1.57 + second * div_rad;
int minute = minute();
float anguloMinuto = -1.57 + minute * div_rad + (div_rad / 60 * second) ; 
int hour = hour();
float anguloHora = -1.57 + (hour >= 12 ? hour - 12 : hour) * hour_rad + (hour_rad / 60 * minute);
float raio = 150;
float larguraPonteiro = raio/20;
float velocidadeAngularSegundo = 0.00174532925;
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = velocidadeAngularMinuto/60;
int offset_y =360;
void draw() {
  stroke(0);
  background(255, 255, 255);
  translate(200, 160);
  
  //Correia Superior
  image(correia, 100, -160, 200, correia.height + 20);
  
  //Aba superior
  fill(57, 57, 57);
  beginShape();
  vertex(30, 80);
  vertex(100, -50);
  vertex(300, -50);
  vertex(370, 80);
  vertex(30, 80);
  endShape();
  
  //Sombra Aba Superior
  int qtd_grad = 70;
  int max_color = 100;
  for(int i = 0; i < qtd_grad; i++){
    noStroke();
    fill(57 + i * (max_color / qtd_grad), 57 + i * (max_color / qtd_grad), 57 + i * (max_color / qtd_grad));
    beginShape();
    vertex(30 + (i * 340 / qtd_grad) , 80);
    vertex(100 + (i * 200 / qtd_grad), -50  + (i * 130 / qtd_grad));
    vertex(300 - (i * 200 / qtd_grad), -50 +  (i * 130 / qtd_grad));
    vertex(370 - (i * 340 / qtd_grad), 80);
    vertex(30 + (i * 340 / qtd_grad), 80);
    endShape();
  }
  
  //Correia Inferior
  image(correia, 100, 440, 200, correia.height + 80);

  //Aba inferior
  beginShape();
  vertex(30, -50 + offset_y);
  vertex(100, 80 + offset_y);
  vertex(300, 80 + offset_y);
  vertex(370, -50 + offset_y);
  vertex(100, -50 + offset_y);
  endShape();
  
  //Sombra Aba Inferior
  qtd_grad = 70;
  max_color = 100;
  for(int i = 0; i < qtd_grad; i++){
    noStroke();
    fill(57 + i * (max_color / qtd_grad), 57 + i * (max_color / qtd_grad), 57 + i * (max_color / qtd_grad));
    beginShape();
    vertex(30 + (i * 340 / qtd_grad) , -50 + offset_y);
    vertex(100 + (i * 200 / qtd_grad), 80  - (i * 130 / qtd_grad) + offset_y);
    vertex(300 - (i * 200 / qtd_grad), 80  - (i * 130 / qtd_grad) + offset_y);
    vertex(370 - (i * 340 / qtd_grad), -50 + offset_y);
    vertex(100 + (i * 340 / qtd_grad), -50 + offset_y);
    endShape();
  }

  //Borda de fundo do relogio
  fill(27, 27, 27);
  circle(centroX, centroY, 420);

  //Circulo de fundo do relogio
  fill(37, 37, 37);
  circle(centroX, centroY, 400);
  
  //Gradiente fundo relogio
  qtd_grad = 70;
  max_color = 100;
  for(int i = 0; i < qtd_grad; i++){
    noStroke();
    fill(37 + i * (max_color / qtd_grad), 37 + i * (max_color / qtd_grad), 37 + i * (max_color / qtd_grad));
    circle(centroX, centroY,  400 - (i * (400 / qtd_grad)));
  }


  noStroke();
  //Text
  textSize(32);
  fill(144, 86, 75);
  text("12", centroX - 13, 52); 
  fill(245, 203, 155);
  text("12", centroX - 15, 50);
  
  
  fill(144, 86, 75);
  text("6", centroX - 13, 382);
  fill(245, 203, 155);
  text("6", centroX - 15, 380); 
  
  fill(144, 86, 75);
  text("3", 362, centroY + 17);
  fill(245, 203, 155);
  text("3", 360, centroY + 15); 
  
  fill(144, 86, 75);
  text("9", 22, centroY + 17);
  fill(245, 203, 155);
  text("9", 20, centroY + 15); 



  fill(245, 203, 155);
  translate(centroX, centroY);
  //Marcações
  float angle = 0;
  float marker_position_x = 0;
  float marker_position_y = 0;

  //Solução técnica de posicionamento
  int marker_height = 5;
  int correcao = -marker_height;

  for (int i = 1; i <= 12; i++) {
    if (i > 0 && i % 3 == 0) {
      continue;
    }
    angle = i * PI / 6;
    marker_position_x = (cos(angle) > 0 ? 30 : -30);
    marker_position_y = (sin(angle) > 0 ? 30 : -30);
    translate(marker_position_x, marker_position_y);
    rotate(angle);
    fill(144, 86, 75);
    rect(102, correcao + 2, 50, marker_height);
    fill(245, 203, 155);
    rect(100, correcao, 50, marker_height);
    rotate(-angle);
    translate(-marker_position_x, -marker_position_y);
    correcao *= -1;
  }

  translate(-centroX, -centroY);


  //Ponteiros
  
  anguloMinuto += velocidadeAngularMinuto;
  fill(245, 203, 155);
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto + Math.PI/2)), centroY+(larguraPonteiro)*(float)(Math.sin(anguloMinuto + Math.PI/2)), //Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloMinuto - Math.PI/2)), centroX+(larguraPonteiro)*(float)(Math.sin(anguloMinuto - Math.PI/2)), //Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloMinuto)), centroX+raio*(float)(Math.sin(anguloMinuto)));//Coordenadas X e Y da ponta do ponteiro

  anguloHora += velocidadeAngularHora;
  triangle(centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora + Math.PI/2)), centroY+(larguraPonteiro)*(float)(Math.sin(anguloHora + Math.PI/2)), 
    centroX+(larguraPonteiro)*(float)(Math.cos(anguloHora - Math.PI/2)), centroX+(larguraPonteiro)*(float)(Math.sin(anguloHora - Math.PI/2)), 
    centroX+(raio/1.5)*(float)(Math.cos(anguloHora)), centroX+(raio/1.5)*(float)(Math.sin(anguloHora)));
    
  anguloSegundo += velocidadeAngularSegundo;
  fill(255, 0, 0);
  triangle(centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo + Math.PI/2)), centroY+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo + Math.PI/2)), //Coordenadas X e Y do ponto da esquerda do ponteiro
    centroX+(larguraPonteiro/2)*(float)(Math.cos(anguloSegundo - Math.PI/2)), centroX+(larguraPonteiro/2)*(float)(Math.sin(anguloSegundo - Math.PI/2)), //Coordenadas X e Y do ponto da direita do ponteiro
    centroX+raio*(float)(Math.cos(anguloSegundo)), centroX+raio*(float)(Math.sin(anguloSegundo)));//Coordenadas X e Y da ponta do ponteiro

  

  //Circulo do meio
  fill(255, 0, 0);  
  circle(centroX, centroY, 30);
}
