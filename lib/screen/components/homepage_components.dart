import 'dart:io';

import 'package:disease_detector/screen/components/loader.dart';
import 'package:disease_detector/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

headerText() {
  return Text(
    "Take a picture of the crop",
    style: Utils.getHeaderStyle(color: Colors.black54),
    textAlign: TextAlign.center,
  );
}

messageText() {
  return Text(
    "Please make sure the crop is in focus and in clear view to identify the disease accurately.",
    style: Utils.getBodyStyle(color: Colors.black54),
    textAlign: TextAlign.center,
  );
}

line(double width) {
  return Container(
    height: 4.h,
    width: width,
    color: Colors.deepPurple,
  );
}

imageContainer(File? image) {
  return Container(
    height: 200.h,
    width: 200.h,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 0)
        ]
    ),
    child: image == null
        ? Center(
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.deepPurple,
              size: 32.sp,
            ),
          )
        : Image.file(
            image,
            fit: BoxFit.cover,
            height: 120.h,
            width: 120.h,
          ),
  );
}

customButton(
    {VoidCallback? onBtnTap,
    Color? color,
      Color? titleColor,
    String? title,
    bool isLoading = false}) {
  return InkWell(
    onTap: onBtnTap,
    child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.r),
              color: color ?? Colors.white,
              boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: -1)
      ]),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: isLoading
          ? loader(color: Colors.white)
          : Text(
        title ?? "",
        style: Utils.getBodyStyle(color: titleColor ?? Colors.white),
      ),
    ),
  );
}

 dataTitleInfo({String? title, String? causativeOrganism}) {
  return Column(
    children: [
      Row(
        children: [
          Text("Disease Name", style: Utils.getHeaderStyle(color: Colors.black87), ),
          Utils.horizontalPadding(space: 6.w),
          Icon(Icons.info_outline, color: Colors.deepPurple, size: 18.sp,)
        ],
      ),
      Utils.verticalPadding(space: 8.h),
      Container(
        width: 1.sw,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                  spreadRadius: -1)
            ]),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child:  Column(
          children: [
            rowWidget("Name :", title),
            rowWidget("Organism :", causativeOrganism),
          ],
        )
      ),

    ],
  );
 }

extraComments({String? comments}) {
  return Column(
    children: [
      Row(
        children: [
          Text("Comments", style: Utils.getHeaderStyle(color: Colors.black87), ),
          Utils.horizontalPadding(space: 6.w),
          Icon(Icons.insert_comment_outlined, color: Colors.deepPurple, size: 18.sp,)
        ],
      ),
      Utils.verticalPadding(space: 8.h),
      Container(
        width: 1.sw,
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: -1)
              ]),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child:  Text(comments ?? "", style: Utils.getBodyStyle(color: Colors.grey), )
      ),
    ],
  );
}

controlMeasures({String? title, IconData? iconData, List<String>? controls }) {
  return Column(
    children: [
      Row(
        children: [
          Text(title ?? "Control Measures", style: Utils.getHeaderStyle(color: Colors.black87), ),
          Utils.horizontalPadding(space: 6.w),
          Icon(iconData ?? Icons.warning_amber, color: Colors.deepPurple, size: 16.sp,)
        ],
      ),
      Utils.verticalPadding(space: 8.h),
      Container(
        width: 1.sw,
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: -1)
              ]),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child:  Column(
            children: controls!.map((control) => Row(
              children: [
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Utils.horizontalPadding(space: 8.w),
                Text(control, style: Utils.getBodyStyle(color: Colors.grey), )
              ],
            )).toList(),
          )
      ),
    ],
  );
}

 rowWidget(String? title, String? data) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 0.4.sw,
          child: Text(title ?? "", style: Utils.getBodyStyle(color: Colors.black87), )),
      Expanded(child: Text(data ?? "", style: Utils.getBodyStyle(color: Colors.grey), ))
    ],
  );
 }

titleText() {
  return Row(
    children: [
      line(30.w),
      Utils.horizontalPadding(space: 8.w),
      Text(
        "Ai Crop Disease Detector",
        style: Utils.getHeaderStyle(),
      ),
      Utils.horizontalPadding(space: 8.w),
      line(100.w),
    ],
  );
}
