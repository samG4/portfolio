import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

Color bgColor = Colors.white;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenu = 0;
  static const int _ITEM_JOURNEY = 0;
  static const int _ITEM_ARTICLE = 1;
  static const int _ITEM_CONTACT = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: size.width < 1000 ? AppBar() : null,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Visibility(
                  visible: size.width >= 1000,
                  child: Expanded(
                    child: Material(
                      elevation: 20,
                      color: Colors.black12,
                      borderOnForeground: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Hi! I am Samrat.',
                            style: Theme.of(context).textTheme.headline4,
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
                                  MENU_JOURNEY, selectedMenu == _ITEM_JOURNEY,
                                  () {
                                setState(() {
                                  selectedMenu = _ITEM_JOURNEY;
                                });
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              MenuItem(
                                  MENU_ARTICLE, selectedMenu == _ITEM_ARTICLE,
                                  () {
                                setState(() {
                                  selectedMenu = _ITEM_ARTICLE;
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
                                });
                              }),
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
                  child: AboutMePg(),
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
    return Container(
      height: screenSize.height,
      color: bgColor,
      child: SingleChildScrollView(
        child: Column(
          children:[ Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(top: 30, bottom: 150),
                color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width,
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
                              style: GoogleFonts.heebo(fontSize: 28),
                            ),
                            Tooltip(
                              message: MY_INTRO_HEAD_HAJIMEMASHITE_TOOLTIP,
                              child: Text(
                                MY_INTRO_HEAD_HAJIMEMASHITE,
                                style: GoogleFonts.heebo(
                                    fontSize: 28,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            MY_INTRO_BODY,
                            style: GoogleFonts.abel(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
              Positioned(
                top: 300,
                child: Flex(
                  direction: screenSize.width > 800 ? Axis.horizontal: Axis.vertical,
                children: [
                  Card(
                    color: bgColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Icon(Icons.developer_mode_rounded, color: Colors.deepPurpleAccent, size: 50,),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Developer", style: GoogleFonts.workSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),),
                          SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 300
                            ),
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
                          Text("Languages I speak:", style: GoogleFonts.workSans(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20
                          ),),
                          SkillRow(
                              skillName: "Kotlin",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Java",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Dart",
                              yearSt: 2019
                          ),
                          SkillRow(
                              skillName: "Sql",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Typescript",
                              yearSt: 2021
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('--------------------', style: TextStyle(color: Colors.black26),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Dev Tools/Services:", style: GoogleFonts.workSans(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20
                          ),),
                          SizedBox(
                            height: 8,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 300
                            ),
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
                  ),
                  Card(
                    color: bgColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Icon(Icons.local_activity, color: Colors.deepPurpleAccent, size: 50,),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Activities", style: GoogleFonts.workSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),),
                          SizedBox(
                            height: 16,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 300
                            ),
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
                          Text("Languages I speak:", style: GoogleFonts.workSans(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20
                          ),),
                          SkillRow(
                              skillName: "Kotlin",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Java",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Dart",
                              yearSt: 2019
                          ),
                          SkillRow(
                              skillName: "Sql",
                              yearSt: 2018
                          ),
                          SkillRow(
                              skillName: "Typescript",
                              yearSt: 2021
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('--------------------', style: TextStyle(color: Colors.black26),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Dev Tools/Services:", style: GoogleFonts.workSans(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20
                          ),),
                          SizedBox(
                            height: 8,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 300
                            ),
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
                  )
                ],),
              )
            ],
          ), PaddedDivider(), ],
        ),
      ),
    );
  }
}

class SkillRow extends StatelessWidget {
  final String skillName;
  final int yearSt;
  const SkillRow({required this.skillName, required this.yearSt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 180
        ),
        child: Table(
          children: [
            TableRow(
              children: [
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
              ]
            )
          ],
        ),
      ),
    );
  }

  String getDate() {
    var year = DateTime.now().year - yearSt;
    if(year == 0) {
      return '6 months';
    }
    if(year == 1) {
      return '1 year';
    }
    return '$year years';
  }
}


