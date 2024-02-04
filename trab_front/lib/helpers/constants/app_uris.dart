// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class Uris {
  const Uris._();

  static Uri notion(NotionUrls notionUrls) {
    switch (notionUrls) {
      case NotionUrls.METHOD:
        return Uri.parse(
            "https://childish-musician-9c7.notion.site/936d01f8ca59407f94c019c506294b36?pvs=4");
      case NotionUrls.INVIDUALQUERY:
        return Uri.parse(
            "https://childish-musician-9c7.notion.site/1-1-0daaf1b0ab3d426e8eba8ac48fa34fdc?pvs=4");
      case NotionUrls.TERMSOFUSE:
        return Uri.parse(
            "https://childish-musician-9c7.notion.site/05391db15d5d4598bccea6225880772a?pvs=4");
    }
  }
}

enum NotionUrls {
  METHOD,
  INVIDUALQUERY,
  TERMSOFUSE,
}

Future<void> launchInWebViewOrVC({required Uri url}) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}
