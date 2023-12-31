import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/controller/global_controller.dart';
import 'package:first_app/model/hourly_weather_data.dart';
import 'package:first_app/style/colours.dart';
import 'package:intl/intl.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly? weatherDataHourly;
  HourlyDataWidget({Key? key, this.weatherDataHourly}) : super(key: key);
  final RxInt cardIndex = GlobalController().getIndex();

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly!.hourly.length > 12
            ? 12
            : weatherDataHourly!.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 80,
                  margin: const EdgeInsets.only(left: 15, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: AppColors.lightGrey.withAlpha(150),
                        ),
                      ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(
                              colors: [AppColors.brown, AppColors.lightBr])
                          : null),
                  child: HourlyDetails(
                    index: index,
                    cardindex: cardIndex.value,
                    tmp: weatherDataHourly!.hourly[index].temp!,
                    timeStamp: weatherDataHourly!.hourly[index].dt!,
                    icon: weatherDataHourly!.hourly[index].weather![0].icon!,
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: const Text(
            '𝕋 𝕆 𝔻 𝔸 𝕐',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        hourlyList(),
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int tmp;
  final int timeStamp;
  final String icon;
  final int index;
  final int cardindex;
  const HourlyDetails(
      {super.key,
      required this.tmp,
      required this.icon,
      required this.timeStamp,
      required this.index,
      required this.cardindex});

  String getTime(int dt) {
    DateTime dd = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    String time = DateFormat('jm').format(dd);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: index == cardindex
                ? const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontFamily: 'Poppins')
                : const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontFamily: 'Poppins'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "images/weather/$icon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              '$tmp°',
              style: index == cardindex
                  ? const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontFamily: 'Poppins')
                  : const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontFamily: 'Poppins'),
            )),
      ],
    );
  }
}
