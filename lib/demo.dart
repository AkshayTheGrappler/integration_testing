import 'package:flutter/material.dart';
import 'package:integration_demo/main.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('demo'),
            GestureDetector(
              child: Text('main'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
