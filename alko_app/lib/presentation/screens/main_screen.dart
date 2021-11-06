import 'package:alko_app/constants/routes.dart';
import 'package:alko_app/presentation/screens/product_general_info_screen.dart';
import 'package:alko_app/presentation/screens/product_main_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final PreferredSizeWidget appBar;
  const MainScreen({Key? key, required this.appBar}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showDetails = false;
  final Duration _animDuration = const Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // var padding = MediaQuery.of(context).padding;
    // double safeAreaHeight = height -
    //     padding.top -
    //     padding.bottom -
    //     widget.appBar.preferredSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new",
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, Routes.addProductPage);
        },
        child: const Icon(Icons.add),
      ),
      //appBar: widget.appBar,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              AnimatedOpacity(
                duration: _animDuration,
                opacity: showDetails ? 1.0 : 0,
                child: const ProductGeneralInfo(),
              ),
              AnimatedPositioned(
                duration: _animDuration,
                curve: Curves.fastOutSlowIn,
                height: showDetails ? 250 : height,
                width: showDetails ? 250 : width,
                left: showDetails ? height / 5 : 0,
                bottom: showDetails ? 50 : -20,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                    int sensitivity = 8;
                    if (details.delta.dx > sensitivity) {
                      // Right Swipe
                      setState(() {
                        showDetails = true;
                      });
                    } else if (details.delta.dx < -sensitivity) {
                      //Left Swipe
                      setState(() {
                        showDetails = false;
                      });
                    }
                  },
                  child: const SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: ProductMainScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
