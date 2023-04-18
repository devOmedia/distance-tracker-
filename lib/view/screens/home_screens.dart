import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/screens/widgets/custom_app_bar.dart';

class HomeScreens extends ConsumerStatefulWidget {
  const HomeScreens({super.key});
  static const id = "/homeScreens";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final themePro = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        children: [
          //==========================>>> custom app bar
          Padding(
            padding: Kconstants.of(context)!.appPading,
            child: CustomAppBar(ref: ref),
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: Kconstants.of(context)!.appPading,
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
                  left: 16,
                  right: 16,
                  child: CustomButtonWidget(
                    size: size,
                    title: "Get Started",
                    onPressed: () {},
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

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.size,
    required this.onPressed,
    required this.title,
  });

  final Size size;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.08,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Kconstants.of(context)!.green,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Kconstants.of(context)!.offWhite,
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}
