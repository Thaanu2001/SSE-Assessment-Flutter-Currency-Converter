import 'package:flutter/material.dart';

import '../../constants/theme_constants.dart';
import 'widgets/add_converter_button.dart';
import 'widgets/currency_result_list.dart';
import 'widgets/input_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Advanced Exchanger',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'INSERT AMOUNT:',
                  style: TextStyle(
                    color: AppTheme.greyTint1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                InputTextField(),
                SizedBox(height: 30),
                Text(
                  'CONVERT TO:',
                  style: TextStyle(
                    color: AppTheme.greyTint1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(child: CurrencyResultList()),
                SizedBox(height: 10),
                AddConverterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
