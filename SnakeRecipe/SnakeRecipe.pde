
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
int x;
int y;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment (int x, int y) {
this.x = x;
this.y = y;
}
  // 4. Add getter and setter methods for both the x and y member variables.
  void setX(int x) {
    this.x = x;
  }
  void setY(int y) {
    this.y = y;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;

// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String direction = "up";

// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int eaten = 1;

// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);

void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
head = new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  
  int rate = 20;
  frameRate(rate);

}


void draw() {

  background(0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  rect(foodX,foodY,10,10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
rect(head.x,head.y,10,10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(direction) {
  case "up":
    head.y = head.y - 10;
    break;
  case "down":
    head.y = head.y + 10; 
    break;
  case "left":
    head.x = head.x - 10;
    break;
  case "right":
    head.x = head.x + 10; 
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
       direction = "up";
    } 
    if (keyCode == DOWN) {
       direction = "down";
    } 
    if (keyCode == LEFT) {
       direction = "left";
    } 
    if (keyCode == RIGHT) {
       direction = "right";
    } 
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(head.x > 500) {
    head.x = 10;
  }
  if(head.y > 500) {
    head.y = 10;
  }
  if(head.x < 0) {
    head.x = 490;
  }
  if(head.y < 0) {
    head.y = 490;
  }
  
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     if(head.x == foodX && head.y == foodY) {
         eaten++;
         foodX = ((int)random(50)*10);
         foodY = ((int)random(50)*10);
         drawFood();
     }
     
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList <Segment> tail = new ArrayList <Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  
  tail.add(new Segment(head.x,head.y));
  
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while (tail.size() > eaten) {
    tail.remove(0);
  }
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(int i = 0; i < tail.size(); i++) {
      rect(tail.get(i).x,tail.get(i).y,10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for(int i = 0; i < tail.size(); i++) {
    if(head.x == tail.get(i).x && head.y == tail.get(i).y) {
    eaten = 1;
    }
  }
  // reset your food variable
  //Call this method at the beginning of your manageTail method.
}
