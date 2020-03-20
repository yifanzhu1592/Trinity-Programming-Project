class Screen {   
  ArrayList widgets;   
  color backgroundColor;

  Screen(color backgroundColor) {     
    widgets = new ArrayList();     
    this.backgroundColor = backgroundColor;
  }
  
  int getEvent() {     
    for (int i = 0; i < widgets.size(); i++) {       
      Widget widget = (Widget) widgets.get(i);       
      int event = widget.getEvent(mouseX, mouseY);       
      if (event != EVENT_NULL) {         
        return event;
      }
    }     
    return EVENT_NULL;
  }
  
  void draw() {     
    background(backgroundColor);     
    for (int i = 0; i < widgets.size(); i++) {       
      Widget widget = (Widget) widgets.get(i);       
      widget.draw();
    }
  }
  
  void addWidget(Widget widget) {     
    widgets.add(widget);
  }
} 
