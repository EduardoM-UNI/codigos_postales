import 'package:codigos_postales/data_source/postal_code_service.dart';
import 'package:codigos_postales/models/postal_codes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  WebView({
    super.key,
    required this.urlString,
  });

  String urlString;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late WebViewController controller;
  //PostalCodeService? postalCode;
  PostalCodes? postalCodes;
  @override
  void initState() {
    super.initState();
    var postalCode = PostalCodeService();
    postalCode.fechData("08204", "");
    debugPrint(postalCodes?.countryAbbreviation);
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.urlString),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
