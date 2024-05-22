
import 'package:disease_detector/screen/components/homepage_components.dart';
import 'package:disease_detector/screen/components/loader.dart';
import 'package:disease_detector/screen/result_detail.dart';
import 'package:disease_detector/utils/utils.dart';
import 'package:disease_detector/view_models/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeVm = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Crop Disease Detector",
          style: Utils.getHeaderStyle(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerText(),
            Utils.verticalPadding(space: 8.h),
            messageText(),
            Utils.verticalPadding(space: 30.h),
            imageContainer(homeVm.imageFile),
            Utils.verticalPadding(space: 30.h),
            customButton(
              onBtnTap: (){
                if (homeVm.imageFile == null) {
                  Utils.showSnackBar(context, title: "Error", message: "An image of the crop to be inspected must be captured");
                  return;
                }
                homeVm.generateResponse(context).then((value) {
                  if (value) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ResultDetail()));
                  }
                }).onError((error, stackTrace) => Utils.showSnackBar(context, title: "Error", message: error.toString()));

              },
              color: Colors.deepPurpleAccent,
              title: "Submit",
              titleColor: Colors.white,
              isLoading: homeVm.isLoading
            ),
            const Spacer(),
            Text("Powered by Gemini AI",
              style: Utils.getLabelStyle(color: Colors.grey, fontSize: 10.sp),
            ),
            Utils.verticalPadding(space: 12.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          tooltip: "Take picture",
          onPressed: (){
          homeVm.captureImage();
          },
          child: Icon(Icons.camera, size: 24.sp, color: Colors.white,),
      ),
    );
  }
}
