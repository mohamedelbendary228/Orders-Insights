import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/values/app_assets.dart';
import 'package:orders_insights/app/core/widgets/default_text_widget.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool hasBackButton;
  final VoidCallback? onTapBackButton;

  const CustomAppBar({
    super.key,
    required this.text,
    this.hasBackButton = false,
    this.onTapBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.appBarHeader,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          top: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (hasBackButton)
                  InkWell(
                    onTap: () {
                      if (onTapBackButton != null) {
                        onTapBackButton!();
                      } else {
                        Get.back();
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                const SizedBox(width: 15),
                AppDefaultText(
                  text,
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
