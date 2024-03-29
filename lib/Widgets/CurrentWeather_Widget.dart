import 'package:flutter/material.dart';

import 'package:weather_app/Utilities/Custom_Colors.dart';

import '../Models/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TempratureAreaWidget(),
      SizedBox(
        height: 20,
      ),
      CurrentWeatherMoreDetailsWidget()
    ]);
  }

  Widget CurrentWeatherMoreDetailsWidget() {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}km/h",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget TempratureAreaWidget() {
    int temp;
    temp = weatherDataCurrent.current.temp!.round();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
            height: 60,
            width: 60,
          ),
          Container(
            height: 50,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "${temp}°",
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.textColorBlack)),
            TextSpan(
                text: weatherDataCurrent.current.weather![0].description,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey))
          ]))
        ],
      ),
    );
  }
}
