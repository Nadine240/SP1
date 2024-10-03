class Player {

  // variabler
 int x; // x position
 int y; // y position
 int w; // width
 int h; // height
 
 boolean isMovingLeft;
 boolean isMovingRight;
 
 boolean isJumping;
 boolean isFalling;
 
 int speed; // hastigheden på Player


 // konstruktør, som initialiserer variablerne værdier
 Player(int startingX, int startingY, int startingW, int startingH){
 x = startingX; // initialiserer x
 y = startingY; // initialiserer y
 w = startingW; // initialiserer bredde
 h = startingH; // initialiserer højde
 

 isMovingLeft = false;
 isMovingRight = false;
 
 isJumping = false;
 isFalling = false;
 
 speed = 15; // sætter hastigheden
 
 }
 
 // Display metode for at tegne Player som en ellipse
 
 void display(){
 
   fill(255,0,0);
   ellipse(x,y,w,h); // tegner Player som ellipse
 }

 
 void move(){
  if (isMovingLeft == true){
  x -= speed; 
 
 }
 
 // sørger for at objekt ikke går uden for højre kant af vinduet
 if (x - w/2 < 0){
  x = w/2;
 
 }
 
 if (x + w/2 > width) {
  x = width - w/2; // sæt spilleren til at være ved højre kant
 
}
  
  if  (isMovingRight == true){
  x += speed; // samme princip som x = x + speed
  }
 }
 
 void jumping (){
  if(isJumping){
   y -= speed;
   
  }
}
 void falling(){
   if (isFalling) {
  
   y += speed;
   
   if(y >= height - h/2){
     y = height - h/2;
     isFalling = false;
     }
    }
  }
}

 
 
