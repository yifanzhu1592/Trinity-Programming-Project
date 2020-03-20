PFont stdFont; 
final int EVENT_BUTTON1=1; 
final int EVENT_FORWARD=2; 
final int EVENT_BUTTON2=3; 
final int EVENT_BACKWARD=4; 
final int EVENT_NULL=0; 
Widget widget1, widget2, widget3, widget4; 
Screen currentScreen, screen1, screen2;

void setup() {   
  stdFont = loadFont("yifan.vlw");   
  textFont(stdFont);   
  widget1 = new Widget(100, 100, 200, 40, 
                        "Button 1", color(255, 0, 0), stdFont, EVENT_BUTTON1);   
  widget2 = new Widget(100, 200, 200, 40, 
                        "Forward", color(0, 255, 0), stdFont, EVENT_FORWARD);    
  widget3 = new Widget(100, 100, 200, 40, 
                        "Button 2", color(0, 0, 255), stdFont, EVENT_BUTTON2);       
  widget4 = new Widget(100, 200, 200, 40, 
                        "Backward", color(255, 255, 255), stdFont, EVENT_BACKWARD);      
  size(400, 400);   
  screen1 = new Screen(color(255));   
  screen2 = new Screen(color(100));   
  screen1.addWidget(widget1);    
  screen1.addWidget(widget2);   
  screen2.addWidget(widget3);   
  screen2.addWidget(widget4);   
  currentScreen = screen1;
}

void draw() {   
  currentScreen.draw();
}

void mousePressed() {   
  switch(currentScreen.getEvent()) {   
  case EVENT_BUTTON1:     
    println("Button 1");     
    break;   
  case EVENT_BUTTON2:     
    println("Button 2");     
    break;   
  case EVENT_FORWARD:     
    println("Forward"); 
    currentScreen = screen2;     
    break;   
  case EVENT_BACKWARD:     
    println("Backward"); 
    currentScreen = screen1;     
    break;
  }
} 
