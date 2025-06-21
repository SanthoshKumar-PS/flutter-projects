import 'package:flutter/material.dart';
import 'package:feastify/main.dart';
import 'RestaurantData.dart';
import 'package:feastify/CheckOut/CheckoutData.dart';
import 'package:feastify/CheckOut/CheckoutModel.dart';
import 'package:feastify/IconTextIconOptions.dart';
import 'package:feastify/SortRowNextPage.dart';


enum EnumType {
  veg,
  non,
  egg
}
EnumType vegnon=EnumType.egg;

class Restaurantpage extends StatefulWidget {
  @override
  State<Restaurantpage> createState() => _RestaurantpageState();
}

class _RestaurantpageState extends State<Restaurantpage> {
  @override
  Widget build(BuildContext context) {
    final int passedData = ModalRoute.of(context)?.settings.arguments as int;
    return Column(
      children: [
        Expanded(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15,15,15,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios_new,
                                    size: 20, color: Colors.white)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  RestaurantData.restaurant[passedData].resName,
                                  style: TextStyle(
                                      fontFamily: 'KumarOne',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 25,
                                      decoration: TextDecoration.none),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.info_outline_rounded,
                                  size: 35,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed:(){
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: false,
                                          builder: (BuildContext context){
                                            return RestaurantSort(passedData);
                                          }
                                      );
                                    },
                                    child: IconTextIcon(iconName1: Icons.sort,textString: 'Sort',iconName2: Icons.arrow_drop_down_sharp)
                                ),
                                vegornonveg()
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ),
              ];
            },
            body: ListView.builder(
                itemCount: RestaurantData.restaurant[passedData].menu.length,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: kforegroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    padding: EdgeInsets.fromLTRB(30,10,10,10),
                    margin: EdgeInsets.fromLTRB(5,5,5,10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  RestaurantData
                                      .restaurant[passedData].menu[index].itemName,
                                  style: TextStyle(
                                    fontFamily: 'Fuemen',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                      decoration: TextDecoration.none)),
                              Text(
                                  RestaurantData.restaurant[passedData].menu[index].price
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'Lobster',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                      decoration: TextDecoration.none))
                            ],
                          ),
                          Container(
                            height: 148,
                            width: 189,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top:0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      height: 125,
                                      width: 190,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(5)), // Apply border radius
                                        child: Image(
                                          image: AssetImage(
                                              RestaurantData.restaurant[passedData].menu[index].imageName),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: (){
                                        itemsadded++;
                                        setState(() {
                                          addItemToCart(RestaurantData.restaurant[passedData].menu[index].itemName,
                                              RestaurantData.restaurant[passedData].menu[index].price);


                                        });
                                        // Navigator.pushNamed(context, '/checkoutpage');
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              if(Checkoutdata.checkoutitemslist.isEmpty)...[
                                                AnimatedContainer(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.linear,

                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF232426),//Colors.grey,
                                                      border: Border.all(color: Colors.red..shade200, width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  height: 40, // height of all the add bars in list
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('Add',style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                          decoration: TextDecoration.none)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                              else if(!Checkoutdata.checkoutitemslist.any((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName) ||
                                                  Checkoutdata.checkoutitemslist[Checkoutdata.checkoutitemslist.indexWhere((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName)].count==0)...[
                                                AnimatedContainer(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.linear,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF232426),//Colors.grey,
                                                      border: Border.all(color: Colors.red..shade200, width: 1),
                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  height: 40, // height of all the add bars in list
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('Add',style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                          decoration: TextDecoration.none)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Text('',style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.none))
                                              ]
                                              else...[
                                                  AnimatedContainer(
                                                    duration: Duration(milliseconds: 500),
                                                    curve: Curves.linear,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFF232426),//Colors.grey,
                                                        border: Border.all(color: Colors.red..shade200, width: 1),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                    ),
                                                    height: 45,//50 // height of all the add bars in list
                                                    width: 125,//122
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width:30,
                                                          height:48,
                                                          child: IconButton(
                                                            onPressed: (){
                                                              if(Checkoutdata.checkoutitemslist[Checkoutdata.checkoutitemslist.indexWhere((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName)].count>0)
                                                                {
                                                                  setState(() {
                                                                    itemsadded--;
                                                                    Checkoutdata.checkoutitemslist[Checkoutdata.checkoutitemslist.indexWhere((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName)].count--;
                                                                  });
                                                                }

                                                              },
                                                              icon: Icon(Icons.remove,size: 20,color: Colors.white)),
                                                        ),

                                                        Text('${Checkoutdata.checkoutitemslist[Checkoutdata.checkoutitemslist.indexWhere((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName)].count}',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors.white,
                                                                decoration: TextDecoration.none)),

                                                        Container(
                                                          width:30,
                                                          height: 48,
                                                          child: IconButton(
                                                            onPressed: (){
                                                              setState(() {
                                                                itemsadded++;
                                                                Checkoutdata.checkoutitemslist[Checkoutdata.checkoutitemslist.indexWhere((item) => item.itemName == RestaurantData.restaurant[passedData].menu[index].itemName)].count++;
                                                              });
                                                            },
                                                              icon: Icon(Icons.add,size: 20,color: Colors.white)),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ]

                                            ],
                                            //
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]
                    ),
                  );
                }),
          ),
        ),

        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/checkoutpage');
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15,0,15,10),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height:70,
            width: double.infinity,
            child: AddToCartButton(),
          ),
        )
      ],
    );
  }
  int itemsadded=Checkoutdata.checkoutitemslist.length ;
  EnumType vegnon=EnumType.egg;
  Widget AddToCartButton(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigate_before,color: Colors.white,size: 35,),
            Text('🍔 $itemsadded Items Added 🍟',
              style:TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.white) ,),
            Icon(Icons.navigate_next,color: Colors.white,size: 35,)
          ],
        ),
        Text('Click here to checkout',
          style:TextStyle(fontSize: 10,decoration: TextDecoration.none) ,),
      ],
    );
  }
  void addItemToCart(String itemName, double price) {
    bool itemExists = false;
    for (var item in Checkoutdata.checkoutitemslist) {
      if (item.itemName == itemName) {
        item.count++;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      Checkoutdata.checkoutitemslist.add(Checkoutmodel(itemName: itemName, price: price));
    }
  }
  static int pricesort=0;
// 0 for normal -- 1 for low to high -- 2 for high to low
  Widget RestaurantSort(int passedData) {
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

              // RowShowModal(textContent: 'Relevance',iconContent: Icons.radio_button_unchecked),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      //setdefault();
                      vegnon=EnumType.veg;
                      RestaurantData.restaurant[passedData].menu.sort((a,b)=>b.vegnon.toString().compareTo(a.vegnon.toString()));
                      Navigator.pop(context);

                    });
                  },
                  child: RowShowModal(textContent: 'Vegetarian',iconContent: vegnon==EnumType.veg? Icons.radio_button_checked:Icons.radio_button_unchecked)
              ),
              GestureDetector(
                  onTap: (){
                    //setdefault();
                    vegnon=EnumType.non;
                    RestaurantData.restaurant[passedData].menu.sort((a,b)=>a.vegnon.toString().compareTo(b.vegnon.toString()));
                    Navigator.pop(context);
                  },
                  child: RowShowModal(textContent: 'Non-Vegeterian',iconContent: vegnon==EnumType.non? Icons.radio_button_checked:Icons.radio_button_unchecked)
              ),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      //setdefault();
                      pricesort=1;
                      RestaurantData.restaurant[passedData].menu.sort((a,b)=>a.price.compareTo(b.price));
                      Navigator.pop(context);
                    });
                  },
                  child: RowShowModal(textContent: 'Cost: Low To High',iconContent: pricesort==1?Icons.radio_button_checked:Icons.radio_button_unchecked)),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      pricesort=2;
                      //setdefault();
                    RestaurantData.restaurant[passedData].menu.sort((a,b)=>b.price.compareTo(a.price));
                      Navigator.pop(context);
                    });
                  },
                  child: RowShowModal(textContent: 'Cost:High To Low',
                      iconContent: pricesort==2?Icons.radio_button_checked:Icons.radio_button_unchecked)
              ),
              TextButton(onPressed: (){
                setState(() {
                  setdefault();
                });
                Navigator.pop(context);
              },
                  child: Text('Reset Filters',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ],
    );
  }
  void setdefault(){
    vegnon=EnumType.egg;
    pricesort=0;

  }
  Widget vegornonveg(){
    if(vegnon==EnumType.veg){
      return GestureDetector(
        onTap: (){
          setState(() {
            vegnon=EnumType.egg;
          });
        },
        child: IconTextIcon(
          iconName1: Icons.label_important_rounded,textString: 'Veg',iconName2: Icons.add_chart,iconColor: Colors.green[500],
        ),
      );
    }
    else if(vegnon==EnumType.non){
      return GestureDetector(onTap: (){
        setState(() {
          vegnon=EnumType.egg;
        });
      },
        child: IconTextIcon(
            iconName1: Icons.add_circle,textString: 'NonVeg',
            iconColor: Colors.red[500]
        ),
      );
    }
    else{
      return Container();
    }
  }



}
