import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:light/settings.dart';
import 'package:torch_controller/torch_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> popMenuItems = [
    "Remove Ads",
    "More Apps",
    "Send feedback",
    "Follow us",
    "Invite friends to the app",
    "Settings"
  ];

  int lightMode = 0;
  bool isLightOn = false;
  Color bgColor = const Color.fromARGB(255, 56, 37, 180);

  var controller = TorchController();

  var color1 = const Color.fromARGB(255, 56, 37, 180);
  var color2 = Colors.white;
  var color3 = const Color.fromARGB(255, 39, 11, 143);

  // for getting percentage of battery
  Battery battery = Battery();
  int? _batteryLevel;

  Future<void> _getLevel() async {
    final int batteryLevel = await battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    _getLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: !(lightMode == 1 && isLightOn)
          ? AppBar(
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.battery_6_bar,
                      color: Colors.yellow,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "$_batteryLevel %",
                      style: const TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              actions: [
                PopupMenuButton(
                  onSelected: (value) {
                    if (value == 5) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Settings()));
                    }
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 32,
                  ),
                  color: color3,
                  itemBuilder: (context) => [
                    for (var i = 0; i < popMenuItems.length; i++)
                      PopupMenuItem(
                          value: i,
                          child: Text(
                            popMenuItems[i],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )),
                  ],
                )
              ],
            )
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              onPressed: () {
                if (lightMode == 0) {
                  controller.toggle();
                  setState(() {
                    isLightOn = !isLightOn;
                  });
                }

                if (lightMode == 1) {
                  setState(() {
                    isLightOn = !isLightOn;
                    bgColor = isLightOn ? color2 : color1;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Icon(
                  Icons.power_settings_new,
                  size: 50,
                  color: isLightOn ? Colors.yellow : Colors.white,
                ),
              ),
            ),
            const Spacer(),
            !isLightOn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lightMode = 0;
                          });
                        },
                        child: Icon(
                          Icons.flashlight_on,
                          size: 70,
                          color: lightMode == 0
                              ? Colors.yellow
                              : const Color.fromARGB(255, 82, 140, 239),
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lightMode = 1;
                          });
                        },
                        child: Icon(
                          Icons.phone_android,
                          size: 70,
                          color: lightMode == 1
                              ? Colors.yellow
                              : const Color.fromARGB(255, 82, 140, 239),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 70,
                  ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
