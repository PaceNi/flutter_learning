// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hello_rectangle/category.dart';
import 'package:hello_rectangle/unit.dart';

final _backgroundColor = Colors.green[100];
// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }
  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(
        Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake,
          units: _retrieveUnitList(_categoryNames[i]),
        ),
      );
    }
    // TODO: Create a list view of the Categories
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: _backgroundColor,
      title: Center(
        child: Text(
          "Unit Converter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
