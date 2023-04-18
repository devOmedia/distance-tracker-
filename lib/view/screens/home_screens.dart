import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Scaffold(
      body: Padding(
        padding: Kconstants.of(context)!.appPading,
        child: Column(
          children: [
            CustomAppBar(ref: ref),
          ],
        ),
      ),
    );
  }
}
