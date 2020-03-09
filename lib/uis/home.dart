import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:driver/uis/app_settings.dart';
import 'package:driver/uis/widgets/cab.dart';
import 'package:driver/uis/widgets/deliveries.dart';
import 'package:driver/uis/widgets/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // These are the segment controllers
  final Map<int, Widget> tabs = const <int, Widget>{
    0: Text('Cab'),
    // 1: Text('Deliveries'),
    2: Text('Other services'),
  };
  // These are the pages to appear in the main app page to be switched to and from
  final Map<int, Widget> segments = <int, Widget>{
    0: DriverHome(),
    // 1: Deliveries(),
    2: Services()
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("X-Boda"),
          backgroundColor: Colors.transparent,
          trailing: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Icon(CupertinoIcons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => SettingsScreen()));
              })),
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: segments[sharedValue],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    // shadowColor: CupertinoTheme.of(context).primaryColor,
                    CupertinoSlidingSegmentedControl<int>(
                  thumbColor: CupertinoTheme.of(context).primaryColor,
                  children: tabs,
                  onValueChanged: (int newValue) {
                    setState(() {
                      sharedValue = newValue;
                    });
                  },
                  groupValue: sharedValue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
