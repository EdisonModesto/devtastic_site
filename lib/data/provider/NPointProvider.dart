import 'package:devtastic_site/data/models/NpointModel.dart';
import 'package:devtastic_site/data/services/npoint.dart';
import 'package:flutter/cupertino.dart';

class NPointProvider with ChangeNotifier{
  List<String> typewriterData = [];
  String aboutData = "";
  String visionData = "";
  List<TestimonialModel> testimonialsData = [];
  bool isFetched = false;

  void getNPointData()async{
    var data = await Npoint().getData();

    typewriterData = data.typewriterData;
    aboutData = data.aboutData;
    visionData = data.visionData;
    testimonialsData = data.testimonialsData;
    notifyListeners();
  }

  void changeStatus(val){
    isFetched = val;
    notifyListeners();
  }

}