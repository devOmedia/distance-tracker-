import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkmate/controller/providers/locations_provider.dart';
import 'package:walkmate/controller/providers/target_provider.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/sliderVerticalWidget.dart';
import 'package:location/location.dart';

class CheckPointScreen extends ConsumerStatefulWidget {
  const CheckPointScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckPointScreenState();
}

class _CheckPointScreenState extends ConsumerState<CheckPointScreen> {
  late GoogleMapController mapController;
  bool _isMapLoading = true;
  LocationData? _currentLocation;
  //final Completer<GoogleMapController> _controller = Completer();

  //get  the current locations
  void getCurrentLocation() async {
    // //get the permission
    // geo.LocationPermission permission;
    // permission = await geo.Geolocator.requestPermission();

    //get the locations
    Location location = Location();

    location.getLocation().then((location) {
      _currentLocation = location;
    });
    //GoogleMapController googleMapController = await _controller.future;

    //set the current location on location change .
    // location.onLocationChanged.listen((event) {
    //   _currentLocation = event;
    //   _isMapLoading = false; // stop the loading
    //
    //   googleMapController.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //         zoom: 13.5,
    //         target: LatLng(event.latitude!, event.longitude!),
    //       ),
    //     ),
    //   );
    //
    //   setState(() {});
    // });

    setState(() {
      _isMapLoading = false;
    });
  }

  @override
  void initState() {
   // getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Kconst = Kconstants.of(context);
    final themePro = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ///TOP SLIDER WIDGET
          Flexible(
            child: Container(
              padding: Kconstants.of(context)!.appPadding,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Colors.purple.shade300, //Kconstants.of(context)!.green,
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
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //====================================>>> slider
                      SliderVerticalWidget(size: size),
                      // ====================================>>> complete and target show widget
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Completed",
                            style: Kconstants.of(context)!.header.copyWith(
                                  color: Kconstants.of(context)!.offWhite,
                                  fontSize: size.width * 0.045,
                                ),
                          ),
                          Text(
                            "${ref.watch(targetProvider).completedLimit.round()} m",
                            style: Kconstants.of(context)!.subHeader.copyWith(
                                  color: Kconstants.of(context)!.white,
                                  fontSize: size.width * 0.08,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Target",
                            style: Kconstants.of(context)!.header.copyWith(
                                  color: Kconstants.of(context)!.offWhite,
                                  fontSize: size.width * 0.045,
                                ),
                          ),
                          Text(
                            "${ref.watch(targetProvider).target.round()} m",
                            style: Kconstants.of(context)!.subHeader.copyWith(
                                  color: Kconstants.of(context)!.white,
                                  fontSize: size.width * 0.08,
                                ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
          ///================================>> google map
          Expanded(
            child: _isMapLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      ),
                      zoom: 13.5,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("current"),
                        position: LatLng(
                          _currentLocation!.latitude!,
                          _currentLocation!.longitude!,
                        ),
                      ),
                      if (ref.watch(LocationProvider).startLocation != null)
                        Marker(
                          markerId: const MarkerId("starting location"),
                          position: ref.watch(LocationProvider).startLocation!,
                        ),
                    },
                  ),
          ),
          SizedBox(height: size.height * 0.02),
          GestureDetector(
            onTap: ref.watch(targetProvider).completedLimit.round() == ref.watch(targetProvider).target.round() ? () {
                log("----------------------------------->>>>");
    } : null,
            child: Container(
              height: size.height * 0.08,
              width: size.width - 42,
              decoration: BoxDecoration(
                color: themePro.isDarkMode ? ref.watch(targetProvider).completedLimit.round()
                    == ref.watch(targetProvider).target.round() ?
                Kconst?.green : Kconst?.black : ref.watch(targetProvider).completedLimit.round()
                    == ref.watch(targetProvider).target.round() ?
                Kconst?.green : Kconst?.offWhite,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Kconst!.green),
              ),
              child: Center(
                child: Text(
                  'Mark As Completed',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.035,
                    color:  themePro.isDarkMode ? ref.watch(targetProvider).completedLimit.round() == ref.watch(targetProvider).target.round() ? Kconst?.black : Kconst?.green: Kconst.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
