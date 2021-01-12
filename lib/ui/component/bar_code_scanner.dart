import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  Barcode result;
  bool isFlashOn = false;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BarCode');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(child: _buildQrView(context)),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Text(
              L10n.of(context).scanCode,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: IconButton(
              icon: isFlashOn
                  ? const Icon(Icons.flash_off, color: Colors.white, size: 32)
                  : const Icon(Icons.flash_on, color: Colors.white, size: 32),
              onPressed: () {
                if (controller != null) {
                  controller.toggleFlash();
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          Future.microtask(
              () => controller?.updateDimensions(qrKey, scanArea: scanArea));
          return false;
        },
        child: SizeChangedLayoutNotifier(
            key: const Key('qr-size-notifier'),
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                this.controller = controller;
                controller.scannedDataStream.listen((scanData) {
                  controller.pauseCamera();
                  Get.back(result: scanData.code);
                });
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea,
              ),
            )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
