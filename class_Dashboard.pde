class Dashboard {

  Dashboard() {
  }

  void update() {
    displayDash();
    displayXspeedDial(); 
    displayYspeedDial();
    displayFuelDial();
  }
  
  
  
  void displayXspeedDial(){
   
    float xspeed = theEagle.velocity.x;
    pushMatrix();
    textSize(30);
   text(round(xspeed*1000) + "km/h", 23 , 79);
    fill (255,255,255);
    popMatrix();
  }
  void displayDash(){
    pushMatrix();
    translate(-29,-198);
    image(dashImage, 0, 0);
    popMatrix();
  }
  void displayYspeedDial(){
    
    float yspeed = theEagle.velocity.y;
    pushMatrix();
    textSize(30);
   text(round(yspeed*1000) + "km/h", 241 , 79);
    fill (255,0,0);
    popMatrix();
    
  }
  void displayFuelDial(){
   
    float fuel = theEagle.fuelRem;
    pushMatrix();
    textSize(25);
   text(round(theEagle.fuelRem) + "%", 170 , 76);
    fill (255,255,255);
    popMatrix();
  }
  
    
    
  
}
