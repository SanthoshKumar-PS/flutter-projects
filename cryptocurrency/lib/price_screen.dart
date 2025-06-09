import 'dart:convert';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String userInput="USD";
  double btcValue=0;
  double ethValue=0;
  double ltcValue=0;
  CupertinoPicker getIOSCupertinoPicker(){
    userInput='AUD';
    return CupertinoPicker(
        itemExtent: 35,
        onSelectedItemChanged: (value)async{
          double temp=await getValue('BTC', currenciesList[value]);
          double temp1=await getValue('ETH', currenciesList[value]);
          double temp2=await getValue('LTC', currenciesList[value]);
          setState(() {
            userInput=currenciesList[value];
            btcValue=temp;
            ethValue=temp1;
            ltcValue=temp2;
            // print(userInput);
          });
        },
        children: currenciesList.map((String item){
          return Text(item);
        }).toList()
    );
  }
  DropdownButton getAndroidDropDownButton(){
     return DropdownButton(
        value:userInput,
        items: currenciesList.map((String item){
          return DropdownMenuItem(
              value: item,
              child: Text(item)
          );
        }).toList(),
        onChanged: (newValue) async{
          double temp=await getValue('BTC', newValue);
          double temp1=await getValue('ETH', newValue);
          double temp2=await getValue('LTC', newValue);
          setState(()  {
            btcValue=temp;
            ethValue=temp1;
            ltcValue=temp2;
            userInput=newValue;
            // print(userInput);
          });
        });
  }
  String apiKey="6d2dceea-c158-404d-81b6-0079b228beb7";
  //https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=6d2dceea-c158-404d-81b6-0079b228beb7

  Future<double> getValue(crpto,currency) async{
    String url="https://rest.coinapi.io/v1/exchangerate/$crpto/$currency?apikey=$apiKey";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      double output=(data["rate"] as num).toDouble();
      output=double.parse(output.toStringAsFixed(2));//.toStringAsFixed(2);
      // print(output.toStringAsFixed(2));
      return output;
    }
    else{
      return 0.0;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startingCall();
  }
  void startingCall() async{
    double temp=await getValue('BTC', userInput);
    double temp1=await getValue('ETH', userInput);
    double temp2=await getValue('LTC', userInput);

    setState(() {
      btcValue=temp;
      ethValue=temp1;
      ltcValue=temp2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContainerWidget(cryptoValue: btcValue, currencyValue: userInput,cryptoWord: 'BTC'),
              ContainerWidget(cryptoValue: ethValue, currencyValue: userInput,cryptoWord: 'ETH'),
              ContainerWidget(cryptoValue: ltcValue, currencyValue: userInput,cryptoWord: 'LTC'),
            ],
          ),
          Container(
            height: 180.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getAndroidDropDownButton():getIOSCupertinoPicker()
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  ContainerWidget({required this.cryptoValue,required this.currencyValue,required this.cryptoWord});
  final String currencyValue;
  final double cryptoValue;
  final String cryptoWord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoWord = $cryptoValue $currencyValue', //'1 BTC = ${btcValue?? '?'} USD',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

