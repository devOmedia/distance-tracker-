import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkmate/controller/providers/target_provider.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/sliderVerticalWidget.dart';

class CheckPointScreen extends ConsumerStatefulWidget {
  const CheckPointScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckPointScreenState();
}

class _CheckPointScreenState extends ConsumerState<CheckPointScreen> {
  late GoogleMapController mapController;
  bool _isMapLoading = true;
  LatLng? _currentPosition;

  //get  the current locations
  _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isMapLoading = false;
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
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
          //================================>> google map
          Expanded(
            child: _isMapLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 18.5,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("current"),
                        position: _currentPosition!,
                      ),
                    },
                  ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            height: size.height * 0.08,
            width: size.width - 42,
            decoration: BoxDecoration(
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
                  color: themePro.isDarkMode ? Kconst.offWhite : Kconst.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
