import 'package:flutter/material.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';
import 'package:orders_insights/app/core/widgets/default_text_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecapCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String number;
  final bool loading;
  const RecapCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.number,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: AppColors.naturalGray),
          boxShadow: const [
            BoxShadow(
              color: AppColors.naturalGray,
              blurRadius: 0.5,
              spreadRadius: 0.5,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDefaultText(
              title,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: AppDefaultText(
                    subTitle,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.naturalDarkGray,
                  ),
                ),
                AppDefaultText(
                  number,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
