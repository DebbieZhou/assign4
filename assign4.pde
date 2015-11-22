PImage bg1Img;
PImage bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
int bgX;
int bgx;
int Fx;
int Fy;
float Tx;
float Ty;
float xEn;
float yEn;
int gameState;
int a;
int i;
int j;
int k;
final int attackOne=1;
final int attackTwo=2;
final int attackThr=3;

void setup () {
  size(640,480) ;  // must use this size.
  a = 60;
  bgX = 0;
  bgx = -641;
  Fx = 550;
  Fy = 240;
  Tx = random(1,640);
  Ty = random(1,480);
  xEn = 0;
  yEn = random(0,419);
  gameState=attackOne;
  
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  hpImg = loadImage("img/hp.png");
  fighterImg = loadImage("img/fighter.png");
  enemyImg = loadImage("img/enemy.png");
  treasureImg = loadImage("img/treasure.png");
}

void draw() {
  image(bg1Img,bgX,0);
    bgX += 2;
  image(bg2Img,bgx,0);
    bgx +=2;
 
if(bgX>=640){
  bgX=-640; }
if(bgx>=640){
  bgx=-640;}               //background
          
 image(treasureImg,Tx,Ty); 
  if(Tx+40>=Fx && Fx+40>=Tx){
    if(Ty+40>=Fy && Fy+40>=Ty){
    Tx=floor(random(20,600));
    Ty=floor(random(20,440));
    }}                           //treasure
 
  fill(255,0,0);
  rectMode(CORNERS);
  rect(10,0,205,30);             //blood 
  image(hpImg,0,0);            //hp
  
  image(fighterImg,Fx,Fy);     //fighter  
 // xEn++;
 // xEn %= 640;                  //enemy
 switch(gameState){         
  case attackOne:
    if(yEn<=419 && yEn>=0){
      for(int i=0;i<5;i++){
           image(enemyImg,xEn-i*a,yEn);
           xEn+=1;}}
    if(xEn-i*a>width+240){
    gameState=attackTwo;
    xEn=0;
    yEn= random(0,180);}
 break;
  case attackTwo:
  if(yEn<=180 && yEn>=0){
      for(int j=0;j<5;j++){
      image(enemyImg,xEn-j*a,yEn+j*a);
      xEn+=1;}}
      if(xEn-j*a>width+240){
    gameState=attackThr;
    xEn=0;
  yEn= random(122,297);}
break;
  case attackThr:
     if(yEn<=297 && yEn>=122){
      for(int k=0;k<3;k++){
      image(enemyImg,xEn-k*a,yEn-k*a);
      image(enemyImg,xEn-k*a,yEn+k*a);
      image(enemyImg,xEn-(4-k)*a,yEn-k*a);
      image(enemyImg,xEn-(4-k)*a,yEn+k*a);
      xEn+=1;}}
    if(xEn-k*a>width+240){
    gameState=attackOne;
    xEn=0; 
    yEn= random(0,419);}
break;
}}
void keyPressed(){
 
  if (key== CODED){
    
    if (keyCode == UP && Fy > 1){
      Fy = Fy-10;
    }
    if (keyCode == DOWN && Fy < 430){
      Fy = Fy+10;
    }
    if (keyCode == LEFT && Fx > 1){
      Fx = Fx-10;
    }
    if (keyCode == RIGHT && Fx < 590){
      Fx = Fx+10;
    }
  }
}
