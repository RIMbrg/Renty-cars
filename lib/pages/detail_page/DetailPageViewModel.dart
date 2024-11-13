// import 'package:get/get.dart';

class DetailPageViewModel {
  List<DetailPageModel> featureList = [
    DetailPageModel(
        svg: 'lib/images/air_conditionner.svg', label: 'Air Coditionner'),
    DetailPageModel(
        svg: 'lib/images/air_conditionner.svg', label: 'Air Coditionner'),
    DetailPageModel(svg: 'lib/images/air_conditionner.svg', label: 'Gear Box'),
    DetailPageModel(svg: 'lib/images/air_conditionner.svg', label: 'Max Speed'),
    DetailPageModel(svg: 'lib/images/air_conditionner.svg', label: 'Capacity'),
    DetailPageModel(svg: 'lib/images/air_conditionner.svg', label: 'Electric'),
    DetailPageModel(svg: 'lib/images/air_conditionner.svg', label: 'Hybrid'),
    DetailPageModel(
        svg: 'lib/images/air_conditionner.svg', label: 'Diesel/Essence'),
    DetailPageModel(
        svg: 'lib/images/air_conditionner.svg', label: 'Horse power'),
  ];
  List<String> imageList = [
    'lib/images/Car1.jpg',
  ];
}

class DetailPageModel {
  String? svg;
  String? label;

  DetailPageModel({this.svg, this.label});
}
