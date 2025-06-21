import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:attendance_tracking/widgets/team/reusable_card/team_listtile_card.dart';
import 'attendance_list.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:  kShaddishWhite,
      appBar: AppBar(
        backgroundColor:kWhite,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Team Members',
            style: TextStyle(
                color: kBlack, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color:kBlack,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kWhite,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: kLightGrey,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: kLightGrey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                TeamListTileCard(
                  imageurl: "https://randomuser.me/api/portraits/men/45.jpg",
                  text: 'Jane Hawkins',
                  subtext: 'janehawkins@demo.com',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return AttendanceList();
                        }));
                  },
                ),
                TeamListTileCard(
                  imageurl: "https://randomuser.me/api/portraits/women/22.jpg",
                  text: 'Brooklyn Simmons',
                  subtext: 'brroklynsimons@demo.com',
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return AttendanceList();
                      }));},
                ),
                TeamListTileCard(
                  imageurl: "https://randomuser.me/api/portraits/men/30.jpg",
                  text: 'Leslie Alexander',
                  subtext: 'lesliealexander@demo.com',
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return AttendanceList();
                      }));},
                ),
                TeamListTileCard(
                  imageurl: "https://randomuser.me/api/portraits/women/12.jpg",
                  text: 'Ronald Richards',
                  subtext: 'ronaldrichards@demo.com',
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return AttendanceList();
                      }));},
                ),
                TeamListTileCard(
                  imageurl: "https://randomuser.me/api/portraits/women/50.jpg",
                  text: 'Jenny Wilson',
                  subtext: 'jannywilson@demo.com',
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return AttendanceList();
                      }));},
                ),
              ],
            ),

            ///
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: kBluePasswordVerification,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline,color: Colors.white,size:25),
                      SizedBox(width: 8),
                      Text('Add Member',style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'PoppinsLight',
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
