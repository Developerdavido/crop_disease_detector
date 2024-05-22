

import 'dart:convert';
import 'dart:io';

import 'package:disease_detector/constants/env.dart';
import 'package:disease_detector/constants/strings.dart';
import 'package:disease_detector/helpers/home_helper.dart';
import 'package:disease_detector/model/detector_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';


enum UiState {loading, done, error}

class HomeProvider with ChangeNotifier {

  HomeService service = HomeService();

  UiState _uiState = UiState.done;

  UiState get uiState => _uiState;

  DetectorModel? currentDetectorModel;

  File? imageFile;

  setUiState(UiState value) {
    _uiState = value;
    notifyListeners();
  }

  // ... other properties and methods

  bool get isLoading => _uiState == UiState.loading;
  bool get isDone => _uiState == UiState.done;
  bool get isError => _uiState == UiState.error;


  captureImage() async {
    XFile? file = await service.getImage();
    if (file != null) {
      imageFile = File(file.path);
      print(imageFile!.path.toString());
    }
    notifyListeners();
}



Future<bool> generateResponse(BuildContext context) async {
    try{
      setUiState(UiState.loading);
      final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: Env.googleApiKey);

      final firstImage = await (File(imageFile!.path).readAsBytes());

      final prompt = TextPart(AppStrings.apiPrompt);

      final imageParts = [
        DataPart('image/jpeg', firstImage)
      ];

      final GenerateContentResponse response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
      setUiState(UiState.done);
      if (response != null) {
        String? data = response.text;
        data = data!.replaceAll("\n", "").replaceAll("  ", "");
        data = data.replaceAll("'", "\"");
        Map<String, dynamic> mappedData = json.decode(data);
        currentDetectorModel = DetectorModel.fromJson(mappedData);
        imageFile = null;
        return true;
      }
    } catch (e) {
      print(e.toString());
      setUiState(UiState.done);
    }
    return false;
}


clearData() {
    currentDetectorModel = null;
    imageFile = null;
}



  //this code calls the ui to make the api call to get data for the app




}