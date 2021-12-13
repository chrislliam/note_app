import 'package:flutter/material.dart';

class HandleError extends StatelessWidget {
  final String error;
  final void Function()? onRefresh;
  const HandleError({Key? key, required this.error, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(onPressed: onRefresh, icon: Icon(Icons.refresh)),
          Text(error)
        ],
      ),
    );
  }
}
