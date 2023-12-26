import 'package:flutter/material.dart';

class footerRow extends StatefulWidget {
  const footerRow({super.key});

  @override
  State<footerRow> createState() => _footerRowState();
}

class _footerRowState extends State<footerRow> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
    Row footerRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/sea.jpg'),
          radius: 40,
        ),
        SizedBox(
          width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.access_alarm),
              Icon(Icons.accessibility),
              Icon(Icons.account_balance),
            ],
          ),
        )
      ],
    );
  }
}
class footerR {
  
}