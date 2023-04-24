import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/screens/checkpoint_screen.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/custom_button.dart';
import 'package:walkmate/view/widgets/navigator_extension.dart';

class TargetSatterScreen extends ConsumerStatefulWidget {
  const TargetSatterScreen({super.key});
  static const id = "/targetSatterScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TargetSatterScreenState();
}

class _TargetSatterScreenState extends ConsumerState<TargetSatterScreen> {
  double sliderValue = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Kconst = Kconstants.of(context);
    final Size size = MediaQuery.of(context).size;
    final themePro = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        children: [
          //top green card portion
          topCardWidget(context, size, Kconst),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Text(
                  "Add your target".toUpperCase(),
                  style: Kconst!.subHeader.copyWith(
                    color: themePro.isDarkMode ? Kconst.offWhite : Kconst.black,
                  ),
                ),
                //==========================>>> target text
                Text(
                  "${sliderValue.round()} m",
                  style: Kconst.subHeader.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themePro.isDarkMode ? Kconst.green : Kconst.black,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Slider(
                  activeColor: Kconst.green,
                  label: sliderValue.round().toString(),
                  divisions: 100,
                  min: 0,
                  max: 1000,
                  value: sliderValue,
                  thumbColor: Kconst.green,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0m",
                        style: Kconst.subHeader.copyWith(
                          color: themePro.isDarkMode
                              ? Kconst.offWhite
                              : Kconst.black,
                        ),
                      ),
                      Text(
                        "10000m",
                        style: Kconst.subHeader.copyWith(
                          color: themePro.isDarkMode
                              ? Kconst.offWhite
                              : Kconst.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                //=======================================>>> set limit button.
                sliderValue != 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: CustomButtonWidget(
                          size: size,
                          onPressed: () {
                            //add data to the fire store.
                            FirebaseFirestore.instance
                                .collection("targets")
                                .add({
                              "target": sliderValue,
                              "time": Timestamp.now(),
                            });

                            final snackBar = SnackBar(
                              content: const Text('You have set your limit.'),
                              backgroundColor: Kconst.green,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            context.pushReplacement(const CheckPointScreen());
                          },
                          title: "Set Limit",
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          //warning snackbar.
                          const snackBar = SnackBar(
                            content: Text('Please set a limit first'),
                            backgroundColor: Colors.redAccent,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: disableButton(size, Kconst, themePro),
                      ), // disable button.

                //===================================>> >history button
                SizedBox(height: size.height * 0.02),
                Container(
                  height: size.height * 0.08,
                  width: size.width - 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Kconst.green),
                  ),
                  child: Center(
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.035,
                        color: themePro.isDarkMode
                            ? Kconst.offWhite
                            : Kconst.green,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container disableButton(
      Size size, Kconstants Kconst, ThemeNotifier themePro) {
    return Container(
      height: size.height * 0.08,
      width: size.width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: const Color(0xffD3D3D3),
        // /  border: Border.all(color: Kconst.green),
      ),
      child: Center(
        child: Text(
          'Set Limit',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.035,
            color: Kconst.black,
          ),
        ),
      ),
    );
  }

  Flexible topCardWidget(BuildContext context, Size size, Kconstants? Kconst) {
    return Flexible(
        child: Container(
      padding: Kconstants.of(context)!.appPadding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: Kconstants.of(context)!.green,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ==================================>>  custom app bar
          CustomAppBar(
            ref: ref,
            iconColor: Kconstants.of(context)!.offWhite,
            isWhiteBackground: false,
          ),
          //==================================>>
          SizedBox(height: size.height * 0.06),
          Text(
            "Set Your Walking Goal Now!",
            style: Kconstants.of(context)!.header.copyWith(
                  color: Kconstants.of(context)!.offWhite,
                  fontSize: size.width * 0.1,
                ),
          ),
          //===============================>>
          SizedBox(height: size.height * 0.04),
          Text(
            "Your determination and effort is inspiring. Keep pushing yourself to reach new heights.",
            maxLines: 3,
            style: Kconst!.subHeader.copyWith(
              color: Kconst.offWhite,
              wordSpacing: 1.5,
              fontSize: size.width * 0.035,
            ),
          ),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    ));
  }
}

class CustomSliderTheme extends StatelessWidget {
  final Widget child;

  const CustomSliderTheme({
    required this.child,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 14;
    const double tickMarkRadius = 8;

    const activeColor = Color.fromRGBO(255, 0, 77, 1);
    const inactiveColor = Color.fromRGBO(109, 114, 120, 1);

    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 5,

        /// Thumb
        thumbShape: RoundSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),

        /// Tick Mark
        tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: tickMarkRadius),

        /// Inactive
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,

        /// Active
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
      ),
      child: child,
    );
  }
}
