import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class ContainerDecoration {

  // rounded container, with foreground color
  static BoxDecoration roundedContainer(){
    return BoxDecoration(
      color: AppColors.foreground,
      borderRadius: BorderRadius.circular(18),
    );
  }

  // only bottom rounded container, with foreground color
  static BoxDecoration roundedContainerBottom(){
    return BoxDecoration(
      color: AppColors.foreground,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18)
      ),
    );
  }

}