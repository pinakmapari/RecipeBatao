import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/database.dart';
import 'dart:math';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String itemName;
  String quantifier = 'g';
  String location = 'Fridge';
  String itemQty;
  int date = 01, month = 01, year = 2021;
  var color;
  @override
  void initState() {
    super.initState();
    color = generate();
  }

  var colors = [
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.deepOrange,
    Colors.cyan,
    Colors.amber,
    Colors.redAccent
  ];
  final _random = new Random();

  List<int> years = [2021, 2022, 2023, 2024, 2025, 2026, 2027];
  List<int> months = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12];
  List<int> days = [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  List<String> qtyTypes = ['g', 'kg', 'mg', 'mL', 'L', 'packets', 'pieces'];
  List<String> locs = ['Fridge', 'Freezer', 'Dry'];
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: DarkTheme.black,
      appBar: AppBar(
        backgroundColor: DarkTheme.grey1,
        title: Text(
          'Add Item',
          style: TextStyle(
            fontFamily: 'Bebas',
            color: DarkTheme.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 45,
              ),
              Divider(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Enter Item Name',
                    style: TextStyle(
                      color: DarkTheme.gold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 30.0,
                    child: TextField(
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontFamily: 'Bebas',
                        letterSpacing: 1.0,
                      ),
                      onChanged: (text) {
                        itemName = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Palette.bisque),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Enter Item Expiry Date',
                    style: TextStyle(
                      color: DarkTheme.gold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Theme(
                        data: Theme.of(buildContext).copyWith(
                          canvasColor: Palette.bgrey,
                        ),
                        child: DropdownButton<int>(
                          value: date,
                          items: days.map((int dropDownItem) {
                            return DropdownMenuItem<int>(
                              value: dropDownItem,
                              child: Text(
                                dropDownItem.toString(),
                                style: TextStyle(
                                  color: DarkTheme.white,
                                  fontFamily: 'Bebas',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (int newVal) {
                            setState(() {
                              date = newVal;
                            });
                          },
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Palette.bgrey,
                        ),
                        child: DropdownButton<int>(
                          value: month,
                          items: months.map((int dropDownItem) {
                            return DropdownMenuItem<int>(
                              value: dropDownItem,
                              child: Text(
                                dropDownItem.toString(),
                                style: TextStyle(
                                  color: DarkTheme.white,
                                  fontFamily: 'Bebas',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (int newVal) {
                            setState(() {
                              month = newVal;
                              print(month);
                            });
                          },
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Palette.bgrey,
                        ),
                        child: DropdownButton<int>(
                          value: year,
                          items: years.map((int dropDownItem) {
                            return DropdownMenuItem<int>(
                                value: dropDownItem,
                                child: Text(
                                  dropDownItem.toString(),
                                  style: TextStyle(
                                    color: DarkTheme.white,
                                    fontFamily: 'Bebas',
                                  ),
                                ));
                          }).toList(),
                          onChanged: (int newVal) {
                            setState(() {
                              year = newVal;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Enter quantity',
                    style: TextStyle(
                      color: DarkTheme.gold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 75.0,
                        height: 30.0,
                        child: TextField(
                          style: TextStyle(
                            color: DarkTheme.white,
                            fontFamily: 'Bebas',
                            letterSpacing: 1.0,
                          ),
                          onChanged: (text) {
                            itemQty = text;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Palette.bgrey,
                    ),
                    child: DropdownButton<String>(
                      value: quantifier,
                      items: qtyTypes.map((String dropDownItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: TextStyle(
                              color: DarkTheme.white,
                              fontFamily: 'Bebas',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newVal) {
                        setState(() {
                          quantifier = newVal;
                          print(quantifier);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Enter storage location',
                    style: TextStyle(
                      color: DarkTheme.gold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Palette.bgrey,
                    ),
                    child: DropdownButton<String>(
                      value: location,
                      items: locs.map((String dropDownItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: TextStyle(
                              color: DarkTheme.white,
                              fontFamily: 'Bebas',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newVal) {
                        setState(() {
                          location = newVal;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: DarkTheme.grey2,
                onPressed: () {
                  String fdate = date.toString() +
                      '/' +
                      month.toString() +
                      '/' +
                      year.toString();
                  String fqty = itemQty + ' ' + quantifier;
                  String c = color.toString();
                  Database().addItem(itemName, fdate, fqty, location, c);
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: DarkTheme.gold,
                    fontFamily: 'Bebas',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color generate() {
    var color = colors[_random.nextInt(colors.length)];
    return color;
  }
}
