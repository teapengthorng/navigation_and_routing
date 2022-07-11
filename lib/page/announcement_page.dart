import 'package:flutter/material.dart';

import '../login_page.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}
enum menuitem { item1, item2, item3, item4 }
class _AnnouncementPageState extends State<AnnouncementPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;
  menuitem? _mitem = menuitem.item1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor:  Color(0Xff153250),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.notes_rounded,size: 40,),
            onPressed:(){
              _scaffoldKey.currentState!.openDrawer();
            }
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
      body: Container(
        child: Column(
          children: [
            buildtextfield(),
            Expanded(
              child: buildListView(),
            )
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
      return Dialog(
        backgroundColor: Colors.grey[200],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  ListTile(
//                   minVerticalPadding: 20,
                    title: const Text('Select Business Type...'),
                    trailing: Radio<menuitem>(
                      activeColor: Colors.green,
                      value: menuitem.item1,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: const Text('Baby Shop'),
                    trailing: Radio<menuitem>(
                      value: menuitem.item2,
                      activeColor: Colors.green,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                        });
                      },
                    ),
                  ),
                   Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title:  Text('Bakery'),
                    trailing: Radio<menuitem>(
                      activeColor: Colors.green,
                      value: menuitem.item3,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: const Text('Book Center/Library'),
                    trailing: Radio<menuitem>(
                      activeColor: Colors.green,
                      value: menuitem.item4,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget  buildListView(){
    return SingleChildScrollView(
      child: Column(

        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Image.asset("assets/25%.jpg")
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                    child: Text("INSTANT 25% DISCOUNT", style: TextStyle(color: Colors.blue[700]),)
                ),
                Container(
                  padding: EdgeInsets.only(left: 16,right: 16, bottom: 16),
                  child: Text("Enjoy instant 25% discount for your payments with ACLEDA QR through ACLEDA mobile at Le Seoul Restaurant from June 10, 2022 to July 10, 2022",style: TextStyle(fontSize: 16.6),)
                ),
              ],
            ),
          ),
           SizedBox(height: 10,),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Image.asset("assets/30%.jpg")
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Text("INSTANT 30% DISCOUNT", style: TextStyle(color: Colors.blue[700]),)
                ),
                Container(
                  padding: EdgeInsets.only(left: 16,right: 16, bottom: 16),
                  child: Text("Get instant 30% off for your payments with ACLEDA QR through ACLEDA mobile at BROWN Coffee and Bakery from June 13, 2022 to July 13, 2022", style: TextStyle(fontSize: 16.6),)
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      )
    );
  }
}
