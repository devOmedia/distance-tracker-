import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';

class TargetSatterScreen extends ConsumerStatefulWidget {
  const TargetSatterScreen({super.key});
  static const id = "/targetSatterScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TargetSatterScreenState();
}

class _TargetSatterScreenState extends ConsumerState<TargetSatterScreen> {
  double sliderValue = 0;
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
                        "1000m",
                        style: Kconst.subHeader.copyWith(
                          color: themePro.isDarkMode
                              ? Kconst.offWhite
                              : Kconst.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Flexible topCardWidget(BuildContext context, Size size, Kconstants? Kconst) {
    return Flexible(
        child: Container(
      padding: Kconstants.of(context)!.appPading,
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
