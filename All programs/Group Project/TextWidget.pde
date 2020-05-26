// Yifan Zhu, Added TextWidget class for issues about entering texts, 4pm, 17/3/2020
class TextWidget extends Widget {
  int maxlen;
  
  TextWidget(int x, int y, int width, int height, 
    String label, PFont font, int event, int maxlen, int a, int b, int c, int d) {
    super(x, y, width, height, event, a, b, c, d);
    this.label=label; 
    this.widgetFont=font;
    this.labelColor = color(0); 
    this.widgetColor = color(245);
    this.maxlen=maxlen;
  }
  
  void append(char s) {
    // Ruxin, added restrictions for input, 2pm, 19/3
    if (s==BACKSPACE) {
      if (!label.equals(""))
        label=label.substring(0, label.length()-1);
    } else if (label.length() <maxlen && s >= '0' && s <= '9') 
        label=label+str(s);
      else if (label.length() <maxlen && s >= 'a' && s <= 'z') 
        label=label+str(s);
      else if (label.length() <maxlen && s >= 'A' && s <= 'Z') 
        label=label+str(s);
      else if (label.length() <maxlen && s == '-')
        label=label+str(s);
  }
}
