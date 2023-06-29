import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrpay/routes/routes.dart';

import '../../controller/scan_qr_controlellers/scan_qr_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

final controller = Get.put(ScanQRController());

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanQrScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  RxBool isVisible = true.obs;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (barcode != null) {
      controller!.pauseCamera();
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Scan QR'),
        titleTextStyle: const TextStyle(
          color: Colors.white
        ),

      ),
      body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _bodyWidget1(context)
            )
    );
  }

  // body widget containing all widget elements
  _bodyWidget1(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            child: _scanQrCodeWidget(context),
          ),
          Positioned(
            bottom: 20,
            right: 5,
            left: 5,
            child: _iconButtonWidget(context),
          ),
        ],
      ),
    );
  }
  _scanQrCodeWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _buildQrViewWidget(context),
    );
  }

  _buildQrViewWidget(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.6,
          borderWidth: 8,
          borderLength: 20,
          borderRadius: 10,
          borderColor: CustomColor.primaryColor),
    );
  }

  void onQRViewCreated(QRViewController? controller) {
    setState(() => this.controller = controller);
    // this.controller = controller;
    controller!.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          // print(this.barcode!.code);
          readQr();
        }));

  }

  _iconButtonWidget(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.8),
      margin: EdgeInsets.only(
        bottom: Dimensions.marginSize,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.moneyTransferScreen);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black.withOpacity(0.2),
            child: SvgPicture.asset(
              Assets.edit,
              // ignore: deprecated_member_use
              color: CustomColor.whiteColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.moneyTransferScreen);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black.withOpacity(0.2),
            child: SvgPicture.asset(
              Assets.scanqr,
              // ignore: deprecated_member_use
              color: CustomColor.whiteColor,
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black.withOpacity(0.2),
          child: SvgPicture.asset(
            Assets.torch,
            // ignore: deprecated_member_use
            color: CustomColor.whiteColor,
          ),
        ),
      ]),
    );
  }
}





