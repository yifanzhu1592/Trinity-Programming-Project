//Matteo created volumeBarChart ot show the volume compared to the total time of the stock 
// Matteo updated the classs to handle 5 year, 2 year and 1 year time periods and will display no data if there is no data to display.
class VolumeBarChart extends Widget
{
  ArrayList<Datapoints> data;
  int numberOfDates;
  int currentVolume = 0;
  float spacing;
  int maxVolume;
  PFont barFont;
  PFont smallXFont;
  int volumeSpacing = 0;
  int displayEnd;
  int rangeValue = 0;
  float ratio;
  boolean noDataToDisplay = false;  
  
  VolumeBarChart(ArrayList <Datapoints> data, int maxVolume, int sliderWidth, int rangeValue, boolean noDataToDisplay) {  
    super(450, 165, 400, 400, 543891, 0, 0, 0, 0);  
    numberOfDates = data.size();
    this.data = data;
    this.maxVolume = maxVolume;
    this.rangeValue = rangeValue;
    this.noDataToDisplay = noDataToDisplay;
    barFont=loadFont("Bahnschrift-15.vlw");  
    smallXFont=loadFont("Bahnschrift-10.vlw");
    spacing = height/(float)numberOfDates;
    dataSlider = new Slider(850-sliderWidth, 565, sliderWidth, 20, EVENT_NULL, 10, 10, 10, 10);
    dataSlider.setLabel("");
    displayEnd = data.size();
  }

  @Override
    void draw() {
    textAlign(LEFT);
    line(x, y, x, y+height);
    line(x, y+height, x+width, y+height);

    volumeSpacing = width/10;
    float textVolume = maxVolume/10;
    float tmpVolume = maxVolume;
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

      text(tmpVolume, x-100, yAxisText);
      //println("t"+tmpVolume);
      tmpVolume = tmpVolume - textVolume;
      //println("te"+textVolume); 
      yAxisText = yAxisText + volumeSpacing;
      xAxis = xAxis - volumeSpacing;
      textFont(stdFont);
    }


    //Tim added the if else statement to prevent crowding of data points and to utilise the slider, 20/04/2020
    //Tim, flipped the bar chart to match the rest of the graphs and prevent errors with dataSlider
    if (data.size() > 45) {

      spacing = height/44;
      ratio = ((float)data.size()) / (float)(400-sliderWidth);
      //println(sliderWidth);
      //println(data.size());
      //println(ratio);
      //println(dataSlider.getX());

      if (dataSlider.getX()+sliderWidth>=850) {
        displayEnd = data.size()-1;
      } else {
        displayEnd = (int)(float)(((dataSlider.getX()-450) * ratio)-1);
        //println("displayEnd" + displayEnd);
      }
      if (displayEnd-45 < 0) {
        displayEnd = 45;
      }

      float tmp = x;

      for (int i = displayEnd-45; i < displayEnd; i++ ) {

        float VolumePercentage = ((float)data.get(i).volume()/(float)maxVolume)*height;
        if (mouseY < height + y && mouseY > y &&
          mouseX > tmp && mouseX < tmp +  spacing) {
          fill(0);
          textFont(stdFont);
          //Tim, fixed error in displaying volume instead of volume price and 
          //text displaying over chart 10/04/2020
          text("Volume: " + data.get(i).volume, x, y-60);
          text("Date: " + data.get(i).date, x, y-30);
          fill(220, 20, 220);
        } else {
          fill(172, 189, 193);
          textFont(stdFont);
        }
        rect(tmp, y + height, spacing, -VolumePercentage);
        tmp = tmp + spacing;
      }
    } else {
      float tmp = x;

      for (Datapoints point : data) {

        float VolumePercentage = ((float)point.volume()/(float)maxVolume)*height;
        if (mouseY < height + y && mouseY > y &&
          mouseX > tmp && mouseX < tmp +  spacing) {
          fill(0);
          textFont(stdFont);
          //Tim, fixed error in displaying volume instead of volume price and 
          //text displaying over chart 10/04/2020
          text("Volume: " + point.volume(),x, y-60);
          text("Date: " + point.date(), x, y-30);
          fill(220, 20, 220);
        } else {
          fill(172, 189, 193);
          textFont(stdFont);
        }
        rect(tmp, y + height, spacing, -VolumePercentage);
        tmp = tmp + spacing;
      }
    }
      if (noDataToDisplay) {

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
      text("Volume Bar Chart", 500, 50 );
    }
    textAlign(CENTER);
  }
}
