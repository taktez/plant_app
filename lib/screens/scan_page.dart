import 'package:flutter/material.dart';
import 'package:plant/constant/constant.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:plant/screens/camera_page.dart';
import 'package:torch_controller/torch_controller.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  MobileScannerController mobileController = MobileScannerController();

  // function permission android
  Future<void> requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      // دوربین فعال است
    } else {
      // دسترسی به دوربین رد شده است
    }
  }

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
    // درخواست دسترسی به دوربین
  }

  //END function permission android
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            //App Bar
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // favorite/////////////
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.share_rounded,
                      size: 24,
                      color: Constant.primaryColor,
                    ),
                  ),
                  //Close///////////////////////////
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constant.primaryColor.withOpacity(0.15),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: Constant.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Image///////////////////////////////
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraPage(),
                    ));
              },
              child: Image.asset(
                'assets/images/code-scan.png',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "برای اسکن گیاهان. کلیک کنید",
              style: TextStyle(
                  color: Constant.primaryColor,
                  fontFamily: 'YekanBakh',
                  fontSize: 24),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
