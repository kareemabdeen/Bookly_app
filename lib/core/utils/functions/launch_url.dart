import 'package:bookly_app/core/utils/functions/snackBar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl({context, String? pathurl}) async {
  if (pathurl != null) {
    final Uri url = Uri.parse(pathurl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      customSnackBar(context, "Cannot Launch $url");
    }
  }
}
