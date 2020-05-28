class Widget { //<>//
  int x, y, width, height, a, b, c, d; 
  int event;
  int widgetColor, labelColor;
  String label;

  PFont widgetFont;
  PImage image = null;

  Widget(int x, int y, int width, int height, 
    int event, int a, int b, int c, int d) {
    this.x=x; 
    this.y=y; 
    this.a=a;
    this.b=b;
    this.c=c;
    this.d=d;
    this.width = width; 
    this.height = height;
    this.event=event;
    // Yifan Zhu, deleted the "image" variable in the constructor 
    // because not all widgets need an image, 4pm, 17/3/2020
  }

  void draw() {
    // Yifan Zhu, Changed draw method so that if the widget needs an image, it shows the image;
    // if it is an textWidget, it draws the rectangle, 5pm, 17/3/2020
    if (image != null) {
      image(image, x, y, width, height);
    } else {
      fill(widgetColor);
      rect(x, y, width, height, a, b, c, d);
      fill(labelColor); //<>//
      //Ruxin, Changed text location to make them neat, 9pm, 15/04
      text(label, x+width/2, y+(height+5)/2);
      textAlign (CENTER);

    }
  }

  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  
  // Yifan Zhu, Added setImage method for setting the image for the widget 
  // if it needs an image, 4pm, 17/3/2020
  void setImage(PImage image) {
    this.image = image;
  }

  // Yifan Zhu, Added setWidgetColor() method for 
  // setting the color for the widget, 11pm, 17/3/2020
  void setWidgetColor(int widgetColor) {
    this.widgetColor = widgetColor;
  }

  // Yifan Zhu, Added setLabelColor() method for 
  // setting the color for the widget, 11pm, 17/3/2020
  void setLabelColor(int labelColor) {
    this.labelColor = labelColor;
  }

  // Yifan Zhu, Added setLabel() method for 
  // setting the color for the widget, 11pm, 17/3/2020
  void setLabel(String label) {
    this.label = label;
  }
}
