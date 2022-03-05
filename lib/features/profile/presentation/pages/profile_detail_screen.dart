import 'package:flutter/material.dart';
import 'package:gym_test_project/common/styles/gradient.dart';
import 'package:gym_test_project/features/profile/presentation/widgets/profile_info_widget.dart';

class ProfileDetailPage extends StatelessWidget {

  const ProfileDetailPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
            decoration: appGradient
        ),
        title: const Text('Данные профиля'),
        centerTitle: true,
      ),
      body: Container(
        decoration: appGradient,
        child: const Center(
            child: ProfileInfo(),
        ),
      ),
    );
  }
}
