import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher{

  // final String ageoWebLink="https://ageo.com/";

  Future<bool> canOpenInBrowser({required String url})async{
    bool val=await canLaunchUrl(Uri(path: url.replaceAll(" ", "%20")));
    return val;
  }

  Future<void> openInBrowser({required String url})async{
    String urlString=url.replaceAll(" ", "%20");
    if(await canLaunchUrl(Uri.parse(urlString))){
      await launchUrl(Uri.parse(urlString),mode: LaunchMode.externalApplication);
    }else{
      throw "cannot launch $urlString";
    }
  }
}