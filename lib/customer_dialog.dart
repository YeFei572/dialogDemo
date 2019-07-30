import 'package:dialog01/my_dialog_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerDialog extends StatefulWidget {
  final String text;

  CustomerDialog({Key key, @required this.text}) : super(key: key);

  @override
  _CustomerDialogState createState() => _CustomerDialogState();
}

class _CustomerDialogState extends State<CustomerDialog> {
  bool beEdit = false;
  List<String> cuntries = <String>[
    '北京',
    '上海',
    '成都',
    '西安',
    '太原',
    '云南',
  ];

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
                          beEdit
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    child: Icon(CupertinoIcons.pen),
                                    onTap: () {
                                      print('eidt');
                                      setState(() {
                                        this.beEdit = true;
                                      });
                                      print(this.beEdit);
                                    },
                                  ),
                                ),
                          Container(
                            child: beEdit
                                ? InkWell(
                                    child: Text(
                                      '完成',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        this.beEdit = false;
                                      });
                                      print('完成');
                                    },
                                  )
                                : InkWell(
                                    child: Icon(CupertinoIcons.add_circled),
                                    onTap: () {
                                      print('添加');
                                      _addInputDialog(context);
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
                  child: MyDialogContent(
                    cuntries: cuntries,
                    beEdit: this.beEdit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addInputDialog(BuildContext _context) {
    String _name = "";
    showDialog<String>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext __context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('输入要修改的名称'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration:
                    new InputDecoration(labelText: '名称', hintText: '输入要修改的名称'),
                onChanged: (value) {
                  /// 当input里值有变动的时候，就会触发这个方法
                  _name = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                if (_name == "") {
                  print('名称不能为空字符串!');
                } else {
                  Navigator.of(context).pop();
                  print("你输入的名称是：$_name");
                  setState(() {
                    cuntries.add(_name);
                  });

                  /// 下面开始写接口 blabla....

                }
              },
            ),
          ],
        );
      },
    );
  }
}
