
class Calculator{
  Calculator(this.height,this.count,this.quantity);
  final int height;
  final int count;
  final int quantity;

  double get overall=>(count*quantity)/1000;

  String getOverview(){
    if(overall>4.5){
      return "Overtaking";
    }
    else if(overall>3){
      return "Normal!";
    }
    else{
      return"Undertaking";
    }
  }

  String getOverall(){
    return overall.toStringAsFixed(1);
  }

  String getMessage(){
    if(overall>4.5){
      return "Reduce the quantity of water you drink";
    }
    else if(overall>3){
      return "Wow! You are awesome!";
    }
    else{
      return"Drink more water to stay hydrated..!";
    }
  }


}