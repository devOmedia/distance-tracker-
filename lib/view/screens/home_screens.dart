import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/screens/target_satter_screen.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/custom_button.dart';
import 'package:walkmate/view/widgets/navigator_extension.dart';
import '../../controller/providers/locations_provider.dart';

class HomeScreens extends ConsumerStatefulWidget {
  const HomeScreens({super.key});
  static const id = "/homeScreens";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreens> {
  _getTheStartLocation() async {
    await ref.read(LocationProvider).setStartLocation();
  }

  @override
  void initState() {
    _getTheStartLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final themePro = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        children: [
          //==========================>>> custom app bar
          Padding(
            padding: Kconstants.of(context)!.appPadding,
            child: CustomAppBar(
              ref: ref,
              iconColor: Kconstants.of(context)!.green,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Set your walking goal today!",
              style: Kconstants.of(context)!.header.copyWith(
                    color: themePro.isDarkMode
                        ? Kconstants.of(context)!.green
                        : Kconstants.of(context)!.black,
                    fontSize: size.width * 0.1,
                  ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                themePro.isDarkMode
                    ? SizedBox(
                        width: size.width,
                        child: Image.asset(
                          "assets/images/Dark_Image.png",
                          fit: BoxFit.fill,
                        ),
                      )
                    : SizedBox(
                        width: size.width,
                        child: Image.asset(
                          "assets/images/Image.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                Positioned(
                  bottom: 30,
                  left: 24,
                  right: 24,
                  child: CustomButtonWidget(
                    size: size,
                    title: "Get Started",
                    onPressed: () {
                      context.push(const TargetSatterScreen());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
