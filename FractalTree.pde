private double fractionLength = 0.8; 
private int smallestBranch = 100; 
private double branchAngle = .5;  
public void setup() 
{   
  size(640,600);    
} 
public void draw() 
{   
  background(0);  
  drawBranches(320,500,100,3*Math.PI/2); 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  branchLength = branchLength* fractionLength;
  if(branchLength < 6){
    strokeWeight(0.8);
    line(320,500,320,600);
  }
  else if(branchLength >= smallestBranch){
  strokeWeight(1);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  drawBranches(endX1, endY1, branchLength, angle1);
  drawBranches(endX2, endY2, branchLength, angle2);
  }   
  else {
    strokeWeight(0.6);
    stroke(218, 224, 255);
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 