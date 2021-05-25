import 'package:flutter/material.dart';
import 'package:staff_info/models/workerList.dart';

import 'det_screens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WorkerList workerList = new WorkerList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        padding: EdgeInsets.only(left: 16),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 65,
                ),
                child: Text(
                  "Сотрудники",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[350],
                    hintText: "Поиск",
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "У кого сегодня день рождения",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              Container(
                height: 80,
                child: ListView.builder(
                  itemCount: workerList.list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        creatImage(workerList.list[i].image, i),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "У кого завтра день рождения",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          creatImage(workerList.list[i].image, i)
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Все сотрудники",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 500,
                padding: EdgeInsets.only(right: 16),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: workerList.list.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          createAllWorkers(
                              workerList.list[i].image,
                              workerList.list[i].name,
                              workerList.list[i].surName),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget creatImage(String image, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetScreens(index: index)));
      },
      child: Image.asset(
        image,
        height: 70,
        width: 70,
      ),
    );
  }

  Widget createAllWorkers(String images, String name, String surName) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            images,
            width: 60,
            height: 60,
          ),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(surName),
            ],
          ),
          Icon(
            Icons.phone,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
