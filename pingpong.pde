float ballx,bally;
float speedX,speedY,speedLeft;
int R,G,B;
boolean isPlaying;
float rightPaddleX,rightPaddleY;
float leftPaddleX,leftPaddleY;

//score
final int TOTAL_LIFE=3;
int score;
int life;


void setup(){
  size(500,300);
  background(0);
  println("hit back the ball as more times as you can, each time get 10 point, miss the ball lose one life.");
  println("you have 3 lives and 0 point now.");
  println("press any key to start the game.move your mouse to move your paddle.READY?");
  
  
  ballx=width/2;
  bally=height/2;
  
  speedX=random(1,5);
  speedY=random(-5,5);
  
  
  R=floor(random(0,256));
  G=floor(random(0,256));
  B=floor(random(0,256));
  
  isPlaying=false;
  
  rightPaddleX = width-15;
  rightPaddleY = height/2-50;
  leftPaddleX = 5;
  leftPaddleY = height/2-50;
  
  score=0;
  life=TOTAL_LIFE;
  
  //middle line
  
  stroke(255);
  line(width/2,0,width/2,height);
  
  //paddle
  fill(0,0,255);
  rect(leftPaddleX,leftPaddleY,10,100);
  rect(rightPaddleX,rightPaddleY,10,100);
  
  //ball
  fill(255);
  ellipse(ballx,bally,25,25);
}

void draw(){
  
  if(isPlaying){
  
    background(0);
    
    //middleline
    
    stroke(255);
    line(width/2,0,width/2,height);
    
    
    fill(R,G,B);
    ellipse(ballx,bally,25,25);
    
    ballx+=speedX;
    bally+=speedY;
    
    //boundary detection
    
    if(ballx < leftPaddleX+15 ){   
        speedX*=-1;  //-speed >> +speed || +speed >> -speed
      }
    if(bally < 0 || bally > height){   // ||==or
        speedY*=-1;
      }
      
    //hit detection
    
    if(ballx >= rightPaddleX){
      if(bally >= rightPaddleY && bally <= rightPaddleY + 100){  //&&==and
        speedX*=-1;
        score+=10;
        println("score:" + score);
      }else{
        isPlaying = false;
        life--;
        if(life<=0){
          println("GAME OVER!!press any key to start over");
        }
        else{
        println("life:" + life);
        }
      }
    }
      
    //paddle
    fill(0,0,255);
    //right
    rightPaddleY=mouseY-50; //move the point to the middle
    rect(rightPaddleX,rightPaddleY,10,100);
    
    //left
    leftPaddleY=bally-50;
    rect(leftPaddleX,leftPaddleY,10,100);
    
    
    
  }
  
  if(life<=0){
    score=0;
    life=3;
  }
}

void keyPressed(){
  isPlaying=true;
  
  //restart
  ballx=width/2;
  bally=height/2;
  speedX=random(1,5);
  speedY=random(-5,5);
  
}