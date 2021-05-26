import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'recipe/recipedetails.dart';

class RecipeDetails extends StatelessWidget {
  final recipeModel; //==recipelist[index]
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
      body: SlidingUpPanel(
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
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                recipeModel['title'],
                style: _textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                recipeModel['sourceName'],
                style: _textTheme.caption,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    FlutterIcons.heart_circle_mco,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipeModel['spoonacularScore'].toString(),
                    // style: _textTheme.caption,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FlutterIcons.timer_mco,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    recipeModel['readyInMinutes'].toString() + '\'',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    recipeModel['servings'].toString() + ' Servings',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
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
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.black,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Container(
                            //   child: Text("Ingredients Tab"),
                            // ),
                            Ingredients(
                                recipeModel:
                                    recipeModel['extendedIngredients']),

                            recipeModel['analyzedInstructions'].isEmpty == false
                                ? //Preparation(recipeModel: recipeModel):
                                Container(
                                    child: Text('Please Visit: ' +
                                        recipeModel['sourceUrl'].toString()),
                                  )
                                : FlatButton(
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(
                                          recipeModel['sourceUrl'].toString());
                                    }),
                                    child: const Text('Launch in browser'),
                                  ),
                            Container(
                              child: Text("Nutrition Tab"),
                            ),
                            //Nutrients(recipeModel: recipeModel)
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
              itemCount: recipeModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      '⚫️ ' +
                          (recipeModel[index]['amount'] )
                              .toString() +
                          ' ' +
                          recipeModel[index]['unit'] +
                          ' ' +
                          (recipeModel[index]['name']),
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
              itemCount: recipeModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: Text(
                      '⚫️ ' +
                          (recipeModel[index]['name']) +
                          ": " +
                          (recipeModel[index]['amount']).toString() +
                          ' ' +
                          recipeModel[index]['unit'] +
                          ' ',
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
