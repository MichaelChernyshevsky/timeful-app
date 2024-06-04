import 'package:app_with_apps/interface/exports/screens_exports.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({
    super.key,
    required this.widget,
    this.appBar,
  });
  Widget widget;
  AppBar? appBar;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final padding = EdgeInsets.only(
      right: w * 0.08,
      left: w * 0.08,
      top: h * 0.05,
      bottom: h * 0.05,
    );

    if (widget.appBar != null) {
      return Scaffold(
        appBar: widget.appBar,
        body: Padding(
          padding: padding,
          child: widget.widget,
        ),
      );
    }

    return Scaffold(
      backgroundColor: UTILSConstants.grey1,
      body: Padding(
        padding: padding,
        child: widget.widget,
      ),
    );
  }
}
