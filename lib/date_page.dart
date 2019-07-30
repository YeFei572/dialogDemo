import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePage extends StatefulWidget {
  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  var resultDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2019, 7, 30),
                      maxTime: DateTime(2020, 5, 5), onChanged: (date) {
                    print('confir $date');
                  }, onConfirm: (date) {
                    setState(() {
                      this.resultDate = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.zh);
                },
                child: Text('获取日期'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                DateTime.now().toString(),
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                resultDate.toString(),
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
