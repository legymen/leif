class Dashboard {

  Dashboard() {
  }

  void update() {
 //   displayDash();
    //displayXspeedDial(); 
   // displayYspeedDial();
  //  displayFuelDial();
  }
  
  void displayDash(){
   // pushMatrix();
    //image(Matare, 0, 0);
  }
  
  void displayXspeedDial(){
   
    float xspeed = theEagle.velocity.x;
    pushMatrix();
    textSize(100);
   text(round(xspeed*1000) + "km/h", 100 , 100);
    fill (255,0,0);
    popMatrix();
  }
  void displayYspeedDial(){
    
    float yspeed = theEagle.velocity.y;
    pushMatrix();
    textSize(100);
   text(round(yspeed*1000) + "km/h", 500 , 400);
    fill (255,0,0);
    popMatrix();
    
  }
  
  
    
    
  
}
