# ticket_material

A ticket view widget.

## Platform compatibility

Plugin was tested on following platforms:

* Android;
* IOS.

## Usage

To use this plugin, add `universal_navigation` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Getting Started

Add dependency into pubspec.yaml.

```yaml
dependencies:
  ticket_material:
```

Create a page.

```dart
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
          child: TicketMaterial(
            height: 150,
            colorBackground: Colors.blue,
            leftChild: _buildLeft(),
            rightChild: _buildRight(),
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
```

Result: ![demo](https://user-images.githubusercontent.com/22840281/100226439-d1385e00-2f30-11eb-90c1-38886f746edd.png)

Full example with *ticket_material* you can check by this [link](https://github.com/NikitaMasev/flutter_ticket_material/tree/main/example).
