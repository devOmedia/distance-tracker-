import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/model/constants/constants.dart';

class TargetSatterScreen extends ConsumerStatefulWidget {
  const TargetSatterScreen({super.key});
  static const id = "/targetSatterScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TargetSatterScreenState();
}

class _TargetSatterScreenState extends ConsumerState<TargetSatterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
                right: Radius.circular(16),
              ),
              color: Kconstants.of(context)!.green,
            ),
          ))
        ],
      ),
    );
  }
}
