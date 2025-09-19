import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/data/models/error_message_model.dart';
import 'package:flutter/widgets.dart';

class ErrorMessageWidget extends StatelessWidget {
  ErrorMessageModel error;
  ErrorMessageWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.message,
              style: TextStyle(color: MyColors.grey, fontSize: 16),
            ),
            Icon(error.icon, color: MyColors.grey, size: 25),
          ],
        ),
      ),
    );
  }
}
