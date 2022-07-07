import 'package:flutter/material.dart';

import '../login_page.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:  Color(0Xff153250),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(icon: Icon(Icons.notes_rounded,size: 40,),
              onPressed:(){
                _scaffoldKey.currentState!.openDrawer();
              }
          ),
        ),
        title: Text("PROMOTION"),
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
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            buildtextfield(),
          ],
        ),
      ),
    );
  }

  Widget buildtextfield(){
    return Container(
      color: Colors.black12,
      height: 150,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextFormField(
            style: TextStyle(height: 0.5, color: Colors.green[400]),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Plesae Input User Name";
                }
              },
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Colors.white,
                label: Text("Search partner..."),
                prefixIcon: Icon(Icons.search),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  )
              ),
            )
          ),
          SizedBox(height: 5,),
          Container(
            height: 50,
//            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
               color: Colors.white,
                border: Border.all(
                    color: Colors.black, width: 1),
                ),
            child: TextButton(
              onPressed: () {
                  showDataAlert();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Select Business Type...'),
                  ),
                  Container(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(10

            ),

            content: Container(
              color: Colors.green,
              height: 400,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Select Business Type.."),
                          ),
                          Container(
                            child: Icon(Icons.circle),
                          ),
                        ],
                      ),
                    ),
//                    SizedBox(child: Container(color: Colors.grey,height: 1,),),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Select Business Type.."),
                          ),
                          Container(
                            child: Icon(Icons.circle),
                          ),
                        ],
                      ),
                    ),
//                    SizedBox(child: Container(color: Colors.grey,height: 1,),),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Select Business Type.."),
                          ),
                          Container(
                            child: Icon(Icons.circle),
                          ),
                        ],
                      ),
                    ),
//                    SizedBox(child: Container(color: Colors.grey,height: 1,),),


                  ],
                ),
              ),
            ),
          );
        });
  }
}
