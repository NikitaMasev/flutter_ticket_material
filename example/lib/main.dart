import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_material_example/example_page.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Material',
      debugShowCheckedModeBanner: false,
      initialRoute: ExamplePage.routeName,
      routes: {
        ExamplePage.routeName: (ctx) => ExamplePage(),
      },
    );
  }
}
