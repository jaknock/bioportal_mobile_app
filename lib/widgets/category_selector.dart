import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Phylogenetic Tree',
    'Case Locations',
    'Data Grid',
    'Cases per Date Received'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 114.0,
        color: Colors.blue,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.white60,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }));
    // return Image(image: AssetImage('assets/7.png'));
  }
}
