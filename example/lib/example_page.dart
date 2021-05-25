import 'package:flutter/material.dart';
import 'package:ticket_material/ticket_material.dart';

class ExamplePage extends StatefulWidget {
  static final routeName = '/example';

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final colorBg = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TicketMaterial(
                height: 150,
                colorBackground: Colors.blue,
                leftChild: _buildLeft(),
                rightChild: _buildRight(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TicketMaterial(
                  height: 150,
                  colorBackground: Colors.blue,
                  radiusBorder: 12,
                  leftChild: _buildLeft(),
                  rightChild: _buildRight(),
                  tapHandler: () {
                    print('ON TAP');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeft() {
    return Container(
      child: Center(
        child: Text('LEFT PART'),
      ),
    );
  }

  Widget _buildRight() {
    return Container(
      child: Center(
        child: Icon(Icons.airplanemode_active),
      ),
    );
  }
}
