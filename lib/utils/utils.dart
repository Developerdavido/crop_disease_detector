

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {


  static verticalPadding({double space = 16}) => SizedBox(height: space,);

  static horizontalPadding({double space = 16}) => SizedBox(width: space,);




  static TextStyle getHeaderStyle({Color? color}) {
    return GoogleFonts.lato(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black.withOpacity(0.8),
    );
  }

  static TextStyle getBodyStyle({Color? color}) {
    return GoogleFonts.lato(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black.withOpacity(0.8),
    );
  }

  static TextStyle getTitleStyle({Color? color}) {
    return GoogleFonts.lato(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black.withOpacity(0.8),
    );
  }

  static TextStyle getLabelStyle({Color? color, double? fontSize}) {
    return GoogleFonts.lato(
      fontSize: fontSize ?? 12.sp,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black.withOpacity(0.8),
    );
  }


 static showSnackBar(BuildContext context, {String? title, String? message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: getLabelStyle(color: Colors.white),),
            verticalPadding(space: 5.h),
            Text(message!, style: getLabelStyle(color: Colors.white),),
          ],
        ),
          backgroundColor: Colors.deepPurple,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
        ));
  }
}