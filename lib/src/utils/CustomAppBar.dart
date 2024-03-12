import 'package:edus/src/utils/AppCircleButton.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  const CustomAppBar(
      {super.key,
        this.title = '',
        this.titleWidget,
        this.leading,
        this.showActionIcon = false,
        this.onMenuActionTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                child: Text(title),
              )
                  : Center(
                child: titleWidget,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading?? Transform.translate(offset: const Offset(-14, 0),
                  child: const BackButton(),
                ),
                if(showActionIcon)
                  Transform.translate(offset: const Offset(10, 0),
                    child: AppCircleButton(
                      onTap: onMenuActionTap,
                      child: const Icon(Icons.menu),
                    ),)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
      double.maxFinite,80
  );
}
