SpaceShip juan = new SpaceShip();
Stars [] field;
boolean wIsPressed = false;
boolean sIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
public void setup() 
{
  size(600,600);
  background(0);
  field = new Stars[100];
  for(int i = 0; i < field.length; i++)
  {
    field[i] = new Stars();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < field.length; i++)
  {
    field[i].move();
    field[i].show();
  }
  juan.move();
  juan.show();
  if(wIsPressed == true)
  {
    juan.accelerate(.04); 
  }
  if(sIsPressed == true)
  {
    juan.accelerate(-.04);
  }
  if(aIsPressed == true)
  {
    juan.rotate(-5);
  }
  if(dIsPressed == true)
  {
    juan.rotate(5);
  }
}
void keyPressed()
{
  if(key == 'w' || keyCode == UP)
  {
    wIsPressed = true;
  }
  if(key == 's' || keyCode == DOWN)
  {
    sIsPressed = true;
  }
  if(key == 'a' || keyCode == LEFT)
  {
    aIsPressed = true;
  }
  if(key == 'd' || keyCode == RIGHT)
  {
    dIsPressed = true;
  }
  if(key == 'h')
  {
    juan.HyperSpace();
  }
}
void keyReleased()
{
  if(key == 'w' || keyCode == UP)
  {
    wIsPressed = false;
  }
  if(key == 's' || keyCode == DOWN)
  {
    sIsPressed = false;
  }
  if(key == 'a' || keyCode == LEFT)
  {
    aIsPressed = false;
  }
  if(key == 'd' || keyCode == RIGHT)
  {
    dIsPressed = false;
  }
}
class SpaceShip extends Floater  
{  
  public SpaceShip()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    int[] tx = {20,-6,0,-6};
    int[] ty = {0,-10,0,10};
    xCorners = tx;
    yCorners = ty;
    myColor = 255;
    myCenterX = 300;
    myCenterY = 450;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 270;
  } 
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}  
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public void HyperSpace()
  {
    myPointDirection = Math.random()*360;
    myCenterX = Math.random()*500 + 50;
    myCenterY = Math.random()*500 + 50;
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Stars 
{
  private double x,y,speed,angle;
  private int colour, size;
  public Stars()
  {
    x = Math.random()*600;
    y = Math.random()*600;
    size = ((int)Math.random()*2)+2;
    speed = Math.random()/20;
    colour = (int)(Math.random()*205 + 50);
    angle = Math.random()*2*PI;
  }
  public void show()
  {
    noStroke();
    fill(colour);
    ellipse((float)x,(float)y,size,size);
  }
  public void move()
  {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
  }
}


