//return a formatted data as string
import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  //timestamp is the object we retrieve from firebase
  //so to display it , lets convert it to a string
  DateTime dateTime = timestamp.toDate();

  //get year
  String year = dateTime.year.toString();

  //get month
  String month = dateTime.month.toString();

  //get day
  String day = dateTime.day.toString();

  //get hour
  String hour = dateTime.hour.toString();
  //get minute
  String minute = dateTime.minute.toString();
  //get second
  String second = dateTime.second.toString();

  //final formatted date
  String formattedData = '$day-$month-$year\t\t\t$hour:$minute:$second';

  return formattedData;
}
