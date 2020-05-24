//Ceated by Tim, a point graph to display Opening Price over a specified amount of time
//for a chosen company
//The OpeningPricePointGraph has to display the data efficiently for several different specified time frames, using the values in the parameters
//it can figure out how many points need to be displayed, the size of the data slider widget needed, and, using the for loop, creates the interactive graph
class OpeningPricePointGraph extends Widget

{
  ArrayList<Datapoints> data;
  int numberOfDates;
  int currentOpeningPrice = 0;
  float spacing, tmp;
  double maxOpeningPrice;
  PFont barFont;
  PFont smallXFont;
  int openingPriceSpacing = 0;
  float lastTemp = -1;
  float lastOpeningPricePoint = -1;
  int pointCounter=0;
  float lastValue=-1;
  float radius;
  float openingPricePoint;
  float sliderX, sliderY;
  int displayEnd;
  float ratio;

 int rangeValue = 0;
  boolean noDataToDisplay = false;

  OpeningPricePointGraph(ArrayList <Datapoints> data, double maxOpeningPrice, int sliderWidth, int rangeValue, boolean noDataToDisplay) {
    super(450, 165, 400, 400, 543891, 0, 0, 0, 0);
    numberOfDates = data.size();
    this.data = data;
    this.maxOpeningPrice = maxOpeningPrice;
    this.rangeValue = rangeValue;
    this.noDataToDisplay = noDataToDisplay;
    barFont=loadFont("Arial-Black-15.vlw");  
    smallXFont=loadFont("Arial-Black-10.vlw");
    spacing = height/(float)numberOfDates;
    dataSlider = new Slider(850-sliderWidth, 565, sliderWidth, 20, EVENT_NULL, 10, 10, 10, 10);
    dataSlider.setLabel("");
    displayEnd = data.size();
  }

