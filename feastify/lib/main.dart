import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:feastify/ItemRestaurantList/ItemRestaurantModel.dart';
import 'package:feastify/RestaurantFiles/RestaurantPage.dart';
import 'package:feastify/SecondPageItems.dart';
import 'IconTextIconOptions.dart';
import 'SortRowNextPage.dart';
import 'UserLocation/FirstRowLocationAndProfile.dart';
import 'ExploreAndDivider2ndColumn.dart';
import 'OfferGiftPremiumDelivery.dart';
import 'WhatsOnYourMind.dart';
import 'ImagesAndNameLongRow.dart';
import 'HotelDataList.dart';
import 'RestaurantFiles/RestaurantData.dart';
import 'CheckOut/ChechoutPage.dart';
import 'LoginRegister/LoginPage.dart';
import 'LoginRegister/RegisterPage.dart';
import 'LoginRegister/FirstPageWelcome.dart';

const kDateTextStyle=TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold);
const kDayTextStyle=TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500);
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
const kbackgroundColor=Color(0xFF191919);
const kforegroundColor=Color(0xFF252525);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> items = [
    '2-2.30 PM','2..30-3.00 PM','3.00-3.30 PM','3.30-4.00 PM','4.00-4.30 PM',
    '4.30-5.00 PM','5.00-5.30 PM', '5.30-6.00 PM'
  ];
  int UserSelectedtiming=0;
  String answer="";

  FixedExtentScrollController controllerName = FixedExtentScrollController(initialItem: 0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      initialRoute: '/registerpage',

      routes: {
        '/':(context)=>HomeScreen(),
        '/secondpageitems':(context)=>Secondpageitems(),
        '/restaurantpage':(context)=>Restaurantpage(),
        '/checkoutpage':(context)=> Checkoutpage(),
        '/itemrestaurant':(context)=> Itemrestaurantmodel(),
        '/welcomepage':(context)=>WelocomePage(),
        '/loginpage':(context)=>Loginpage(),
        '/registerpage':(context)=>Registerpage()

      },
    );
  }

  Widget HomeScreen() {
    return SafeArea(
      child: NestedScrollView(
          headerSliverBuilder:(context, innerBoxIsScrolled){
            return[
              SliverToBoxAdapter(
                child: Container(
                  color: kbackgroundColor,//Color(0xFF060606),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      //First Row for location area and profile
                      FirstRowLocationAndProfile(),
                      SizedBox(height: 10),
                      // This is 2nd Column including divider and Expand
                      ExploreAndDivider2ndColumn(),
                      SizedBox(height: 10),
                      //This contains offers,gift cards,premium and delivery
                      OfferGiftPremiumDelivery(),
                      SizedBox(height: 10),
                      //This if=s for whats in yout mind
                      WhatsOnYourMind(requiredText: 'What\'s on your mind',),
                      //Images and name for food long List 2 parallel rows
                      ImagesAndNameLongRow(),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Builder(builder: (context)=>TextButton(
                              onPressed:(){
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: false,
                                    builder: (BuildContext context){
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Center(child: IconButton(
                                              onPressed:(){
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel_rounded,color: Colors.red,size: 55,)),),
                                          Container(
                                            margin:EdgeInsets.symmetric(horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: kDefaultIconDarkColor,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(30))
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('Sort',style: TextStyle(fontSize: 20,color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  )),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 160),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),

                                                RowShowModal(textContent: 'Relevance',iconContent: Icons.radio_button_unchecked),
                                                RowShowModal(textContent: 'Rating: High To Low',iconContent: Icons.radio_button_unchecked),
                                                RowShowModal(textContent: 'Delivery Time: Low To High',iconContent: Icons.radio_button_unchecked),
                                                RowShowModal(textContent: 'Cost: Low To High',iconContent: Icons.radio_button_unchecked),
                                                RowShowModal(textContent: 'Cost:High To Low',iconContent: Icons.radio_button_unchecked),
                                                RowShowModal(textContent: 'Distance',iconContent: Icons.radio_button_unchecked),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                              child: IconTextIcon(iconName1: Icons.sort,textString: 'Sort',iconName2: Icons.arrow_drop_down_sharp),
                            )),
                            SizedBox(width: 8),

                            Builder(
                                builder: (context) => TextButton(
                                    onPressed:(){
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled : false,
                                          builder: (BuildContext context){
                                            return Column(
                                              // mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed:(){
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(Icons.cancel_rounded, color:Colors.red,size: 55),
                                                ),

                                                Container(
                                                  padding:EdgeInsets.fromLTRB(20, 10, 20,10),
                                                  decoration: BoxDecoration(
                                                      color: kforegroundColor,
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text('Select Your Delivery Time',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                                                      Divider(
                                                        thickness: 2,
                                                        color: Colors.grey,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(children: [
                                                            Text('05 Feb',style: kDateTextStyle,),
                                                            Text('Today',style: kDayTextStyle,)],),
                                                          Column(
                                                            children: [
                                                              Text('06 Feb',style: kDateTextStyle,),
                                                              Text('Tomorrow',style: kDayTextStyle,)],),
                                                          Column(children: [
                                                            Text('07 Feb',style: kDateTextStyle,),
                                                            Text('Friday',style: kDayTextStyle,)],)
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 200,
                                                            child: Center(
                                                              child: ListWheelScrollView.useDelegate(
                                                                itemExtent: 50,
                                                                diameterRatio: 1.2,
                                                                controller: controllerName,
                                                                perspective: 0.001,
                                                                physics: AlwaysScrollableScrollPhysics(),
                                                                onSelectedItemChanged: (index){
                                                                  setState(() {
                                                                    UserSelectedtiming = index;
                                                                    answer=items[UserSelectedtiming];
                                                                  });
                                                                },
                                                                childDelegate:ListWheelChildBuilderDelegate(
                                                                    childCount:items.length,
                                                                    builder: (context,index){
                                                                      return Container(
                                                                          height: 45,
                                                                          width: 180,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            color: UserSelectedtiming==index?Colors.grey[700]:Colors.transparent,
                                                                          ),
                                                                          child: Center(child: Text(items[index],style:TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              fontWeight: UserSelectedtiming==index?FontWeight.bold:FontWeight.w100
                                                                          )))

                                                                      );
                                                                    }),

                                                              ),
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Container(
                                                              height:50,
                                                              width:200,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                color:Colors.red[300],
                                                              ),
                                                              child: TextButton(onPressed: (){
                                                                print(answer);
                                                                controllerName.jumpToItem(0);
                                                              },
                                                                  child: Text('Reset',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold, fontSize: 20
                                                                    ),)),
                                                            ),)
                                                        ],
                                                      )
                                                    ],
                                                  ),

                                                ),
                                              ],
                                            );
                                          }
                                      );
                                    },
                                    child: IconTextIcon(iconName1: Icons.fiber_new_sharp, textString: 'Schedule', iconName2: Icons.arrow_drop_down_sharp)

                                )),

                            SizedBox(width: 8),
                            IconTextIcon(iconName1: Icons.check_circle_outlined, textString: 'Price Match'),
                            SizedBox(width: 8),
                            IconTextIcon(textString: 'Great Offers'),
                            SizedBox(width: 8),
                            IconTextIcon(textString: 'Pure Veg'),
                            SizedBox(width: 8),
                            IconTextIcon(textString: 'Gourment'),


                          ],
                        ),
                      ),

                      //creating featured above list of restaurants
                      WhatsOnYourMind(requiredText: 'Featured')
                    ],
                  ),
                ),
              )
            ];
          },
          body:
          Container(
            color: kbackgroundColor,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount:HotelDataList.HotelData.length  ,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      //RestaurantData.restaurant[index].resName
                      Navigator.pushNamed(context, '/restaurantpage',arguments: index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blueGrey,

                      ),
                      margin: EdgeInsets.all(20),
                      height: 270,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image(image: AssetImage(RestaurantData.restaurant[index].resImage),fit: BoxFit.cover,
                              width: double.infinity,),
                          ),
                          Container(
                            height: 78,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 5),
                                Text(RestaurantData.restaurant[index].resName,style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color:Colors.black
                                ),),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                )),
                                Text(RestaurantData.restaurant[index].resQuotes,style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.none,
                                    color:Colors.black)),
                                SizedBox(height: 5)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
      ),
    );
  }
}


