
class NPointModel {
   final List<String> typewriterData;
   final String aboutData;
   final String visionData;
   final List<TestimonialModel> testimonialsData;

  NPointModel({required this.typewriterData, required this.aboutData, required this.visionData, required this.testimonialsData});

  factory NPointModel.fromJson(Map<String, dynamic> json) {

    List<TestimonialModel> testData = [];

    json["testimonials"].forEach((key, value){
      testData.add(TestimonialModel.fromJson(value));
    });

    return NPointModel(
      typewriterData: List<String>.from(json['home_typewriter'] as List),
      aboutData: json['about'],
      visionData: json['vision'],
      testimonialsData: testData,
    );
  }
}

class TestimonialModel {
  final name;
  final review;
  final picUrl;
  final position;

  TestimonialModel({this.name, this.review, this.picUrl, this.position});

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      name: json['name'],
      review: json['review'],
      picUrl: json['picUrl'],
      position: json['position'],
    );
  }
}