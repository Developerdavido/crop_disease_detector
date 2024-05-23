import 'package:disease_detector/screen/components/homepage_components.dart';
import 'package:disease_detector/view_models/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class ResultDetail extends StatefulWidget {
  const ResultDetail({super.key});

  @override
  State<ResultDetail> createState() => _ResultDetailState();
}

class _ResultDetailState extends State<ResultDetail> {

  HomeProvider? homeVm;

  @override
  void initState() {
    // TODO: implement initState
    homeVm = context.read<HomeProvider>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeVm?.clearData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Text("Result",
              style: Utils.getHeaderStyle(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
              child: SizedBox(
                height: 1.sh,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: vm.currentDetectorModel!.isDiseased!,
                        child: dataTitleInfo(title: vm.currentDetectorModel?.diseaseName, causativeOrganism: vm.currentDetectorModel?.causativeOrganism),
                    ),
                    Utils.verticalPadding(space: 20.h),
                    Visibility(
                      visible: vm.currentDetectorModel!.isDiseased!,
                      child: controlMeasures(title: "Control Measures", iconData: Icons.warning_amber, controls: vm.currentDetectorModel?.eradicativeMeasures),),
                    Utils.verticalPadding(space: 20.h),
                    Visibility(
                      visible: vm.currentDetectorModel!.isDiseased!,
                      child: controlMeasures(title: "Chemical control", iconData: Icons.fire_extinguisher_rounded, controls: vm.currentDetectorModel?.chemicalControl),),
                    Utils.verticalPadding(space: 20.h),
                    Visibility(
                      visible: vm.currentDetectorModel!.isDiseased!,
                      child: controlMeasures(title: "Chemical products", iconData: Icons.propane_tank_outlined, controls: vm.currentDetectorModel?.chemicalProducts),),
                    Utils.verticalPadding(space: 20.h),
                    Visibility(
                      visible: vm.currentDetectorModel!.isDiseased!,
                      child: controlMeasures(title: "Biological Control", iconData: Icons.bug_report_outlined, controls: vm.currentDetectorModel?.eradicativeMeasures),),
                    Utils.verticalPadding(space: 20.h),
                    extraComments(comments: vm.currentDetectorModel?.extraComments),
                    Utils.verticalPadding(space: 20.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.warning_amber, color: Colors.deepPurple, size: 12.sp,),
                        Utils.horizontalPadding(space: 8.w),
                        SizedBox(
                          width: 0.7.sw,
                          child: Text("Response generated should not be fully taken as fact as these are ai generated",
                            style: Utils.getLabelStyle(color: Colors.deepPurple, fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                    Utils.verticalPadding(space: 12.h),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
