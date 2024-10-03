Player p1; // deklarer Player-object
Meteor meteor; // deklarer meteor-object
Meteor [] meteors; // array til at gemme meteorer
int numMeteors = 5; // antal af meteor

boolean gameStarted = false; // spillet er ikke startet

void setup() {
  size(1000, 800); // vinduets størrelse
  p1 = new Player(width / 2, height / 2, 80, 80); // initialiserer Player objekt
  meteors = new Meteor[numMeteors]; // opretter array til meteor
  for (int i = 0; i < numMeteors; i++){ // udfør dette for hver meteor i array
    meteors[i] = new Meteor(random(0, width), -50, 50); // opretter hvert meteor
 }
}

// draw metode
void draw() { 
  background(170, 250, 250); // baggrundsfarve

// dette er bjerget som er i baggrunden
  fill(90, 80, 10);
  triangle(500, 325, 400, 400, 600, 400);
  fill(90, 80, 10);
  fill(0, 200, 0);
  rect(0, height / 2, width, height / 2);
  

  if (!gameStarted) { // hvis spillet ikke er startet, vis denne besked
    fill(255, 0, 0); // tekstfarve til sort
    textSize(65); // tekststørrelse
    textAlign(CENTER); // tekstens placering i midten
    text("Press to play", width / 2, height / 2); // viser tekst i midten
  } else {
    p1.display(); // tegner Player
    p1.move(); // kalder move-funktion 
    
    for(int i = 0; i < numMeteors; i++){
      meteors[i].display(); // tegn meteor
      meteors[i].fall(); // flyt meteor
      
         if (meteors[i].checkCrash(p1)) { // tjek når de crasher
             gameOver(); // slut spillet når de crasher
    }

    if (meteors[i].y > height) { // hvis meteor rammer bunden
     meteors[i].reset(); // reset meteor
      

   
      }
    }
  }
}

void keyPressed() { // når en tast trykkes
  if (!gameStarted) {
    gameStarted = true; // start spillet
  }
  
  // flyt Player til venstre eller højre
  if (key == 'a') {
    p1.isMovingLeft = true; // gå til venstre
  } 
  if (key == 'd') {
    p1.isMovingRight = true; // gå til højre
  }
}

void keyReleased() { // når tast slippes
  if (key == 'a') {
    p1.isMovingLeft = false; // stopper venstre bevægelse
  }
  if (key == 'd') {
    p1.isMovingRight = false; // stopper højre bevægelse
  }
  if (key == 'w') {
    p1.isJumping = false; // stop jumping
  }
}

void gameOver() { // spil slut
  gameStarted = false;
  fill(255, 0, 0); // rød tekstfarve
  textSize(65); // tekststørrelse
  textAlign(CENTER); // placering i midten
  text("Game Over!", width / 2, height / 2); // vis følgende besked
  noLoop(); // stopper med at tegne videre
}

// Definition af Meteor-klasse
class Meteor {
  float x, y; // position for meteor
  float size; // størrelse af meteor

  // Konstruktør for Meteor
  Meteor(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(255, 255, 0); // farve for meteor
    ellipse(x, y, size, size); // tegn meteor
  }

  void fall() {
    y += 5; // hastighed når falder
  }
  
  boolean checkCrash(Player p) {
    
   return (x < p.x + p.w && x + size > p.x && y < p.y + p.h && y + size > p.y); // Denne metode tjekker, om meteoren kolliderer med Player
  }

  void reset() {
    y = -50; // Resetting meteor position til ovenfor skærmen
    x = random(0, width); // random position
  }
}
