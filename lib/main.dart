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
                Expanded(
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
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white.withOpacity(0.9),
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
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_WALL_STREET_ICON,
                              projTitle: PROJ_WALL_STREET,
                              projSubTitle: PROJ_WALL_STREET_DATE,
                              isOffline: true,
                              roles: PROJ_WALL_STREET_KEY_ROLES,
                              projIntro: PROJ_WALL_STREET_INTRO,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_CROSS_HELMET_ICON,
                              projTitle: PROJ_CROSS_HELMET,
                              projSubTitle: PROJ_CROSS_HELMET_DATE,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_FOLX_ICON,
                              projTitle: PROJ_FOLX,
                              projSubTitle: PROJ_FOLX_DATE,
                              isOffline: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_CROTON_ICON,
                              projTitle: PROJ_CROTON,
                              projSubTitle: PROJ_CROTON_DATE,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_WHATS_EASY_ICON,
                              projTitle: PROJ_WHATS_EASY,
                              projSubTitle: PROJ_WHATS_EASY_DATE,
                              isOffline: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_ETEXT_ICON,
                              projTitle: PROJ_ETEXT,
                              projSubTitle: PROJ_ETEXT_DATE,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
                            ProjectDetails(
                              iconUrl: PROJ_PLUGINS_ICON,
                              projTitle: PROJ_PLUGINS,
                              projSubTitle: PROJ_PLUGINS_DATE,
                              isOffline: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 60),
                              child: Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ),
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

class ProjectDetails extends StatelessWidget {
  final String iconUrl;
  final String projTitle;
  final String projSubTitle;
  final bool isOffline;
  final List<String>? roles;
  final String projIntro;

  const ProjectDetails(
      {this.iconUrl = "",
      this.projTitle = "",
      this.projSubTitle = "",
      this.isOffline = false,
      this.roles,
      this.projIntro = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  projIntro,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black87,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
              if (roles != null)
                RolesWidget(
                  roles: roles,
                )
            ],
          ),
        ),
      ],
    );
  }
}

class RolesWidget extends StatelessWidget {
  final List<String>? roles;
  const RolesWidget({this.roles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          MENU_ROLES,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black87),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: roles!
                    .map<Widget>(
                      (option) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(children: [
                          Icon(
                            Icons.double_arrow,
                            color: Colors.cyan,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 700),
                            child: Text(
                              option,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black87,
                                  ),
                            ),
                          ),
                        ]),
                      ),
                    )
                    .toList()),
          ],
        ),
      ],
    );
  }
}
