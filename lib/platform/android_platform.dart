import 'package:flutter/material.dart';
import '../login_page.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AndroidPlatform extends StatefulWidget {
  @override
  _AndroidPlatformState createState() => _AndroidPlatformState();
}

class _AndroidPlatformState extends State<AndroidPlatform> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;
  bool changeIcon = true;
  late PageController controller;
  GlobalKey<PageContainerState> key = GlobalKey();
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 600;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        key: _scaffoldKey,
        backgroundColor:   Color(0Xff153250),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),

          child: Center(

            child: Padding(

              padding: EdgeInsets.only(top: 30),
              child: AppBar(
                  backgroundColor:  Color(0Xff153250),
                  centerTitle: true,
                  title: Center(child: Image.asset("assets/logo3.png",scale: 3)),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: IconButton(icon: Icon(Icons.notes_rounded,size: 40,),
                        onPressed:(){
                          _scaffoldKey.currentState!.openDrawer();
                        }
                    ),
                  )
              ),
            ),
          ),
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
              buildbuttonbar(),
              buildviewpage(),
              buildimage(),
            ],
          ),
        )
    );
  }

  Widget buildbuttonbar(){
    return Container(

      child:


      SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff122134),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Container(
                  child: Text("EXCHANGE RATE"),
                ),
                Container(
                  child: Text("USD"),
                ),
                Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text("^", style: TextStyle(color: Colors.green),),
                        ),
                        Container(
                          child: Text("4.092.00"),
                        ),
                      ],
                    )
                ),
                Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text("^", style: TextStyle(color: Colors.green),),
                        ),
                        Container(
                          child: Text("4.106.00"),
                        ),
                      ],
                    )
                ),
              ],
            )),
      ),
    );
  }
  Widget buildviewpage(){

    return Container(
      color: Color(0Xff153250),
      child: Expanded(
        child:
        Container(
          height: 370,
          child: PageIndicatorContainer(
            indicatorColor: Colors.grey,
            indicatorSelectorColor: Colors.white,
            key: key,
            child: PageView(
              children: [
                if(isDesktop(context))
                  Container(
                    height: 200,
                    child: GridView.count(
                        crossAxisCount: 5,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 3,
                        children: List.generate(choices.length, (index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 27),
                              child: Center(
                                child: SelectCard(choice: choices[index]),
                              ),
                            ),
                          );
                        }
                        )
                    ),
                  )else
                Expanded(
                  child: Container(
                    child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 0.1,
                        children: List.generate(choices.length, (index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 27),
                              child: Center(
                                child: SelectCard(choice: choices[index]),
                              ),
                            ),
                          );
                        }
                        )
                    ),
                  ),
                ),

                Container(
                  child: Center(child: Text("Android", style: TextStyle(color: Colors.white, fontSize: 30),)),
                )
              ],
              controller: controller,
              // reverse: true,
            ),
            // align: IndicatorAlign.bottom,
            length: 2,
            indicatorSpace: 5,
          ),
        ),
      ),
    );
  }
  Widget buildimage(){
    return Expanded(
      child: Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                    child: Image.asset("assets/New Project.png",),
                  )),
              Positioned(
                  left: 245,
                  child: Center(
                    heightFactor: 2,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("🤍", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                    ),
                  )),
              Positioned(
                  child: Center(
                    heightFactor: 4,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("FAVORITES", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                    ),
                  ))
            ],
          )
      ),
    );
  }
}

class Choice {
  Choice({this.title, this.icon});
  final String? title;
  final IconData? icon;
}

List<Choice> choices = [
  Choice(title: 'PAYMENTS', icon: FontAwesomeIcons.scroll),
  Choice(title: 'MOBILE TOP UP', icon: FontAwesomeIcons.mobileScreen),
  Choice(title: 'TRANSFERS', icon: FontAwesomeIcons.arrowRightArrowLeft),
  Choice(title: 'E-SHOP', icon: Icons.shopping_cart_outlined),
  Choice(title: 'SCAN QR', icon: Icons.qr_code_scanner_sharp),
  Choice(title: 'ACCOUNTS', icon: FontAwesomeIcons.wallet),
  Choice(title: 'INVESTMENTS', icon: FontAwesomeIcons.chartLine),
  Choice(title: 'REQUESTS', icon: FontAwesomeIcons.penToSquare),
  Choice(title: 'QUICK CASH', icon: FontAwesomeIcons.sackDollar),
];
class SelectCard extends StatelessWidget {
  const SelectCard({ Key? key, this.choice }) : super(key: key);
  final Choice? choice;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(choice!.icon, size:50.0, color: Colors.white),
          SizedBox(height: 5,),
          Text(choice!.title!,style: TextStyle(color: Colors.white),),
        ]
    ),
    );
  }
}

