import 'package:flutter/material.dart';
import 'package:walkmate/model/constants/constants.dart';

class SliderVerticalWidget extends StatefulWidget {
  const SliderVerticalWidget(
      {super.key, required this.size, required this.target});
  final Size size;
  final double target;

  @override
  _SliderVerticalWidgetState createState() => _SliderVerticalWidgetState();
}

class _SliderVerticalWidgetState extends State<SliderVerticalWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    const double min = 0;
    double max = widget.target;
    final size = widget.size;
    final Kconst = Kconstants.of(context);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: size.width * 0.15,
        thumbShape: const RoundSliderThumbShape(),
        overlayShape: SliderComponentShape.noOverlay,
        valueIndicatorShape: SliderComponentShape.noOverlay,
        trackShape: const RoundedRectSliderTrackShape(),
        tickMarkShape: const RoundSliderTickMarkShape(),

        /// ticks in between
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: 10,
              activeColor: Kconst!.offWhite,
              label: value.round().toString(),
              onChanged: (value) => setState(() => this.value = value),
            ),
          ),
        ],
      ),
    );
  }
}
