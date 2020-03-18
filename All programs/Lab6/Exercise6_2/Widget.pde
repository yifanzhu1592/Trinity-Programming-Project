final int BLACK = 0;
final int WHITE = 1;

class Widget {
  int x, y, width, height, strokeColor;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  Widget(int x, int y, int width, int height, String label, 
    color widgetColor, PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; 
    this.event=event;
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }
  void draw() {
    fill(widgetColor);
    if (strokeColor == BLACK) {
      stroke(0, 0, 0);
    }
    else {
      stroke(255, 255, 255);
    }
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}