class ContactPg extends StatelessWidget {
  const ContactPg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: bgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Text(
                CONTACT_ME_HEADING,
                style: GoogleFonts.ptSans(
                    textStyle: Theme.of(context).textTheme.headline3,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.deepPurpleAccent),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black87, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.deepPurpleAccent),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black87, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Message",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.deepPurpleAccent),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        maxLines: null,
                        minLines: 8,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black87, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(bgColor),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.0)))),
                child: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.deepPurpleAccent),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperiencePg extends StatelessWidget {
  const ExperiencePg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              ProjectDetails(
                iconUrl: PROJ_MARROW_ICON,
                projTitle: PROJ_MARROW,
                projSubTitle: PROJ_MARROW_DATE,
                roles: PROJ_MARROW_KEY_ROLES,
                projIntro: PROJ_MARROW_INTRO,
                tagName: ORG_MARROW,
              ),
              HashTags(
                tags: [
                  "User Data Analysis",
                  "Setup Base Layer",
                  "99.4% Crash Free Users",
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                  iconUrl: PROJ_ETEXT_ICON,
                  projTitle: PROJ_ETEXT,
                  projSubTitle: PROJ_ETEXT_DATE,
                  projIntro: PROJ_ETEXT_INTRO,
                  roles: PROJ_ETEXT_KEY_ROLES,
                  tagName: ORG_CTS),
              HashTags(
                tags: [
                  "Started Android Development",
                  "Layout revamping",
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                  iconUrl: PROJ_PLUGINS_ICON,
                  projTitle: PROJ_PLUGINS,
                  projSubTitle: PROJ_PLUGINS_DATE,
                  isOffline: true,
                  projIntro: PROJ_PLUGINS_INRO,
                  tagName: ORG_CTS),
              PaddedDivider(),
              ProjectDetails(
                iconUrl: PROJ_WALL_STREET_ICON,
                projTitle: PROJ_WALL_STREET,
                projSubTitle: PROJ_WALL_STREET_DATE,
                isOffline: true,
                roles: PROJ_WALL_STREET_KEY_ROLES,
                projIntro: PROJ_WALL_STREET_INTRO,
                projType: TAG_FREELANCE,
              ),
              HashTags(
                tags: [
                  "Developed from Scratch",
                  "Android + iOS + TV",
                  "Speed development",
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                iconUrl: PROJ_CROSS_HELMET_ICON,
                projTitle: PROJ_CROSS_HELMET,
                projSubTitle: PROJ_CROSS_HELMET_DATE,
                projIntro: PROJ_CROSS_HELMET_INTRO,
                roles: PROJ_CROSS_HELMET_KEY_ROLES,
                projType: TAG_FREELANCE,
              ),
              HashTags(
                tags: [
                  "Agora SDK",
                  "Call Service",
                  "Navigation Service",
                  "Mapbox Integration",
                  "What3Words",
                  "Google Assistant Integration"
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                iconUrl: PROJ_FOLX_ICON,
                projTitle: PROJ_FOLX,
                projSubTitle: PROJ_FOLX_DATE,
                isOffline: true,
                projIntro: PROJ_FOLX_INTRO,
                roles: PROJ_FOLX_KEY_ROLES,
                projType: TAG_FREELANCE,
              ),
              HashTags(
                tags: [
                  "Development from scratch",
                  "UI Optimisation",
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                iconUrl: PROJ_CROTON_ICON,
                projTitle: PROJ_CROTON,
                projSubTitle: PROJ_CROTON_DATE,
                projIntro: PROJ_CROTON_INTRO,
                roles: PROJ_CROTON_KEY_ROLES,
                projType: TAG_FREELANCE,
              ),
              HashTags(
                tags: [
                  "A weekend proj scaled to many parts of India",
                  "Role based authentication",
                  "Development + Support"
                ],
              ),
              PaddedDivider(),
              ProjectDetails(
                iconUrl: PROJ_WHATS_EASY_ICON,
                projTitle: PROJ_WHATS_EASY,
                projSubTitle: PROJ_WHATS_EASY_DATE,
                isOffline: true,
                projIntro: PROJ_WHATS_EASY_INTRO,
                projType: TAG_PERSONAL,
              ),
              HashTags(
                tags: [
                  "Made my life easier",
                ],
              ),
              PaddedDivider(),
            ],
          ),
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

class ProjectDetails extends StatefulWidget {
  final String iconUrl;
  final String projTitle;
  final String projSubTitle;
  final bool isOffline;
  final String projIntro;
  final int projType;
  final String? tagName;
  final List<String>? roles;

  const ProjectDetails(
      {this.iconUrl = "",
      this.projTitle = "",
      this.projSubTitle = "",
      this.isOffline = false,
      this.roles,
      this.projIntro = "",
      this.projType = TAG_FULLTIME,
      this.tagName,
      Key? key})
      : super(key: key);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ProjectTopPart(
          iconUrl: widget.iconUrl,
          projType: widget.projType,
          projIntro: widget.projIntro,
          projTitle: widget.projTitle,
          projSubTitle: widget.projSubTitle,
          isOffline: widget.isOffline,
          tagName: widget.tagName,
        ),
        Visibility(
            visible: size.width < 800,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 270),
              child: Tag(
                widget.tagName,
                tagType: widget.projType,
              ),
            )),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  widget.projIntro,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black87,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
              if (widget.roles != null)
                ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.all(0),
                  elevation: 0,
                  children: [
                    ExpansionPanel(
                      backgroundColor: Colors.white.withOpacity(0.05),
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Wrap(
                            children: [
                              Text(
                                MENU_ROLES,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.black87,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                this.isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.cyan,
                              )
                            ],
                          ),
                        );
                      },
                      body: RolesWidget(
                        roles: widget.roles,
                      ),
                      isExpanded: isExpanded,
                    ),
                  ],
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      this.isExpanded = !isExpanded;
                    });
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectTopPart extends StatelessWidget {
  final String iconUrl;
  final String projTitle;
  final String projSubTitle;
  final bool isOffline;
  final String projIntro;
  final int projType;
  final String? tagName;

  const ProjectTopPart(
      {this.iconUrl = "",
      this.projTitle = "",
      this.projSubTitle = "",
      this.isOffline = false,
      this.projIntro = "",
      this.projType = TAG_FULLTIME,
      this.tagName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 75,
          width: 75,
          child: isOffline
              ? Image.asset(iconUrl)
              : Image.network(
                  iconUrl,
                ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              projTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.black87),
            ),
            Text(
              projSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black45),
            )
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Visibility(
          visible: (MediaQuery.of(context).size.width) >= 800,
          child: TagItem(
            tagName,
            tagType: projType,
          ),
        )
      ],
    );
  }
}

class RolesWidget extends StatelessWidget {
  final List<String>? roles;

  const RolesWidget({this.roles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Column(
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
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: option,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
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
    );
  }
}

class TagItem extends StatelessWidget {
  final int tagType;
  final String? tagName;

  const TagItem(this.tagName, {this.tagType = TAG_FULLTIME, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: pi / 18, child: Tag(tagName, tagType: tagType));
  }
}

class Tag extends StatelessWidget {
  final int tagType;
  final String? tagName;

  const Tag(this.tagName, {this.tagType = TAG_FULLTIME, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  ? Colors.blueAccent
                  : tagType == TAG_FREELANCE
                      ? Colors.yellowAccent
                      : Colors.greenAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                tagName == null
                    ? tagType == TAG_FREELANCE
                        ? "Freelance"
                        : "Personal"
                    : tagName!,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
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
