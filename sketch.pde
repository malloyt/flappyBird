//SOME GRAVITY CODE SOURCED FROM http://learningprocessing.com/examples/chp05/example-05-09-gravity

float i = 450;
float birdY = 0;
float birdSpeed = 0;
float birdGrav = 0.2;
float randoH = 200;
int birdX = 100;
int oldCounter = 0;
int currCounter = 0;
int timer = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  fill(255);
  ellipse(birdX, birdY, 40, 40); //bird

  birdY += birdSpeed;
  birdSpeed += birdGrav; //setting up gravity

  fill(100, 255, 100);
  rect(i, 0, 50, randoH);
  rect(i, 500-randoH, 50, randoH); //drawing the pipes
  
  fill(0);
  rect(5,0,210,50); //box background for instructions
  
  fill(255);
  textSize(20);
  text("UP ARROW TO BOUNCE", 10,20);
  text("SHIFT TO BOOST", 10,40); //instructions in top left

  if (birdX == i && (birdY < randoH || birdY > 500-randoH)) {
    currCounter++;
    timer = 200;
  } //collision detection - bird and pipes

  if (currCounter > oldCounter && timer > 0) {
    textSize(50);
    fill(255, 0, 0);
    text("YOU LOST", 100, 100);
    timer--; //marking when collision is detected
    oldCounter++;
  }

  if (i > -50) {
    fill(100, 255, 100);
    rect(i, 300, 50, 225);
    i -= 2;
  } else {
    i = 450;
    randoH = (float)Math.random()*200;
  } //code to make pipes move left

  if (birdY < 20) {
    birdY = 20;
  } //stops bird from going off top of screen
  
  if(birdY > 460) {
    currCounter++;
    timer = 200;
  }
}

void keyPressed() { //taking care of bird bounce/gravity
  if (key == CODED) {
    if (keyCode == UP && birdSpeed > 0.1) {
      birdSpeed*= -0.9;
    }
    if (keyCode == SHIFT && birdSpeed > 0.1) {
      birdSpeed*=-1.1;
    }
  }
}
