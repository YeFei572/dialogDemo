import 'package:flutter/material.dart';

import 'customer_dialog.dart';
import 'date_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Demo(),
      routes: {
        "/ToDatePage": (context) => DatePage(),
      },
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomerDialog();
                  },
                );
              },
              child: Text('对话框'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return DatePage();
                }));
              },
              child: Text('日期'),
            )
          ],
        ),
      ),
    );
  }
}
