// ignore_for_file: library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, non_constant_identifier_names, avoid_print, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, unused_field


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';
import 'package:renty_cars/pages/searchresult.dart';
import 'package:renty_cars/utilities/constants.dart';
import 'package:renty_cars/utilities/global_data.dart';
import 'package:renty_cars/utilities/search.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //Setup search form
  final _formKey = GlobalKey<FormState>();
  TextEditingController locationValue = TextEditingController();
  TextEditingController dateValue = TextEditingController();
  TextEditingController pickupTimeValue =
      TextEditingController(text: availableTimes[0]);
  TextEditingController returnTimeValue =
      TextEditingController(text: availableTimes[0]);
  late double latitude;
  late double longitude;
  DateFormat displayDateFormat = DateFormat('MMM dd, yyyy');
  DateFormat otaDateFormat = DateFormat('yyyy-MM-dd');
  DateTimeRange _fromRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  late String pickupDate;
  late String returnDate;

  //Location Autocomplete
  Future<void> _selectLocation(BuildContext context) async {
    Prediction? prediction = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleMapsKey,
        mode: Mode.fullscreen, // Mode.overlay
        language: "en",
        onError: (e) {
          print(e.errorMessage);
        });
    locationValue.text = prediction!.description!;
    _getLatLng(prediction);
  }

  //Get geo coordinated from places API prediction
  void _getLatLng(Prediction prediction) async {
    GoogleMapsPlaces _places =
        new GoogleMapsPlaces(apiKey: kGoogleMapsKey); //Same API_KEY as above
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(prediction.placeId!);

    if (prediction.types.contains('airport')) {
      print('is airport');
    }
    latitude = detail.result.geometry!.location.lat;
    longitude = detail.result.geometry!.location.lng;
  }


  //Show date range picker
  Future<void> _showDateRangePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      useRootNavigator: false,
      saveText: "Select Dates",
      fieldStartHintText: "Pickup date",
      fieldStartLabelText: "Pickup date",
      fieldEndHintText: "Return date",
      fieldEndLabelText: "Return date",
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    //Update text form field
    if (picked != null) {
      setState(() {
        _fromRange = picked;
        pickupDate = otaDateFormat.format(picked.start);
        returnDate = otaDateFormat.format(picked.end);
        dateValue.text =
            "${displayDateFormat.format(picked.start)} to ${displayDateFormat.format(picked.end)}";
      });
    }
  }

  //When time field is clicked, display platfom specific time UI
  //For iOS show a dropdown, for Android use material time picker
  Future<void> showPicker(int type) async {
    if (Platform.isAndroid) {
      _selectTime(type);
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return iOSPicker(type);
          });
    }
  }

  //Time Select - Show material time picker widget on Android
  TimeOfDay androidPickupTime = TimeOfDay(hour: 10, minute: 0);
  Future<void> _selectTime(int type) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: androidPickupTime,
        builder: (BuildContext context, Widget? child) {
  return MediaQuery(
    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
    child: child!,
  );
});

    if (picked_s != null) {
      setState(() {
        //Update time field !todo do this with proper date formatting
        if (type == 0) {
          pickupTimeValue.text = picked_s
              .format(context)
              .replaceAll(' AM', "")
              .replaceAll(' PM', "");
        } else {
          returnTimeValue.text = picked_s
              .format(context)
              .replaceAll(' AM', "")
              .replaceAll(' PM', "");
        }
      });
    }
  }

  // Time select - Show Cupertino picker on iOS
  CupertinoPicker iOSPicker(int type) {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int selectedIndex) {
        setState(() {
          if (type == 0) {
            pickupTimeValue.text = availableTimes[selectedIndex];
          } else {
            returnTimeValue.text = availableTimes[selectedIndex];
          }
        });
      },
      children: availableTimes.map<Widget>((String value) {
        return Text(value);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[50],
      appBar: AppBar(
        title: Text('Renty Car', style: TextStyle(fontSize: 24,color:Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SafeArea(
      

        child: ListView(padding: EdgeInsets.all(20.0), 
        children: [
 Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
   Container(
   width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                ),
              ),
  child: Center(
    child: Image.asset('images/2.png',fit: BoxFit.contain,),
  ),
      ),],),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Main heading,
                // Text(
                //   'Search for a car',
                //   textAlign: TextAlign.left,
                //   style: kTitleStyle,
                // ),
                SizedBox(height: 10.0,),
                
                // Location Search Field
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: locationValue,
                  decoration: InputDecoration(
                    hintText: 'Enter a Pickup location',
                    labelText: 'Enter a Pickup location',
                    prefixIcon: Icon(Icons.location_pin),
                    enabledBorder: kEnabledBorder,
                    focusedBorder: kFocusedBorder,
                    errorBorder: kErrorBorder,
                    focusedErrorBorder: kErrorBorder,
                  ),
                  onTap: () {
                    _selectLocation(context);
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a pick-up location';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: dateValue,
                  onTap: () {
                    _showDateRangePicker(context);
                  },
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    hintText: 'Select dates',
                    labelText: 'Select dates',
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder: kEnabledBorder,
                    focusedBorder: kFocusedBorder,
                    errorBorder: kErrorBorder,
                    focusedErrorBorder: kErrorBorder,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select dates';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onTap: () => showPicker(0),
                        controller: pickupTimeValue,
                        decoration: InputDecoration(
                          hintText: 'Pick up time',
                          labelText: 'Pick up time',
                          prefixIcon: Icon(Icons.access_time_rounded),
                          enabledBorder: kEnabledBorder,
                          focusedBorder: kFocusedBorder,
                          errorBorder: kErrorBorder,
                          focusedErrorBorder: kErrorBorder,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kInputSpacing,
                    ),
                    Expanded(
                      child: TextFormField(
                          onTap: () => showPicker(1),
                          controller: returnTimeValue,
                          decoration: InputDecoration(
                            hintText: 'Drop off time',
                            labelText: 'Drop off time',
                            prefixIcon: Icon(Icons.access_time_rounded),
                            enabledBorder: kEnabledBorder,
                            focusedBorder: kFocusedBorder,
                            errorBorder: kErrorBorder,
                            focusedErrorBorder: kErrorBorder,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: kInputSpacing,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.blue, // Button color
    padding: EdgeInsets.symmetric(vertical: 16.0),),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Create a new SearchData object
                        var searchData = SearchData(
                          locationName: locationValue.text,
                          latitude: latitude,
                          longitude: longitude,
                          pickupDate: pickupDate,
                          returnDate: returnDate,
                          pickupTime: pickupTimeValue.text,
                          returnTime: returnTimeValue.text,
                        );
                        //update global search
                        gSearchData = searchData;
                        // If the form is valid jump to loading screen and fetch cars
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchResultsScreen(
                            searchData: searchData,
                          );
                        }));
                      } // End if form valid
                    },
                    child: Text(
                      'Search cars',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }


}