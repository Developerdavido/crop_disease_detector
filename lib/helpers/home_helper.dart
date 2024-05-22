

import 'package:image_picker/image_picker.dart';

class HomeService {

  //capture the image

  getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo;
  }

  //access google api data to be used to determine if the image is healthy
}