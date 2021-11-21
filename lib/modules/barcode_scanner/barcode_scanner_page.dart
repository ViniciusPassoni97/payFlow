import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:playflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:playflow/shared/themes/app_colors.dart';
import 'package:playflow/shared/themes/app_text_style.dart';
import 'package:playflow/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:playflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();
  void initState() {
    controller.getAvailableCameras();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
              quarterTurns: 1,
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    title: Text(
                      "Escaneie o código de barras do boleto",
                      style: AppTextStyles.buttonBackground,
                    ),
                    leading: BackButton(color: AppColors.background),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Container(color: Colors.black),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(color: Colors.transparent),
                      ),
                      Expanded(
                        child: Container(color: Colors.black),
                      )
                    ],
                  ),
                  bottomNavigationBar: SetLabelButtons(
                    primaryLabel: 'Inserir Código do Boleto',
                    primaryOnPressed: () {},
                    secundaryLabel: 'Adicionar da Galeria',
                    secundaryOnPressed: () {},
                  ))),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidgets(
                  title: "Não foi possível identificar um código de barras",
                  primaryOnPressed: () {},
                  secundaryOnPressed: () {
                    controller.getAvailableCameras();
                  },
                  subtitle:
                      "Tente escanear novamente ou digite o código do boleto",
                  primaryLabel: "Escanear Novamente",
                  secundaryLabel: "Digitar código",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
