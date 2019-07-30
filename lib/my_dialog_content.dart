import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogContent extends StatefulWidget {
  final List<String> cuntries;
  final bool beEdit;
  MyDialogContent({Key key, this.cuntries, this.beEdit}) : super(key: key);
  @override
  _MyDialogContentState createState() => _MyDialogContentState();
}

class _MyDialogContentState extends State<MyDialogContent> {
  List<Widget> res = [];

  _getContent() {
    if (widget.cuntries.length == 0) {
      return Container();
    }
    return SingleChildScrollView(
      child: Column(
        children: List<ListTile>.generate(widget.cuntries.length, (int index) {
          return widget.beEdit
              ? ListTile(
                  title: Text(widget.cuntries[index]),
                  leading: InkWell(
                    onTap: () {
                      print('删除');
                      _delItem(index);
                    },
                    child: Icon(CupertinoIcons.delete),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      print('更新');
                      _updateItem(context, index);
                    },
                    child: Icon(Icons.dehaze),
                  ),
                )
              : ListTile(
                  title: Text(widget.cuntries[index]),
                );
        }),
      ),
    );
  }

  _updateItem(BuildContext context, int index) {
    _showInputDialog(context, index);
  }

  _delItem(int index) {
    setState(() {
      widget.cuntries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }

  void _showInputDialog(BuildContext _context, int index) {
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
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                autofocus: true,
                decoration:
                    InputDecoration(labelText: '名称', hintText: '输入要修改的名称'),
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
                    widget.cuntries[index] = _name;
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
