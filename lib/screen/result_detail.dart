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
              child: Column(
                children: [
                  Visibility(
                    visible: vm.currentDetectorModel!.isDiseased!,
                      child: dataTitleInfo(title: vm.currentDetectorModel?.diseaseName, causativeOrganism: vm.currentDetectorModel?.causativeOrganism),
                  ),
                  Utils.verticalPadding(space: 20.h),
                  Visibility(
                    visible: vm.currentDetectorModel!.isDiseased!,
                    child: controlMeasures(controls: vm.currentDetectorModel?.eradicativeMeasures),),
                  Utils.verticalPadding(space: 20.h),
                  extraComments(comments: vm.currentDetectorModel?.extraComments),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
