import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import '../../core/styles/app_colors.dart';
import 'button.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.fabSize, required this.onFabPressed});

  final double fabSize;
  final Function() onFabPressed;

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// Bottom Sheet Shape with icons
            ClipPath(
              clipper: BottomBarClipper(),
              child: Container(
                height: 68,
                width: double.infinity,
                color: AppColors.foreground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigationItem(
                      index: 0,
                      icon: 'assets/icons/home.svg',
                    ),
                    NavigationItem(
                      index: 1,
                      icon: 'assets/icons/gemini.svg',
                    ),

                    SizedBox(width: 70,),

                    NavigationItem(
                      index: 2,
                      icon: 'assets/icons/plan.svg',
                    ),
                    NavigationItem(
                      index: 3,
                      icon: 'assets/icons/profile.svg',
                    ),
                  ],
                ), // your nav icons
              ),
            ),

            /// Fab icon
            FabButton(
              fabSize: fabSize,
              onPressed: onFabPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class FabButton extends StatelessWidget {
  const FabButton({super.key, required this.fabSize, required this.onPressed});

  final double fabSize;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0, left: 0,
      bottom: fabSize/2.5,
      child: Center(
        child: SizedBox(
          width: fabSize, height: fabSize,
          child: InkWell(
            onTap: onPressed,

            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.add_rounded, color: AppColors.foreground, size: 28,),
            ),
          ),
        ),
      ),
    );
  }
}



class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = parseSvgPathData(
      'M365 32.5C365 50.4493 350.449 65 332.5 65H32.5C14.5508 65 0 50.4493 0 32.5C0 14.5507 14.5507 0 32.5 0H136.209C144.693 0 150.536 12.5159 150.536 21C150.536 37.5685 165.087 51 183.036 51C200.985 50.9998 215.536 37.5684 215.536 21C215.536 12.5157 221.379 0 229.863 0H332.5C350.449 0 365 14.5507 365 32.5Z',
    );

    // original SVG canvas size from Figma export
    const originalWidth = 365.0;
    const originalHeight = 65.0;

    final scaleX = size.width / originalWidth;
    final scaleY = size.height / originalHeight;

    final matrix = Matrix4.identity()..scale(scaleX, scaleY);
    return path.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
