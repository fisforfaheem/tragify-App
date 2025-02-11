import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:iot_ui_challenge/model/device_model.dart';
import 'package:iot_ui_challenge/pages/home/widgets/devices.dart';
import 'package:iot_ui_challenge/utils/string_to_color.dart';

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {


  List<DeviceModel> devices = [
    DeviceModel(
        name: 'Ring Device',
        isActive: true,
        color: "#ff5f5f",
        icon: 'assets/svg/light.svg'),
    DeviceModel(
        name: 'Tragify',
        isActive: true,
        color: "#7739ff",
        icon: 'assets/svg/ac.svg'),
    DeviceModel(
        name: 'Selected Device',
        isActive: true,
        color: "#7739ff",
        icon: 'assets/svg/ac.svg'),
  ];

  Future Blue() async {
    var scanDevices = flutterBlue.scan().listen((scanResult) {

    });
    return print(scanDevices);
  }
  // Future<void> main() async {
  //   print('Fetching user order...');
  //   print(await Blue());
  // }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hi,Kate",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                        minRadius: 16,
                        backgroundImage: AssetImage("assets/images/user.webp"))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "A total of 4 devices",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Living Room",
                                    style: TextStyle(
                                        height: 1.1,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.grey[300],
                                size: 30,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                                padding: const EdgeInsets.only(top: 10, bottom: 20),

                                gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                                itemCount: devices.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Devices(
                                    name: devices[index].name,
                                    svg: devices[index].icon,
                                    color: devices[index].color.toColor(),
                                    isActive: devices[index].isActive,
                                    onChanged: (val) {
                                      setState(() {
                                        devices[index].isActive =
                                        !devices[index].isActive;
                                      });
                                    },
                                  );
                                }),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/images/cadrant.png"),
                                Transform.rotate(
                                  angle: ((pi/180) * -1),
                                  child: Image.asset(
                                    "assets/images/compass.png",
                                    scale: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}