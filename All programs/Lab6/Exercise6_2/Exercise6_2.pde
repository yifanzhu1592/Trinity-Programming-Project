ArrayList widgetList;
PFont stdFont; 
color backgroundColor;
final int EVENT_BUTTON1=1; 
final int EVENT_BUTTON2=2; 
final int EVENT_BUTTON3=3; 
final int EVENT_NULL=0;
Widget widget1, widget2, widget3; 

void setup() {   
  stdFont = loadFont("yifan.vlw");   
  textFont(stdFont);   
  widget1 = new Widget(100, 100, 200, 40, 
                        "red", color(255, 0, 0), stdFont, EVENT_BUTTON1);   
  widget2 = new Widget(100, 200, 200, 40, 
                        "green", color(0, 255, 0),stdFont, EVENT_BUTTON2);    
  widget3 = new Widget(100, 300, 200, 40, 
                        "blue", color(0, 0, 255), stdFont, EVENT_BUTTON3);         
  widgetList = new ArrayList();
  widgetList.add(widget1); 
  widgetList.add(widget2);
  widgetList.add(widget3);
  backgroundColor = color(255, 255, 255);
  size(400, 400);   
}

void draw() {   
  background(backgroundColor);
  widget1.draw();
  widget2.draw();
  widget3.draw();
}

void mousePressed() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget widget = (Widget) widgetList.get(i);
    switch(widget.getEvent(mouseX, mouseY)) {   
    case EVENT_BUTTON1:     
      backgroundColor = color(255, 0, 0);
      break;   
    case EVENT_BUTTON2:     
      backgroundColor = color(0, 255, 0);
      break;   
    case EVENT_BUTTON3:     
      backgroundColor = color(0, 0, 255);
      break;
    }
  }
}

void mouseMoved() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget widget = (Widget) widgetList.get(i);
    if (widget.getEvent(mouseX, mouseY) != EVENT_NULL) {
      widget.strokeColor = WHITE;
    }
    else {
      widget.strokeColor = BLACK;
    }
  }  
}
