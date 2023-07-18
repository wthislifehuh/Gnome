import 'package:first_app/pages/dashboard/weatherPage/widget/farm_dropdown.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DASHBOARD',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: AppColors.darkBrown,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              '𝔾 ℕ 𝕆 𝕄 𝔼   𝕌 ℙ 𝔻 𝔸 𝕋 𝔼 𝕊',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        Align(alignment: Alignment.centerRight, child: FarmDropDown()),
      ],
    );
  }
}
