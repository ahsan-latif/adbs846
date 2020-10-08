float xPos, yPos;    
float speed = 1;  

int xdirection = 1;  
int ydirection = 1;  
int rad = 30; 
int lives = 3;
int score = 1;

boolean lost = false;


void setup() 
{
  background (#F2810F);
  
  size(700, 400);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  
  xPos = width/2;
  yPos = height/2;
}

void draw() 
{
background (#F2810F);  
  
  xPos = xPos + ( speed * xdirection );
  yPos = yPos + ( speed * ydirection );
  
  if (xPos > width - rad || xPos < rad) {
    xdirection *= -1;
  }
  if (yPos > height - rad || yPos < rad) {
    ydirection *= -1;
  }

  fill(#2D74B9);
  ellipse(xPos, yPos, rad, rad);
  noStroke();
  fill(255);
  textSize(10);
  text("Tap", xPos - 10, yPos + 3);
  
  fill(#3A5BCE);
  textSize(13);
  text("YOUR SCORE : " + score, 10, 20);                 
  text("LIVES : "+ lives, width-70, height-10); 
  
  if (lives<=0)                           
  {
    textSize(30);
    fill(255);
    text("YOU LOSE", 100, 100);
    text("TAP TO PLAY AGAIN", 100, 150);
    noLoop();                
    lost=true;
    textSize(13);
  }
}

void mousePressed()                               
{
  if (dist(mouseX, mouseY, xPos, yPos) <= 20)      
  {
    score = score + 1;                           
    speed = speed + 1;    
  }
  else                                         
  {
    if (speed < 1)                                 
    { 
    speed = speed - 1;
    }
    lives = lives - 1;                               
  }
  if (lost==true)                                
  {
    speed = 1;                                     
    lives = 3;
    score = 0;
    xPos = width/2;
    yPos = height/2;
    lost = false;
    loop();                                     
  }
}
