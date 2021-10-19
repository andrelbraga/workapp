import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class AlertDialogWidget extends StatefulWidget {
  AlertDialogWidget({Key? key}) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  contentBox(context) {
    return Stack(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(
            left: Constants.padding,
            top: Constants.avatarRadius + Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding),
        margin: const EdgeInsets.only(top: Constants.avatarRadius),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Titulo",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Descriptions",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomRight,
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Texto",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ],
        ),
      ), // bottom part
      Positioned(
        left: Constants.padding,
        right: Constants.padding,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: Constants.avatarRadius,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(Constants.avatarRadius)),
            child: Image.asset("assets/devs.jpg")
          ),
        ), // top part
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context)
    );
  }
}
