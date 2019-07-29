import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerDialog extends StatefulWidget {
  String text;

  CustomerDialog({Key key, @required this.text}) : super(key: key);

  @override
  _CustomerDialogState createState() => _CustomerDialogState();
}

class _CustomerDialogState extends State<CustomerDialog> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 340.0,
          height: 480.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 55,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '主要分类',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: InkWell(
                              child: Icon(CupertinoIcons.pen),
                              onTap: () {
                                print('eidt');
                              },
                            ),
                          ),
                          Container(
                            child: InkWell(
                              child: Icon(CupertinoIcons.add_circled),
                              onTap: () {
                                print('添加');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 14,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '全部',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                      ListTile(
                        title: Text('123'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
