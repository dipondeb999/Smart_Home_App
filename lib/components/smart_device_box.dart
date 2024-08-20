import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: powerOn? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // icon
            Image.asset(
              iconPath,
              color: powerOn? Colors.white : Colors.black,
              height: 65,
            ),
            // smart device name + switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                        smartDeviceName,
                      style: TextStyle(
                        color: powerOn? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
