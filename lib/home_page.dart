import 'package:flutter/material.dart';
import 'login_page.dart';
import 'page/announcement_page.dart';
import 'page/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key, this.zoomDrawerController }) : super(key: key);
final zoomDrawerController;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: [
          Container(child: homePage1(),),
          Center(child: AnnouncementPage(),),
          Center(child: Text("Notification"),),
          Center(child: Text("Contact"),),
        ],
      ),
      drawer: Drawer(
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.6,
          color: Color(0Xff153250),
          child: Column(
            children: [
              Container(
                child:Stack(
                  children: [
                    Container(
                      height: 120,
                      color:  Color(0Xff122134),),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
                      child: Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/pengthorng.jpg'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("ID: 18493" , style: TextStyle(color: Color(0xFFad843c), fontSize: 16),),
                                ),
                                SizedBox(height: 2,),
                                 Container(
                                  child: Text("Ext: 09113" , style: TextStyle(color: Colors.white, fontSize: 16),),
                                ),
                              ],
                            )
                          )
                        ],
                      )
                    ),
                  ],
                )
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.home_outlined, color: Color(0xFFc8a648),),
                      title: Text("Home", style: TextStyle(color: _tabIndex == 0 ? Colors.white :  Colors.grey),),
                      onTap: () {
                        setState(() {
                          _tabIndex = 0;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings_outlined, color: Color(0xFFc8a648),),
                      title: Text("Setting", style: TextStyle(color: _tabIndex == 1 ? Colors.white :  Colors.grey),),
                      onTap: () {
                        setState(() {
                          _tabIndex = 1;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading:  Icon(Icons.person_outlined, color: Color(0xFFc8a648),),
                      title:  Text("About", style: TextStyle(color: _tabIndex == 2 ? Colors.white :  Colors.grey),),
                      onTap: () {
                        setState(() {
                          _tabIndex = 2;
                        });
                        Navigator.of(context).pop();
                      }
                    ),
                    ListTile(
                      leading:  Icon(Icons.logout, color: Color(0xFFc8a648),),
                      title:  Text("Logout", style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginPage()));
                      }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("Version 5.54 ", style: TextStyle(color: Colors.grey),),
                    ),
                     Container(
                      child: Text(" Released Date: June 13 2022 ", style: TextStyle(color: Colors.grey),),
                    ),
                     Container(
                      child: Text(" Ypur ACLEDA mobile version is up to date", style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,)
                  ],
                )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0Xff153250),
        enableFeedback:false,

        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [ 
          BottomNavigationBarItem(
            // backgroundColor: Color(0Xff153250),
            icon: Icon(Icons.home_outlined),
            label: ""
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0Xff122134),
            icon: FaIcon(FontAwesomeIcons.bullhorn, size: 23,),
            label: ""
          ),
          
          BottomNavigationBarItem(
            // backgroundColor: Color(0Xff122134),
            icon: FaIcon(FontAwesomeIcons.bell, size: 25,),
            label: ""
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0Xff122134),
            icon: Icon(Icons.phone_enabled_outlined),
            label: ""
          ),   
        ],
        unselectedItemColor: Color(0xFF2f5d86),
        selectedItemColor:  Color(0xFFc8a648),
        currentIndex: _tabIndex,
        onTap: (value) {
         setState(() {
          _tabIndex = value;
         });
        },
      ),
    );
  }
}