//Ruxin, added class for showing stock info, 1pm, 19/3
class Stocks{
  String ticker;
  String exchange;
  String name;
  String sector;
  String industry;
  
  Stocks(){ }
  
  void ticker(String label){
    this.ticker = label;
  }
  void exchange(String label){
    this.exchange = label;
  }
  void name(String label){
    this.name = label;
  }
  void sector(String label){
    this.sector = label;
  }
  void industry(String label){
    this.industry = label;
  }
}
