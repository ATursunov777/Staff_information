import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:staff_info/const.dart';
import 'package:staff_info/models/workerList.dart';

class DetScreens extends StatefulWidget {
  final int index;
  DetScreens({Key key, this.index}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetScreens> {
  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Color(0xffE5E5E5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Container(
                height: 400,
                padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Позвонить",
                          style: ConstTextStyle.style24,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.close),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(32)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    buildNSF(ConstTextStyle.style20Wb, MainAxisAlignment.start,
                        Alignment.centerLeft),
                    SizedBox(
                      height: 32,
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(list.list[widget.index].mainNum);
                      },
                      child: buildPhoneInfo(
                          "Основной Телефон", list.list[widget.index].mainNum),
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(
                          list.list[widget.index].workNum,
                        );
                      },
                      child: buildPhoneInfo(
                        "Рабочий Телефон",
                        list.list[widget.index].workNum,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _callnumber(list.list[widget.index].whatsNum);
                      },
                      child: buildPhoneInfo(
                        "WhatsApp",
                        list.list[widget.index].whatsNum,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  WorkerList list = new WorkerList();
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/shape.png",
                  width: 22,
                  height: 22,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                list.list[widget.index].image,
                width: 114,
                height: 114,
              ),
            ),
            SizedBox(height: 22),
            buildNSF(ConstTextStyle.style24, MainAxisAlignment.center,
                Alignment.center),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(list.list[widget.index].position,
                  style: ConstTextStyle.style20bl),
            ),
            SizedBox(
              height: 44,
            ),
            buildInfo(
              "Направление",
              list.list[widget.index].nav,
            ),
            buildInfo(
              "Отдел",
              list.list[widget.index].dep,
            ),
            buildInfo(
              "Email",
              list.list[widget.index].email,
            ),
            buildInfo(
              "Дата рождения",
              list.list[widget.index].birthDay,
            ),
            buildInfo(
              "Email",
              list.list[widget.index].email,
            ),
            InkWell(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: buildPhoneInfo(
                    "Основной Телефон", list.list[widget.index].mainNum)),
            InkWell(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: buildPhoneInfo(
                "Рабочий Телефон",
                list.list[widget.index].workNum,
              ),
            ),
            InkWell(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: buildPhoneInfo(
                "WhatsApp",
                list.list[widget.index].whatsNum,
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget buildNSF(TextStyle style, MainAxisAlignment mainAxisAlignment,
      Alignment alignment) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("${list.list[widget.index].name}  ", style: style),
            ),
          ],
        ),
        Container(
          alignment: alignment,
          child: Text("${list.list[widget.index].surName}  ", style: style),
        ),
      ],
    );
  }

  void _callnumber(String number1) async {
    String number = number1;
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  Widget buildPhoneInfo(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfo(title, info),
        Icon(
          Icons.phone,
          color: Colors.green,
        )
      ],
    );
  }

  Widget buildInfo(
    String title,
    String info,
  ) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 14,
        ),
        Text(
          title,
          style: ConstTextStyle.style14,
        ),
        SizedBox(height: 4),
        Text(info.toString(), style: ConstTextStyle.style20),
        SizedBox(
          height: 14,
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
        )
      ]),
    ]);
  }
}
