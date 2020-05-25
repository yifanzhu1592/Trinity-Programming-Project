// Yifan Zhu, Added SlideWidget class for creating the slider,
// 4pm, 30/3/2020
class Slider extends Widget {
  
  Slider(int x, int y, int width, int height, 
    int event, int a, int b, int c, int d) {
    super(x, y, width, height, event, a, b, c, d);
    this.labelColor = color(0); 
    this.widgetColor = color(240);
  }
  
  void setPositionY(int y) {
    this.y = y;
  }
  void setPositionX(int x) {
   this.x = x; 
  }

  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  int getX() {
    return x;
  }
  
}
