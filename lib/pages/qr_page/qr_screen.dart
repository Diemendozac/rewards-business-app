
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loyalty_business_project/utils/qr_camera_request.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  static String routeName = '/qr_screen';
  const QRViewScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {

  Barcode? result;
  QRViewController? controller;
  final QRProvider qrProvider = QRProvider();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isDetecting = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {


    if(result != null ) {
      controller?.dispose();
      controller!.pauseCamera();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        dynamic jsonData = jsonDecode(result!.code!);
        result = null;
        if (jsonData['action'] != null && jsonData['id'] != null ) {
          String action = jsonData['action'];
          String id = jsonData['id'].toString();
          Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
          Navigator.of(context).pushNamed(action, arguments: id);
        }
      });

    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.flash_on,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: () async {await controller?.toggleFlash();
                    setState(() {});},
                ),
                GestureDetector(
                  onTap: () {
                    if(isDetecting) {
                      controller?.pauseCamera();
                      setState(() {
                        isDetecting = false;
                      });
                      return;
                    }
                    controller?.resumeCamera();
                    setState(() {
                      isDetecting = true;
                    });

                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 48,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: () {
                    // Add your code to handle manual input here
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).colorScheme.primary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}