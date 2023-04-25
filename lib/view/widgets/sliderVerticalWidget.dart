import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/target_provider.dart';
import 'package:walkmate/model/constants/constants.dart';

class SliderVerticalWidget extends ConsumerStatefulWidget {
  const SliderVerticalWidget({super.key, required this.size});
  final Size size;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SliderVerticalWidgetState();
}

class _SliderVerticalWidgetState extends ConsumerState<SliderVerticalWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    const double min = 0;
    double max = ref.watch(targetProvider).target;
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
              onChanged: (value) {
                setState(() => this.value = value);
                ref.read(targetProvider).addCheckPint(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
