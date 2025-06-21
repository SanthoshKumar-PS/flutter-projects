import 'package:flutter/material.dart';
class Upcomingpastteamleave extends StatefulWidget {
  const Upcomingpastteamleave({super.key});

  @override
  State<Upcomingpastteamleave> createState() => _UpcomingpastteamleaveState();
}

class _UpcomingpastteamleaveState extends State<Upcomingpastteamleave> {
  int selectedIndex=-1;
  List<String> itemsName=['Upcoming','Past','Team Leave'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Color(0xFFFBFBFB),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(itemsName.length,(index){
              return SelectionItem(
                  text: itemsName[index],
                  index: index,
                  isSelected: selectedIndex == index?true :false, // Pass selected state
                  onTap: () {
                      setState(() {
                      selectedIndex = index; // Update selected index
                      });
                  }
              );
            })
          ],
        ),
      ),
    );
  }
}


class SelectionItem extends StatelessWidget {

  SelectionItem({required this.text,required this.index,required this.isSelected,required this.onTap});
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 50),
          //curve: Curves.easeInToLinear,
          height: 58,
          // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
          decoration: BoxDecoration(
            color: isSelected? Colors.blue: Color(0xFFFBFBFB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:isSelected? Colors.white: Colors.black,
                //fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
              ),
            ),
          ),
        ),
      ),
    );
  }
}
