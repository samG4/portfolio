import 'dart:math';

import 'package:flutter/material.dart';

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

Color bgColor = Colors.white.withOpacity(0.95);

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
                            'Hi! I am Samrat',
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
                                color: Colors.white70,
                                width: 8.0,
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
                  child: Container(
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
