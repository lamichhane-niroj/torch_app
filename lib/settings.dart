import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> generalMenu = [
    "Show status bar",
    "Switch Sound",
    "Turn on at startup",
    "Turn off at exit",
  ];

  List<String> aboutMenu = [
    "Invite friends to the app",
    "More Apps",
    "Send feedback",
    "Light"
  ];

  List<bool> values = [false, false, false, false];

  List<String> followMenu = ["Facebook", "Instagram", "Twitter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 37, 180),
      appBar: AppBar(
          title: const Text(
        "Settings",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      )),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "General",
              style: TextStyle(color: Colors.yellow, fontSize: 16),
            ),
          ),
          const ListTile(
            title: Text(
              "Remove Ads",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              "One payment to remove ads forever",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => CheckboxListTile(
                  checkColor: Colors.black,
                  activeColor: Colors.yellow,
                  side: const BorderSide(color: Colors.grey),
                  title: Text(
                    generalMenu[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    values[index] ? "Enabled" : "Disabled",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  value: values[index],
                  onChanged: (value) {
                    setState(() {
                      values[index] = value!;
                    });
                  })),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "About",
              style: TextStyle(color: Colors.yellow, fontSize: 16),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      aboutMenu[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: index == 3
                        ? const Text(
                            "Version 2.18",
                            style: TextStyle(color: Colors.grey),
                          )
                        : null,
                  )),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Follow us",
              style: TextStyle(color: Colors.yellow, fontSize: 16),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      followMenu[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
        ],
      ),
    );
  }
}
