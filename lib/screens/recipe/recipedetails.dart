import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetails extends StatelessWidget {
  final recipeModel;
  RecipeDetails({
    @required this.recipeModel,
  });
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: DarkTheme.black,
      body: SlidingUpPanel(
        color: DarkTheme.black,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        minHeight: (size.height / 2),
        maxHeight: size.height / 1.2,
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: DarkTheme.grey3,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                recipeModel['title'],
                style: TextStyle(
                    color: DarkTheme.gold, fontSize: 15, fontFamily: 'Bebas'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                recipeModel['sourceName'],
                style: TextStyle(
                  color: DarkTheme.white,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    FlutterIcons.heart_circle_mco,
                    color: DarkTheme.pink,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipeModel['spoonacularScore'].toString(),
                    style: TextStyle(color: DarkTheme.grey5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FlutterIcons.timer_mco,
                    color: DarkTheme.grey5,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    recipeModel['readyInMinutes'].toString() + '\'',
                    style: TextStyle(color: DarkTheme.grey5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: DarkTheme.grey4,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    recipeModel['servings'].toString() + ' Servings',
                    style: TextStyle(color: DarkTheme.grey5),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: DarkTheme.grey5,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(
                            text: "Ingredients".toUpperCase(),
                          ),
                          Tab(
                            text: "Preparation".toUpperCase(),
                          ),
                          Tab(
                            text: "Nutrition".toUpperCase(),
                          ),
                        ],
                        labelColor: DarkTheme.gold,
                        indicator: DotIndicator(
                          color: DarkTheme.grey5,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelColor: DarkTheme.grey4,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: DarkTheme.grey5,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Ingredients(recipeModel: recipeModel),

                            recipeModel['analyzedInstructions'].isEmpty == false
                                ? Preparation(recipeModel: recipeModel)
                                :
                                // : Container(
                                //     child: Text('Please Visit: '+ recipeModel['sourceUrl'].toString()),
                                //   ),
                                ElevatedButton(
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(
                                          recipeModel['sourceUrl'].toString());
                                    }),
                                    child: const Text('Launch in browser'),
                                  ),
                            // Container(
                            //   child: Text("Nutrition Tab"),
                            // ),
                            Nutrients(recipeModel: recipeModel)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: recipeModel['image'],
                    child: ClipRRect(
                      child: Image(
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        fit: BoxFit.cover,
                        image: NetworkImage(recipeModel['image']),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Icon(
                  FlutterIcons.bookmark_outline_mco,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          openYoutbe();
        },
        elevation: 10,
        label: Text('Watch Video'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  openYoutbe() {
    String url1 =
        "https:youtube.com/results?search_query=" + recipeModel['title'];
    launch(url1);
  }
}

setState(Null Function() param0) {}

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    @required this.recipeModel,
  }) : super(key: key);

  final recipeModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: recipeModel['nutrition']['ingredients'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      '⚫️ ' +
                          (recipeModel['nutrition']['ingredients'][index]
                                      ['amount'] *
                                  recipeModel['servings'])
                              .toString() +
                          ' ' +
                          recipeModel['nutrition']['ingredients'][index]
                              ['unit'] +
                          ' ' +
                          (recipeModel['nutrition']['ingredients'][index]
                              ['name']),
                      style: TextStyle(color: DarkTheme.grey6),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: DarkTheme.grey2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Nutrients extends StatelessWidget {
  const Nutrients({
    Key key,
    @required this.recipeModel,
  }) : super(key: key);

  final recipeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: recipeModel['nutrition']['nutrients'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      '⚫️ ' +
                          (recipeModel['nutrition']['nutrients'][index]
                              ['name']) +
                          ": " +
                          (recipeModel['nutrition']['nutrients'][index]
                                  ['amount'])
                              .toString() +
                          ' ' +
                          recipeModel['nutrition']['nutrients'][index]['unit'] +
                          ' ',
                      style: TextStyle(color: DarkTheme.grey6),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: DarkTheme.grey2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Preparation extends StatelessWidget {
  const Preparation({
    Key key,
    @required this.recipeModel,
  }) : super(key: key);

  final recipeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: recipeModel['analyzedInstructions'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      recipeModel['analyzedInstructions'][0]['steps'][0]
                          ['step'],
                      style: TextStyle(color: DarkTheme.grey6),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.black.withOpacity(0.3));
              },
            ),
          ],
        ),
      ),
    );
  }
}
