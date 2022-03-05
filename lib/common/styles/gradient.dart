import 'package:flutter/material.dart';
import 'package:gym_test_project/common/styles/app_colors.dart';

const appGradient = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.mainBackgroundGradientStart,
            AppColors.mainBackgroundGradientEnd,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
    );
