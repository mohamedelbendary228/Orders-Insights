import 'package:flutter/material.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
