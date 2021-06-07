import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff046582),
        secondaryHeaderColor: Color(0xff6e7582),
      ),
      home: MyHomePage(),
    );
  }
}

Color bgColor = Colors.white;
Color expCardBg1 = Color(0xfff39189);
Color expCardBg3 = Color(0xfff8a488);
Color expCardBg2 = Color(0xfff8f5f1);
Color contactMeCardBg = Color(0xfff39189);
Color aboutMeAccent = Color(0xfff39189);
Color drawerColor = Color(0xff046582);
Color lightTextColr = Colors.white;
Color darkTextColr = Color(0xff6e7582);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenu = 0;
  Widget _selectedPg = AboutMePg();
  static const int _ITEM_ABOUT_ME = 0;
  static const int _ITEM_JOURNEY = 1;
  static const int _ITEM_CONTACT = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: size.width < 1000
          ? AppBar(
              title: Text('Samrat Garai'),
              actions: [
                Center(
                  child: MenuItem(MENU_ABOUT_ME, selectedMenu == _ITEM_ABOUT_ME,
                      () {
                    setState(() {
                      selectedMenu = _ITEM_ABOUT_ME;
                      _selectedPg = AboutMePg();
                    });
                  }),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: MenuItem(
                      MENU_EXPERIENCE, selectedMenu == _ITEM_JOURNEY, () {
                    setState(() {
                      selectedMenu = _ITEM_JOURNEY;
                      _selectedPg = ExperiencePg();
                    });
                  }),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child:
                      MenuItem(MENU_CONTACT, selectedMenu == _ITEM_CONTACT, () {
                    setState(() {
                      selectedMenu = _ITEM_CONTACT;
                      _selectedPg = ContactPg();
                    });
                  }),
                ),
              ],
            )
          : null,
      backgroundColor: bgColor,
      drawer: size.width < 1000 ? Drawer(
        child: Container(
          color: drawerColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage:
                  ExactAssetImage('assets/images/myself.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Follow me on -',
                    style: GoogleFonts.abel(
                        fontSize: 16, color: Colors.white),
                  ),
                  Wrap(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await launch(URL_MY_GITHUB);
                        },
                        icon: Icon(AntDesign.github,
                            color: contactMeCardBg),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () async {
                          await launch(URL_MY_INSTA);
                        },
                        icon: Icon(AntDesign.instagram,
                            color: contactMeCardBg),
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ) : null,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Visibility(
                  visible: size.width >= 1000,
                  child: Expanded(
                    child: Container(
                      height: size.height,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            offset: Offset(
                                2.0, 0.0), // shadow direction: bottom right
                          )
                        ],
                        color: drawerColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            child: CircleAvatar(
                              radius: 150,
                              backgroundImage:
                                  ExactAssetImage('assets/images/myself.jpg'),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              MenuItem(
                                  MENU_ABOUT_ME, selectedMenu == _ITEM_ABOUT_ME,
                                  () {
                                setState(() {
                                  selectedMenu = _ITEM_ABOUT_ME;
                                  _selectedPg = AboutMePg();
                                });
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              MenuItem(MENU_EXPERIENCE,
                                  selectedMenu == _ITEM_JOURNEY, () {
                                setState(() {
                                  selectedMenu = _ITEM_JOURNEY;
                                  _selectedPg = ExperiencePg();
                                });
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              MenuItem(
                                  MENU_CONTACT, selectedMenu == _ITEM_CONTACT,
                                  () {
                                setState(() {
                                  selectedMenu = _ITEM_CONTACT;
                                  _selectedPg = ContactPg();
                                });
                              }),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Follow me on -',
                            style: GoogleFonts.abel(
                                fontSize: 16, color: Colors.white),
                          ),
                          Wrap(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await launch(URL_MY_GITHUB);
                                },
                                icon: Icon(AntDesign.github,
                                    color: contactMeCardBg),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () async {
                                  await launch(URL_MY_INSTA);
                                },
                                icon: Icon(AntDesign.instagram,
                                    color: contactMeCardBg),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: bgColor,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _selectedPg,
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMePg extends StatelessWidget {
  const AboutMePg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height < 600
            ? screenSize.height * 2.2
            : screenSize.height < 800 || screenSize.width < 800 ? screenSize.height * 1.8 : screenSize.height + 200,
        color: bgColor,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: 0,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(top: 30),
                color: aboutMeAccent,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Center(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MY_INTRO_HEAD,
                                  style: GoogleFonts.heebo(
                                      fontSize: 28, color: lightTextColr),
                                ),
                                Tooltip(
                                  message:
                                      MY_INTRO_HEAD_HAJIMEMASHITE_TOOLTIP,
                                  child: Text(
                                    MY_INTRO_HEAD_HAJIMEMASHITE,
                                    style: GoogleFonts.heebo(
                                        fontSize: 28,
                                        color: lightTextColr,
                                        decoration:
                                            TextDecoration.underline),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            MY_INTRO_BODY,
                            style: GoogleFonts.abel(
                              fontSize: 20,
                              color: lightTextColr,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: aboutMeAccent.withAlpha(100)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: aboutMeAccent.withOpacity(0.4),
                      blurRadius: 2.0,
                      offset: Offset(
                          0.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Flex(
                  direction: screenSize.width > 800
                      ? Axis.horizontal
                      : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Icon(
                            Icons.developer_mode_rounded,
                            color: aboutMeAccent,
                            size: 50,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Developer",
                            style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              DEV_INTRO,
                              style: GoogleFonts.abel(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Languages I speak:",
                            style: GoogleFonts.workSans(
                                color: aboutMeAccent, fontSize: 20),
                          ),
                          SkillRow(skillName: "Kotlin", yearSt: 2018),
                          SkillRow(skillName: "Java", yearSt: 2018),
                          SkillRow(skillName: "Dart", yearSt: 2019),
                          SkillRow(skillName: "Sql", yearSt: 2018),
                          SkillRow(skillName: "Typescript", yearSt: 2021),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '--------------------',
                            style: TextStyle(color: Colors.black26),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dev Tools/Services:",
                            style: GoogleFonts.workSans(
                                color: aboutMeAccent, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              DEV_TOOLS,
                              style: GoogleFonts.abel(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (screenSize.width > 800)
                      Container(
                        width: 1,
                        height: 550,
                        color: aboutMeAccent.withAlpha(100),
                      )
                    else
                      Container(
                        width: 380,
                        height: 1,
                        color: aboutMeAccent.withAlpha(100),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_activity,
                            color: aboutMeAccent,
                            size: 50,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Activities",
                            style: GoogleFonts.workSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              ACT_INTRO,
                              style: GoogleFonts.abel(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Things I have interest in:",
                            style: GoogleFonts.workSans(
                                color: aboutMeAccent, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sketching',
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Dancing',
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Anime',
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Image and Video Editing',
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            '--------------------',
                            style: TextStyle(color: Colors.black26),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tools:",
                            style: GoogleFonts.workSans(
                                color: aboutMeAccent, fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              ACT_TOOLS,
                              style: GoogleFonts.abel(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SkillRow extends StatelessWidget {
  final String skillName;
  final int yearSt;

  const SkillRow({required this.skillName, required this.yearSt, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 180),
        child: Table(
          children: [
            TableRow(children: [
              Text(
                skillName,
                style: GoogleFonts.abel(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                getDate(),
                style: GoogleFonts.abel(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  String getDate() {
    var year = DateTime.now().year - yearSt;
    if (year == 0) {
      return '6 months';
    }
    if (year == 1) {
      return '1 year';
    }
    return '$year years';
  }
}

class ContactPg extends StatefulWidget {
  const ContactPg({Key? key}) : super(key: key);

  @override
  _ContactPgState createState() => _ContactPgState();
}

class _ContactPgState extends State<ContactPg> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _subj = TextEditingController();
  TextEditingController _body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Wrap(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      CONTACT_ME_HEADING,
                      style: GoogleFonts.ptSans(
                          textStyle: Theme.of(context).textTheme.headline3,
                          color: drawerColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 20),
                    //         child: TextFormField(
                    //           controller: _name,
                    //           style: GoogleFonts.lato(
                    //             color: darkTextColr,
                    //             letterSpacing: 2,
                    //             fontSize: 18,
                    //           ),
                    //           cursorColor: darkTextColr,
                    //           decoration: InputDecoration(
                    //             filled: true,
                    //             fillColor: lightTextColr,
                    //             labelText: "Name",
                    //             labelStyle: Theme.of(context)
                    //                 .textTheme
                    //                 .headline5!
                    //                 .copyWith(color: drawerColor),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.4),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(12.0),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.8),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(12.0),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 20),
                    //         child: TextFormField(
                    //           controller: _email,
                    //           style: GoogleFonts.lato(
                    //             color: darkTextColr,
                    //             letterSpacing: 2,
                    //             fontSize: 18,
                    //           ),
                    //           cursorColor: darkTextColr,
                    //           decoration: InputDecoration(
                    //             filled: true,
                    //             fillColor: lightTextColr,
                    //             labelText: "Email",
                    //             labelStyle: Theme.of(context)
                    //                 .textTheme
                    //                 .headline5!
                    //                 .copyWith(color: drawerColor),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.4),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(12.0),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.8),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(12.0),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Subject",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline5!
                    //               .copyWith(color: drawerColor),
                    //         ),
                    //         SizedBox(
                    //           height: 4,
                    //         ),
                    //         TextFormField(
                    //           controller: _subj,
                    //           maxLines: 1,
                    //           style: GoogleFonts.lato(
                    //             color: Colors.black,
                    //             letterSpacing: 2,
                    //             fontSize: 18,
                    //           ),
                    //           cursorColor: darkTextColr,
                    //           decoration: InputDecoration(
                    //             filled: true,
                    //             fillColor: lightTextColr,
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.4),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(8.0),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.8),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(8.0),
                    //             ),
                    //           ),
                    //         ),
                    //       ]),
                    // ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Message",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline5!
                    //               .copyWith(color: drawerColor),
                    //         ),
                    //         SizedBox(
                    //           height: 4,
                    //         ),
                    //         TextFormField(
                    //           controller: _body,
                    //           maxLines: null,
                    //           minLines: 8,
                    //           style: GoogleFonts.lato(
                    //             color: Colors.black,
                    //             letterSpacing: 2,
                    //             fontSize: 18,
                    //           ),
                    //           cursorColor: darkTextColr,
                    //           decoration: InputDecoration(
                    //             filled: true,
                    //             fillColor: lightTextColr,
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.4),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(8.0),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: drawerColor.withOpacity(0.8),
                    //                   width: 1.0),
                    //               borderRadius: BorderRadius.circular(8.0),
                    //             ),
                    //           ),
                    //         ),
                    //       ]),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStateProperty.all(contactMeCardBg),
                    //         padding:
                    //             MaterialStateProperty.all<EdgeInsetsGeometry>(
                    //                 EdgeInsets.symmetric(
                    //                     horizontal: 70, vertical: 20)),
                    //         shape:
                    //             MaterialStateProperty.all<RoundedRectangleBorder>(
                    //                 RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(18.0),
                    //                     side: BorderSide(
                    //                         color: lightTextColr, width: 2.0)))),
                    //     child: Text(
                    //       'Submit',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headline5!
                    //           .copyWith(color: lightTextColr),
                    //     ),
                    //     onPressed: () async {
                    //       var email = _email.text;
                    //       var body = _body.text;
                    //       var name = _name.text;
                    //       var subj = _subj.text;
                    //       if(email == null || email.isEmpty) {
                    //         return;
                    //       }
                    //       if(body == null || body.isEmpty) {
                    //         return;
                    //       }
                    //       if(name == null || name.isEmpty) {
                    //         return;
                    //       }
                    //       if(subj == null || subj.isEmpty) {
                    //         return;
                    //       }
                    //       final Uri _emailLaunchUri = Uri(
                    //           scheme: 'mailto',
                    //           path: 'samrat.garai94@gmail.com',
                    //           queryParameters: {
                    //             'subject': subj,
                    //             'body': body,
                    //           }
                    //       );
                    //       print(_emailLaunchUri.toString());
                    //       String url = _emailLaunchUri.toString();
                    //       print(kIsWeb);
                    //       // flutter web
                    //       if (kIsWeb) {
                    //         // html.document.window!.location.href = url;
                    //         // window.open(url, 'Link');
                    //         js.context.callMethod("open", [url]);
                    //       }
                    //       // android or ios
                    //       // else if (Platform.isAndroid || Platform.isIOS) {
                    //       //   if (await canLaunch(url)) {
                    //       //     await launch(url);
                    //       //   }else {
                    //       //     throw 'Could not launch $url';
                    //       //   }
                    //       // }
                    //       // unknown platform
                    //       else {
                    //         throw new Exception('Unsupported platform');
                    //       }
                    //       // print(result);
                    //     },
                    //   ),
                    // ),
                    PaddedDivider(),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              await launch(
                                URL_MY_LINKEDLN,
                              );
                            },
                            child: Icon(AntDesign.linkedin_square,
                                size: 80, color: contactMeCardBg),
                          ),
                          VerticalDivider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Tooltip(
                              message: 'Send mail to samrat.garai94@gmail.com',
                              child: TextButton.icon(
                                onPressed: () async {
                                  String mailId = 'samrat.garai94@gmail.com';
                                  final Uri _emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: mailId,
                                  );
                                  try {
                                    if (kIsWeb) {
                                      await Clipboard.setData(
                                          ClipboardData(text: mailId));
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title:
                                                    Text('Email id is copied!'),
                                                actions: [
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        await launch(
                                                            "https://mail.google.com/mail/u/0/#inbox");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                          'Open email client'),
                                                    ),
                                                  )
                                                ],
                                              ));
                                      return;
                                    }
                                    await launch(_emailLaunchUri.toString());
                                  } catch (e) {}
                                },
                                icon: Padding(
                                  padding: EdgeInsets.only(left:8, right: 4, bottom: 2),
                                  child: Icon(AntDesign.mail,
                                      size: 55, color: Colors.white),
                                ),
                                label: Padding(
                                  padding: EdgeInsets.only(left:4, right: 8),
                                  child: Text(
                                    'samrat.gara94@gmail.com',
                                    style: GoogleFonts.workSans(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        contactMeCardBg)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class ExperiencePg extends StatelessWidget {
  const ExperiencePg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: expCardBg1,
                width: screenSize.width,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Text(
                      'Projects Log',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline3,
                        color: lightTextColr,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ProjectCard(
                    iconUrl: PROJ_MARROW_ICON,
                    projTitle: PROJ_MARROW,
                    projSubTitle: PROJ_MARROW_DATE,
                    projIntro: PROJ_MARROW_INTRO,
                    tagName: ORG_MARROW,
                    roles: PROJ_MARROW_KEY_ROLES,
                    urlDetails: URL_MARROW,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_ETEXT_ICON,
                    projTitle: PROJ_ETEXT,
                    projSubTitle: PROJ_ETEXT_DATE,
                    projIntro: PROJ_ETEXT_INTRO,
                    tagName: ORG_CTS,
                    roles: PROJ_ETEXT_KEY_ROLES,
                    urlDetails: URL_ETEXT,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_PLUGINS_ICON,
                    projTitle: PROJ_PLUGINS,
                    projSubTitle: PROJ_PLUGINS_DATE,
                    isOffline: true,
                    projIntro: PROJ_PLUGINS_INRO,
                    tagName: ORG_CTS,
                    urlDetails: URL_ETEXT,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_WHATS_EASY_ICON,
                    projTitle: PROJ_WHATS_EASY,
                    projSubTitle: PROJ_WHATS_EASY_DATE,
                    isOffline: true,
                    projIntro: PROJ_WHATS_EASY_INTRO,
                    projType: TAG_PERSONAL,
                    tagName: "Personal",
                    isScratchDev: true,
                    urlDetails: URL_WHATS_EASY,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_WALL_STREET_ICON,
                    projTitle: PROJ_WALL_STREET,
                    projSubTitle: PROJ_WALL_STREET_DATE,
                    isOffline: true,
                    projIntro: PROJ_WALL_STREET_INTRO,
                    projType: TAG_FREELANCE,
                    roles: PROJ_WALL_STREET_KEY_ROLES,
                    tagName: "Freelance",
                    isScratchDev: true,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_CROSS_HELMET_ICON,
                    projTitle: PROJ_CROSS_HELMET,
                    projSubTitle: PROJ_CROSS_HELMET_DATE,
                    projIntro: PROJ_CROSS_HELMET_INTRO,
                    projType: TAG_FREELANCE,
                    roles: PROJ_CROSS_HELMET_KEY_ROLES,
                    tagName: "Freelance",
                    urlDetails: URL_CROSSHELMET,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_FOLX_ICON,
                    projTitle: PROJ_FOLX,
                    projSubTitle: PROJ_FOLX_DATE,
                    isOffline: true,
                    projIntro: PROJ_FOLX_INTRO,
                    projType: TAG_FREELANCE,
                    roles: PROJ_FOLX_KEY_ROLES,
                    tagName: "Freelance",
                    isScratchDev: true,
                  ),
                  ProjectCard(
                    iconUrl: PROJ_CROTON_ICON,
                    projTitle: PROJ_CROTON,
                    projSubTitle: PROJ_CROTON_DATE,
                    projIntro: PROJ_CROTON_INTRO,
                    projType: TAG_FREELANCE,
                    roles: PROJ_CROTON_KEY_ROLES,
                    tagName: "Freelance",
                    isScratchDev: true,
                    urlDetails: URL_CROTON,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String itemName;
  final bool isSelected;
  final Function callback;

  const MenuItem(this.itemName, this.isSelected, this.callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        hoverColor: Colors.white70.withOpacity(0.1),
        child: Text(
          itemName,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        onTap: () => callback());
  }
}

class ProjectCard extends StatelessWidget {
  final String iconUrl;
  final String projTitle;
  final String projSubTitle;
  final bool isOffline;
  final String projIntro;
  final int projType;
  final String tagName;
  final List<String>? roles;
  final bool isScratchDev;
  final String? urlDetails;

  const ProjectCard(
      {this.iconUrl = "",
      this.projTitle = "",
      this.projSubTitle = "",
      this.isOffline = false,
      this.projIntro = "",
      this.projType = TAG_FULLTIME,
      this.tagName = "",
      this.roles,
      this.isScratchDev = false,
      this.urlDetails,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: roles != null
                        ? RolesWidget(
                            roles: roles,
                            tagName: tagName,
                            projType: projType,
                          )
                        : ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 400),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Tag(
                                    tagType: projType,
                                    tagName: tagName,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(projIntro)
                                ])),
                    actions: [
                      Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (urlDetails != null) {
                                await launch(urlDetails!);
                              }
                              Navigator.pop(context, true);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(urlDetails == null
                                    ? 'Got it'
                                    : "App link"))),
                      )
                    ],
                  ));
        },
        child: Card(
          elevation: 4,
          child: Container(
            height: 120,
            width: 430,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                isScratchDev
                    ? Positioned(
                  top: 4,
                      right: 10,
                      child: Align(
                        child: BlinkingText('#ScratchDev'),
                        alignment: Alignment.topRight,
                      ),
                    )
                    : Container(),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        child: isOffline
                            ? Image.asset(iconUrl)
                            : Image.network(
                                iconUrl,
                              ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            projTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black87),
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            projSubTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.black45),
                            overflow: TextOverflow.fade,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )],
            ),
          ),
        ),
      ),
    );
  }
}

class RolesWidget extends StatelessWidget {
  final List<String>? roles;
  final String tagName;
  final int projType;

  const RolesWidget(
      {this.projType = TAG_FULLTIME, this.tagName = "", this.roles, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Tag(
            tagType: projType,
            tagName: tagName,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: roles!
                  .map<Widget>(
                    (option) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Wrap(children: [
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.double_arrow,
                                  color: drawerColor,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: option,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black87,
                                  ),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final int tagType;
  final String tagName;

  const TagItem({this.tagName = "", this.tagType = TAG_FULLTIME, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: pi / 18, child: Tag(tagName: tagName, tagType: tagType));
  }
}

class Tag extends StatelessWidget {
  final int tagType;
  final String tagName;

  const Tag({this.tagName = "", this.tagType = TAG_FULLTIME, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: (tagName.length.toDouble()+8) * 15,
      ),
      child: Card(
        color: expCardBg3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(4)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tagType == TAG_FULLTIME
                    ? Colors.blue.shade400
                    : tagType == TAG_FREELANCE
                        ? Colors.yellow.shade400
                        : Colors.green.shade400,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                tagType == TAG_FREELANCE
                    ? "Freelance"
                    : tagType == TAG_FULLTIME
                        ? "Fulltime in $tagName"
                        : "Personal",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: lightTextColr),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Divider(
        height: 10,
        color: Colors.grey,
      ),
    );
  }
}

class HashTags extends StatelessWidget {
  final List<String> tags;

  const HashTags({required this.tags, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Wrap(
          children: tags
              .map<Widget>((tag) => Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      "#$tag",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.deepPurpleAccent,
                          ),
                    ),
                  ))
              .toList()),
    );
  }
}

class BlinkingText extends StatefulWidget {
  final String _target;

  BlinkingText(this._target);

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      child: Text(
        widget._target,
        style: TextStyle(color: expCardBg1),
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}

//
// class ProjectDetails extends StatefulWidget {
//   final String iconUrl;
//   final String projTitle;
//   final String projSubTitle;
//   final bool isOffline;
//   final String projIntro;
//   final int projType;
//   final String? tagName;
//   final List<String>? roles;
//
//   const ProjectDetails(
//       {this.iconUrl = "",
//         this.projTitle = "",
//         this.projSubTitle = "",
//         this.isOffline = false,
//         this.roles,
//         this.projIntro = "",
//         this.projType = TAG_FULLTIME,
//         this.tagName,
//         Key? key})
//       : super(key: key);
//
//   @override
//   _ProjectDetailsState createState() => _ProjectDetailsState();
// }
//
// class _ProjectDetailsState extends State<ProjectDetails> {
//   bool isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         ProjectCard(
//           iconUrl: widget.iconUrl,
//           projType: widget.projType,
//           projIntro: widget.projIntro,
//           projTitle: widget.projTitle,
//           projSubTitle: widget.projSubTitle,
//           isOffline: widget.isOffline,
//           tagName: widget.tagName,
//         ),
//         Visibility(
//             visible: size.width < 800,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: 270),
//               child: Tag(
//                 tagName: widget.tagName,
//                 tagType: widget.projType,
//               ),
//             )),
//         ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: 800,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//                 child: Text(
//                   widget.projIntro,
//                   style: Theme.of(context).textTheme.headline5!.copyWith(
//                     color: Colors.black87,
//                   ),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//               if (widget.roles != null)
//                 ExpansionPanelList(
//                   expandedHeaderPadding: EdgeInsets.all(0),
//                   elevation: 0,
//                   children: [
//                     ExpansionPanel(
//                       backgroundColor: Colors.white.withOpacity(0.05),
//                       canTapOnHeader: true,
//                       headerBuilder: (context, isExpanded) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           child: Wrap(
//                             children: [
//                               Text(
//                                 MENU_ROLES,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline5!
//                                     .copyWith(
//                                   color: Colors.black87,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Icon(
//                                 this.isExpanded
//                                     ? Icons.keyboard_arrow_up
//                                     : Icons.keyboard_arrow_down,
//                                 color: Colors.cyan,
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                       body: RolesWidget(
//                         roles: widget.roles,
//                       ),
//                       isExpanded: isExpanded,
//                     ),
//                   ],
//                   expansionCallback: (index, isExpanded) {
//                     setState(() {
//                       this.isExpanded = !isExpanded;
//                     });
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ExperiencePg2 extends StatelessWidget {
//   const ExperiencePg2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: bgColor,
//       child: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 60,
//               ),
//               ProjectDetails(
//                 iconUrl: PROJ_MARROW_ICON,
//                 projTitle: PROJ_MARROW,
//                 projSubTitle: PROJ_MARROW_DATE,
//                 roles: PROJ_MARROW_KEY_ROLES,
//                 projIntro: PROJ_MARROW_INTRO,
//                 tagName: ORG_MARROW,
//               ),
//               HashTags(
//                 tags: [
//                   "User Data Analysis",
//                   "Setup Base Layer",
//                   "99.4% Crash Free Users",
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                   iconUrl: PROJ_ETEXT_ICON,
//                   projTitle: PROJ_ETEXT,
//                   projSubTitle: PROJ_ETEXT_DATE,
//                   projIntro: PROJ_ETEXT_INTRO,
//                   roles: PROJ_ETEXT_KEY_ROLES,
//                   tagName: ORG_CTS),
//               HashTags(
//                 tags: [
//                   "Started Android Development",
//                   "Layout revamping",
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                   iconUrl: PROJ_PLUGINS_ICON,
//                   projTitle: PROJ_PLUGINS,
//                   projSubTitle: PROJ_PLUGINS_DATE,
//                   isOffline: true,
//                   projIntro: PROJ_PLUGINS_INRO,
//                   tagName: ORG_CTS),
//               PaddedDivider(),
//               ProjectDetails(
//                 iconUrl: PROJ_WALL_STREET_ICON,
//                 projTitle: PROJ_WALL_STREET,
//                 projSubTitle: PROJ_WALL_STREET_DATE,
//                 isOffline: true,
//                 roles: PROJ_WALL_STREET_KEY_ROLES,
//                 projIntro: PROJ_WALL_STREET_INTRO,
//                 projType: TAG_FREELANCE,
//               ),
//               HashTags(
//                 tags: [
//                   "Developed from Scratch",
//                   "Android + iOS + TV",
//                   "Speed development",
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                 iconUrl: PROJ_CROSS_HELMET_ICON,
//                 projTitle: PROJ_CROSS_HELMET,
//                 projSubTitle: PROJ_CROSS_HELMET_DATE,
//                 projIntro: PROJ_CROSS_HELMET_INTRO,
//                 roles: PROJ_CROSS_HELMET_KEY_ROLES,
//                 projType: TAG_FREELANCE,
//               ),
//               HashTags(
//                 tags: [
//                   "Agora SDK",
//                   "Call Service",
//                   "Navigation Service",
//                   "Mapbox Integration",
//                   "What3Words",
//                   "Google Assistant Integration"
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                 iconUrl: PROJ_FOLX_ICON,
//                 projTitle: PROJ_FOLX,
//                 projSubTitle: PROJ_FOLX_DATE,
//                 isOffline: true,
//                 projIntro: PROJ_FOLX_INTRO,
//                 roles: PROJ_FOLX_KEY_ROLES,
//                 projType: TAG_FREELANCE,
//               ),
//               HashTags(
//                 tags: [
//                   "Development from scratch",
//                   "UI Optimisation",
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                 iconUrl: PROJ_CROTON_ICON,
//                 projTitle: PROJ_CROTON,
//                 projSubTitle: PROJ_CROTON_DATE,
//                 projIntro: PROJ_CROTON_INTRO,
//                 roles: PROJ_CROTON_KEY_ROLES,
//                 projType: TAG_FREELANCE,
//               ),
//               HashTags(
//                 tags: [
//                   "A weekend proj scaled to many parts of India",
//                   "Role based authentication",
//                   "Development + Support"
//                 ],
//               ),
//               PaddedDivider(),
//               ProjectDetails(
//                 iconUrl: PROJ_WHATS_EASY_ICON,
//                 projTitle: PROJ_WHATS_EASY,
//                 projSubTitle: PROJ_WHATS_EASY_DATE,
//                 isOffline: true,
//                 projIntro: PROJ_WHATS_EASY_INTRO,
//                 projType: TAG_PERSONAL,
//               ),
//               HashTags(
//                 tags: [
//                   "Made my life easier",
//                 ],
//               ),
//               PaddedDivider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
