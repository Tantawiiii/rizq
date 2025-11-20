import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bounce/bounce.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/shared_widgets/search_field.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/router/route_manager.dart';


class MapFilterScreen extends StatefulWidget {
  const MapFilterScreen({super.key});

  @override
  State<MapFilterScreen> createState() => _MapFilterScreenState();
}

class _MapFilterScreenState extends State<MapFilterScreen> {
  GoogleMapController? _mapController;
  LatLng _center = const LatLng(33.5138, 36.2765);
  double _radiusKm = 8.0;
  double _zoom = 10.0;
  bool _isLoadingLocation = false;
  final TextEditingController _searchController = TextEditingController();
  final Set<Circle> _circles = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _updateCircle();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _isLoadingLocation = false);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _isLoadingLocation = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => _isLoadingLocation = false);
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
        _isLoadingLocation = false;
      });
      _updateCircle();
      _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_center, _zoom));
    } catch (e) {
      setState(() => _isLoadingLocation = false);
    }
  }

  void _updateCircle() {
    _circles.clear();
    _circles.add(
      Circle(
        circleId: const CircleId('search_radius'),
        center: _center,
        radius: _radiusKm * 1000,
        fillColor: AppColors.primaryColor.withOpacity(0.2),
        strokeColor: AppColors.primaryColor,
        strokeWidth: 2,
      ),
    );
    setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    _center = position.target;
    _zoom = position.zoom;
    _updateCircle();
  }

  void _onRadiusChanged(double value) {
    setState(() {
      _radiusKm = value;
    });
    _updateCircle();
  }

  void _zoomIn() {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Stack(
        children: [

          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: _zoom,
            ),
            onCameraMove: _onCameraMove,
            circles: _circles,
            markers: {
              Marker(
                markerId: const MarkerId('center_marker'),
                position: _center,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue,
                ),
              ),
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
          ),

          Positioned(
            top: 48.h,
            left: 14.w,
            right: 14.w,
            child: Row(
              children: [
                Bounce(
                  onTap: () => RouteManager.pop(),
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.w,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                4.horizontalSpace,
                Expanded(
                  child: SearchField(
                    controller: _searchController,
                    hintText: AppTexts.searchForRegion,
                    showSuffixIcon: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 120.h,
            left: 14.w,
            right: 14.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppTexts.numberOfKilometers} : ${_radiusKm.toInt()} ${AppTexts.km}',
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.verticalSpace,
                  Slider(
                    value: _radiusKm,
                    min: 1.0,
                    max: 100.0,
                    divisions: 99,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.textFieldBorderColor,
                    onChanged: _onRadiusChanged,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 24.h,
            left: 16.w,
            child: Bounce(
              onTap: _getCurrentLocation,
              child: Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _isLoadingLocation
                    ? Padding(
                        padding: EdgeInsets.all(16.w),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.my_location,
                        size: 24.w,
                        color: AppColors.primaryColor,
                      ),
              ),
            ),
          ),

          Positioned(
            bottom: 24.h,
            right: 16.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Bounce(
                  onTap: _zoomIn,
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      size: 24.w,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Container(
                  width: 48.w,
                  height: 1,
                  color: AppColors.textFieldBorderColor,
                ),
                Bounce(
                  onTap: _zoomOut,
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 24.w,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
