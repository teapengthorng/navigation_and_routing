import 'package:flutter/material.dart';
import '../login_page.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;

  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 600;
//  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width < 600;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:  Color(0Xff153250),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.notes_rounded,size: 40,),
            onPressed:(){
              _scaffoldKey.currentState!.openDrawer();
            }
        ),
        title: Text("NOTIFICATION"),
        actions: [
          Image.asset("assets/acleda.png", fit: BoxFit.cover,),
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
                        color:  Color(0Xff122134),
                      ),
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
      body: Row(
        children: [
          if(isDesktop(context))
            Container(
            color: Colors.green,
            width: 300,
            child: Center(child: Text("desktop"),),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              width: 300,
              child: Center(child: Text("phone"),),
            ),
          )
        ],
      ),
    );
  }
}
