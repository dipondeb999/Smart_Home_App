import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/components/custom_app_bar.dart';
import 'package:smart_home_app/components/smart_device_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // list of smart devices
  List mySmartDevices = [
    // [smartDeviceName, iconPath, powerStatus]
    ['Smart Light', 'assets/icons/lightbulb.png', false],
    ['Smart Ac', 'assets/icons/air-conditioner.png', false],
    ['Smart Tv', 'assets/icons/smart-tv.png', false],
    ['Smart Fan', 'assets/icons/air.png', false],
  ];

  // power button switch
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            const CustomAppBar(),
            // welcome home MITCH KOKO
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Welcome Home,',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                  Text(
                      'MITCH KOKO',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // smart devices + grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                  'Smart Devices',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(25),
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
