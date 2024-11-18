class SearchData {
  final String locationName;
  double latitude;
  double longitude;
  String pickupDate;
  String returnDate;
  String pickupTime;
  String returnTime;

  SearchData(
      {required this.locationName,
      required this.latitude,
      required this.longitude,
      required this.pickupDate,
      required this.returnDate,
      required this.pickupTime,
      required this.returnTime});
}