  @Override
    void draw() {
textAlign(LEFT);
    line(x, y, x, y+height);
    strokeWeight(3);
    //Tim, x+1 accounts for stroke weight, 13:53 08/04/2020
    line(x+1, y+height, x+width, y+height);
    strokeWeight(1);

    openingPriceSpacing = width/10;
    float textOpeningPrice = (float)maxOpeningPrice/10;
    float tmpOpeningPrice = (float)maxOpeningPrice;
    float xAxis= x+width;
    float yAxisText = y;

    fill(0);
    textFont(smallXFont);
    text("0", x-20, y+height+10);
    for (int i = 0; i <10; i++) {
      //line(xAxis, y+height, xAxis,  y+height+5);
      line( x, yAxisText, x-5, yAxisText);
      stroke(230);
      line( x, yAxisText, x+width, yAxisText);
      stroke(0);
      fill(0);
      textFont(smallXFont);

      text(tmpOpeningPrice, x-100, yAxisText);
      //println("t"+tmpOpeningPrice);
      tmpOpeningPrice = tmpOpeningPrice - textOpeningPrice;
      //println("te"+textOpeningPrice); 
      yAxisText = yAxisText + openingPriceSpacing;
      xAxis = xAxis - openingPriceSpacing;
      textFont(stdFont);
    }

    if (data.size() > 45) {
      spacing = width/41;
      tmp = x - spacing;
      
      ratio = ((float)data.size()) / (float)(400-sliderWidth);
      if (dataSlider.getX()+sliderWidth>=850) {
        displayEnd = data.size()-1;
      } else {
        displayEnd = (int)(float)(((dataSlider.getX()-450) * ratio)-1);
        //println("displayEnd" + displayEnd);
      }
      if (displayEnd-45 < 0) {
        displayEnd = 45;
      }


      for (int i = displayEnd-45; i < displayEnd; i++) {

        tmp = tmp + spacing;

        openingPricePoint = y + height -((float)data.get(i).open_price()/(float)maxOpeningPrice)*width;
        if (mouseY < height + y && mouseY > y &&
          mouseX > tmp && mouseX < tmp +  spacing) {
          fill(0);
          textFont(stdFont);
          text("OpeningPrice: " + data.get(i).open_price(), x, y-60);
          text("Date: "+data.get(i).date(), x, y-30);

          radius = 6;
          fill(220, 20, 220);
        } else {
          radius = 3;
          textFont(stdFont);
          fill(172, 189, 193);
        }

        //ellipse(openingPricePoint, tmp, 2, 2);

        ellipse(tmp, openingPricePoint, radius, radius);

        fill(220);
        rect(x, y+height, width, 20, 0, 0, 5, 5);
        fill(172, 189, 193);
        ////rect(x+width+21, y+height, (45*(width+21))/data.size(), 20, 0, 0, 5, 5);


        if (pointCounter == 45) {
          lastValue = openingPricePoint;
          pointCounter=0;
        }
        //added by Tim, stps error where last points connects to first point 2/4 11:05
        if (openingPricePoint == lastValue) {
        } else if (lastTemp!=-1 || lastOpeningPricePoint !=-1) {
          line(lastTemp, lastOpeningPricePoint, tmp, openingPricePoint);
        }

        lastTemp = tmp;
        lastOpeningPricePoint = openingPricePoint;
        pointCounter++;
      }
    } else {
      tmp = x - spacing;

      for (Datapoints point : data) {

        //tmp = tmp - spacing;
        tmp = tmp + spacing;
        //float openingPricePoint = ((float)point.openingPrice()/maxOpeningPrice)*width + x;
        openingPricePoint = y + height -((float)point.open_price()/(float)maxOpeningPrice)*width ;

        if (mouseY < height + y && mouseY > y &&
          mouseX > tmp && mouseX < tmp +  spacing) {
          fill(0);
          textFont(stdFont);
          text("OpeningPrice: " + point.open_price(), x, y-60);
          text("Date: "+ point.date(), x, y-30);
          

          radius = 6;
          fill(220, 20, 220);
        } else {
          radius = 3;
          textFont(stdFont);
          fill(172, 189, 193);
        }

        //ellipse(openingPricePoint, tmp, 2, 2);

        ellipse(tmp, openingPricePoint, radius, radius);

        if (pointCounter == data.size()) {
          lastValue = openingPricePoint;
        }
        //added by Tim, stps error where last points connects to first point 2/4 11:05
        if (openingPricePoint == lastValue) {
        } else if (lastTemp!=-1 || lastOpeningPricePoint !=-1) {
          line(lastTemp, lastOpeningPricePoint, tmp, openingPricePoint);
        }

        lastTemp = tmp;
        lastOpeningPricePoint = openingPricePoint;
        pointCounter++;
      }
    }
            if(noDataToDisplay){
      
      textFont(stdFont);
      fill(0);
      text("NO DATA TO DISPLAY", 525, 365 );
 
    }
    
    if(rangeValue == 5){
      
        String[] firstDate = fiveYearsPrevious.split("-");
        String[] secondDate = fiveYearsAfter.split("-");
  
      textFont(stdFont);
      fill(0);
      text("Five Year Chart - ", 500, 50 );
      //text("Date Range ", 860, 175);
      text(firstDate[0] + ":" + secondDate[0], 655, 50);
 
      
    }else if(rangeValue == 2){
      
        String[] firstDate = twoYearsPrevious.split("-");
        String[] secondDate = twoYearsAfter.split("-");
  
      textFont(stdFont);
      fill(0);
      text("Two Year Chart - ", 500, 50 );
      //text("Two Range ", 650, 50);
      text(firstDate[0] + ":" + secondDate[0], 655, 50);
 
      
    }else if(rangeValue == 1){
      
        String[] firstDate = oneYearsPrevious.split("-");
        String[] secondDate = oneYearsAfter.split("-");
  
      textFont(stdFont);
      fill(0);
      text("One Year Chart - ", 500, 50 );
      //text("One Range ", 860, 175);
      text(firstDate[0] + ":" + secondDate[0], 655, 50);
    }else if(rangeValue == 0){
      textFont(stdFont);
      fill(0);
      text("Opening Price Point Chart", 500, 50 );
    }
    textAlign(CENTER);
  }
}
