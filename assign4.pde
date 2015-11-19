int mode;
int bgx;
int bgX,n;
final int GAME_START=1;
final int attackOne=2;
final int attackTwo=3;
final int attackThr=4;
final int GAME_LOSE=5;
int gameState;
float Fx;
float Fy;
float Ta;
float Tb;
int xEn;
int yEn;
float speedx;
float speedy;
int b,f,g,h;
int bl;
int Hx;
int Hy;
float speed;
int HbX;
int HbY;
int a;
int i;
int j;
int k;
  float [] enemyXArray = new float [5];
float [] enemyYArray = new float [5];
 float [] enemyX1Array = new float [8];
float [] enemyY1Array = new float [8];
PImage start1Img; 
PImage start2Img;
PImage bg1Img;
PImage bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage end1Img;
PImage end2Img;



void setup () {
  size(640, 480) ;
  start1Img = loadImage("img/start1.png");
  start2Img = loadImage("img/start2.png");
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  hpImg = loadImage("img/hp.png");
  fighterImg = loadImage("img/fighter.png");
  enemyImg = loadImage("img/enemy.png");
  treasureImg = loadImage("img/treasure.png");
  end1Img = loadImage("img/end1.png");
  end2Img = loadImage("img/end2.png");
  gameState=GAME_START;
  bgX = 0;
  a = 60;
  bgx = -641;
  Fx = 550;
  Fy = 240;
  Ta = random(20,620);
  Tb = random(20,460);
  yEn = (int) random(40,440);
  HbX = 20;
  HbY = 20;
  bl = 69;
  n=2;
  speed = 1;
  speedx=floor(random(2,5));
  speedy=floor(random(-2,2));
  
}

void draw() {
  image(bg1Img,bgX,0);
  image(bg2Img,bgx,0);
  bgX += 2;
  bgx+=2;
  if(bgX>=640){
  bgX=-640; }
if(bgx>=640){
  bgx=-640;} 
  fill(255,0,0);
  rectMode(CORNERS);
  rect(30,20,bl,40);
  image(hpImg,HbX,HbY);
  image(treasureImg,Ta,Tb);
  image(fighterImg,Fx-20,Fy-20);
  if(Ta+40>=Fx && Fx+40>=Ta){
    if(Tb+40>=Fy && Fy+40>=Tb){
    Ta=floor(random(20,620));
    Tb=floor(random(20,200));
    bl+=19.5;
    }}

  switch(gameState){
   case GAME_START:
  image(start1Img,0,0);
   if(mouseX>=200 && mouseX<=440 && mouseY>=380 && mouseY<=420){
   image(start2Img,0,0);
   if(mousePressed){
   gameState=attackOne;
   }
  }
  break;

  case attackOne: 
  if(yEn<=419 && yEn>=0){
      for(int i=0;i<5;i++){
     xEn+=1;
     if(enemyXArray [i]>width+240){
    gameState=attackTwo;
    enemyXArray [i]=0;
    yEn= (int)random(0,180);}
   enemyXArray [i] = xEn-i*a;
   image(enemyImg,enemyXArray [i],enemyYArray [i]);}
       if(xEn+40>=Fx && Fx+40>=xEn){
       if(yEn+40>=Fy && Fy+40>=yEn){
       speedx=floor(random(2,5));
       speedy=floor(random(-2,2));
       xEn=20;
       yEn=floor(random(40,440));
       bl-=39;
       }
    }
    if(xEn>680||xEn<-40||yEn<-40||yEn>480){
      
      speedx=floor(random(2,5));
      speedy=floor(random(-2,2));
      xEn=20;
      yEn=floor(random(40,440));
    }
  xEn += speedx;
  yEn += speedy;
  if(yEn>=Fy && xEn>=120){
    speedy =-2;
  }
  if(yEn<=Fy && xEn>=120){
    speedy =2;
  }
 if(bl>=225){
 bl=225;
 }
 if(bl<=30){
    gameState=GAME_LOSE;
  }}
  break;
   case attackTwo:
  if(yEn<=180 && yEn>=0){
      for(int j=0;j<5;j++){
      xEn+=1;}
      if(xEn-j*a>width+240){
    gameState=attackThr;
    xEn=0;
     enemyXArray [j]=0;
    yEn= (int)random(0,180);}
   enemyXArray [j] = xEn-j*a;
    enemyXArray [j] = xEn-j*a;
   image(enemyImg,enemyXArray [j],enemyYArray [j]);}
        if(xEn+40>=Fx && Fx+40>=xEn){
       if(yEn+40>=Fy && Fy+40>=yEn){
       speedx=floor(random(2,5));
       speedy=floor(random(-2,2));
       xEn=20;
       yEn=floor(random(40,440));
       bl-=39;
       }
    }
    if(xEn>680||xEn<-40||yEn<-40||yEn>480){
      
      speedx=floor(random(2,5));
      speedy=floor(random(-2,2));
      xEn=20;
      yEn=floor(random(40,440));
    }
  xEn += speedx;
  yEn += speedy;
  if(yEn>=Fy && xEn>=120){
    speedy =-2;
  }
  if(yEn<=Fy && xEn>=120){
    speedy =2;
  }
 if(bl>=225){
 bl=225;
 }
 if(bl<=30){
    gameState=GAME_LOSE;
  }
  break;
  
  case attackThr:
     if(yEn<=297 && yEn>=122){
       int [] arrayX = new int [100];
       int [] arrayY = new int [100];
       int index = 0;
     for (int dx=-n; dx<=n;dx++){
     int dy=n-abs(dx);
     arrayX [index] = xEn +dx*60;
     arrayY [index] = yEn +dy*60;
     index++;
     arrayX [index] = xEn +dx*60;
     arrayY [index] = yEn -dy*60;
     index++;
    
   image(enemyImg,enemyXArray [j],enemyYArray [j]);
      xEn+=1;}}
    if(xEn-k*a>width+240){
    gameState=attackOne;
    xEn=0; 
    yEn= (int)random(0,419);}
break;
 case GAME_LOSE:
     image(end1Img,0,0);
     if(mouseX>=200 && mouseX<=440 && mouseY>=300 && mouseY<=360){
     image(end2Img,0,0);
     if(mousePressed){
     gameState=attackOne;
     fill(225,0,0);
     bl=69;
     rectMode(CORNERS);
     rect(30,20,bl,40);
     Fx=610;
     Fy=220;
     xEn=20;
     yEn=floor(random(40,440));
     Ta=floor(random(20,620));
     Tb=floor(random(20,200));
   }
    }
    break;
   }
}
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
