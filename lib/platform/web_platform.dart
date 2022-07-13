import 'package:flutter/material.dart';
import '../login_page.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class WebPlatForm extends StatefulWidget {
  @override
  _WebPlatFormState createState() => _WebPlatFormState();
}

class _WebPlatFormState extends State<WebPlatForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;
  bool changeIcon = true;
  late PageController controller;
  GlobalKey<PageContainerState> key = GlobalKey();
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1000;

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
          preferredSize: isDesktop(context) != true ? Size.fromHeight(110) : Size.fromHeight(80) ,
          child: Center(
            child: Padding(
              padding:isDesktop(context) != true ?  EdgeInsets.only(top: 30): EdgeInsets.only(top: 15),
              child: AppBar(
                  backgroundColor:  Color(0Xff153250),
                  centerTitle: true,
                  title: Center(child:  isDesktop(context) != true ? Image.asset( "assets/logo3.png", scale: 3) : Image.asset( "assets/logo3.png", scale: 3.5)),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: IconButton(icon: isDesktop(context) != true ? Icon(Icons.notes_rounded,size: 40,) : Icon(Icons.notes_rounded,size: 40,),
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
      child: SizedBox(
        height:isDesktop(context) != true ? 50 : 30,
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
          height:isDesktop(context) != true ? 370 : 430,
          child: PageIndicatorContainer(
            indicatorColor: Colors.grey,
            indicatorSelectorColor: Colors.white,
            key: key,
            child: PageView(
              children: [
                if(isDesktop(context))
                  Container(
                    child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 3.5,
                        crossAxisSpacing: 2,
                        children: List.generate(choices.length, (index) {
                          return InkWell(
                            onTap: (){
//                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only( top: 20),
                              child: Center(
                                child:
        SelectCard(choice: choices[index]),
      ),
    ),
    );
  }
  )
  ),    )else
                  Expanded(
                    child: Container(
                      child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 0.1,
                          children: List.generate(choices.length, (index) {
                            return InkWell(
                              onTap: (){
//                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
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
            indicatorSpace: 1,
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
                    child: isDesktop(context) != true ? Image.asset("assets/3000X664.png",) : Image.asset("assets/10000X800.png", ),
                  )),
              Positioned(
                  left: isDesktop(context) != true ? 300 : 810 ,
                  child: Center(
                    heightFactor:isDesktop(context) != true ? 3 : 3,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("🤍", style: isDesktop(context) != true ? TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600) : TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                    ),
                  )),
              Positioned(
                  child: Center(
                    heightFactor: 4,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("FAVORITES", style: isDesktop(context) != true ?  TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600) : TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),),
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
class SelectCard extends StatefulWidget {
  const SelectCard({ Key? key, this.choice }) : super(key: key);
  final Choice? choice;

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 600;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(isDesktop(context))
            Container(
              child: Column(
                children: [
                  Icon( widget.choice!.icon, size:50.0, color: Colors.white),
                  SizedBox(height: 5,),
                  Text(widget.choice!.title!,style: TextStyle(color: Colors.white),)
                ],
              ),
            )else
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Icon( widget.choice!.icon, size:50.0, color: Colors.white),
                      SizedBox(height: 5,),
                      Text(widget.choice!.title!,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                )
            )


        ]
    ),
    );
  }
}

