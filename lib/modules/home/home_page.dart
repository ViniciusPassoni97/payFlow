import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playflow/modules/home_controller.dart';
import 'package:playflow/shared/themes/app_colors.dart';
import 'package:playflow/shared/themes/app_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
              height: 152,
              color: AppColors.primary,
              child: Center(
                child: ListTile(
                  title: Text.rich(TextSpan(
                      text: 'Olá, ',
                      style: AppTextStyles.titleRegular,
                      children: [
                        TextSpan(
                          text: "Passoni",
                          style: AppTextStyles.buttonBoldBackground,
                        )
                      ])),
                  subtitle: Text('Matenha suas contas em dia',
                      style: AppTextStyles.captionShape),
                  trailing: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ))),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  homeController.setPage(0);
                  setState(() {});
                },
                color: AppColors.primary,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/barcode_scanner");
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.description_outlined),
                onPressed: () {
                  homeController.setPage(1);
                  setState(() {});
                },
                color: AppColors.body,
              ),
            ],
          )),
    );
  }
}
