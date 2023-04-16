// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/city_api.dart';
import 'package:klicks_app/screen/qrcode/qr_overlay.dart';
import 'package:klicks_app/screen/select_car/select_car.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  QrCodeScreen({Key? key}) : super(key: key);
  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  getCompanyWithMall(id) async {
    var response = await CityApi.getcompanywithmall(id);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CarSelect(
                  mall: response[0]!,
                  company: response[1]!,
                  city: response[2]!,
                  // uid: user!.id!,
                )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) async {
                  if (barcode.rawValue == null) {
                    Fluttertoast.showToast(
                        msg: 'Error in scanning');
                  } else {
                    final String? code = barcode.rawValue!;
                    var company_id = code!.split("=").last;
                    getCompanyWithMall(company_id);
                  }
                }),
            QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          ],
        ));
  }
}
