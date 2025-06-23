import 'package:url_launcher/url_launcher.dart';

import 'credentials.dart';

void emailUser() async{
    final String subject = 'Happy to connect with you';
    final String body = 'Hi, I want to connect with you regarding your profile and roles. Could we discuss further?';
    final String myEmail="santhoshkumarsakthi2003@gmail.com";
    final String encodedSubject = Uri.encodeComponent(subject);
    final String encodedBody = Uri.encodeComponent(body);

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: myEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try{
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      }
      else {
      }

    }
    catch (e) {
      // Catch any exceptions that might occur during launch
      print('Error launching email: $e');
    }

}
void desktopEmailUser() async{
  final link="https://mail.google.com/mail/?view=cm&to=santhoshkumarsakthi2003@gmail.com&su=Happy%20to%20connect%20with%20you&body=Hi%2C%20I%20want%20to%20connect%20with%20you%20regarding%20your%20profile%20and%20roles.%20Could%20we%20discuss%20further%3F";
  try{
    await launchUrl(Uri.parse(link));
  }
  catch(e){
    print(e.toString());
  }
}
void phoneUser() async{
  final Uri phoneUri = Uri(scheme: 'tel', path: '+919597889163'); // Replace with your number

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    print("Could not launch phone dialer");
  }
}
void openGithub() async {
  try{
    await launchUrl(Uri.parse(gitHub));

    // if(await canLaunchUrl(Uri.parse(gitHub))){
    //   await launchUrl(Uri.parse(gitHub));
    // }
    // else{
    //   print("Cannot launch github uri");
    // }
  }
  catch(e){
    print(e.toString());
  }
}
void openLocation() async {
  try{
    await launchUrl(Uri.parse(locationUrl));
  }
  catch(e){
    print(e.toString());
  }
  // if (await canLaunchUrl(Uri.parse(locationUrl))){
  //   await launchUrl(Uri.parse(locationUrl));
  // }
  // else{
  //   print("Location url cant be loaded");
  // }

}


void openPublicationPdf() async {
  try{
    await launchUrl(Uri.parse(publicationArticle));
  }
  catch(e){
    print(e.toString());
  }
}

void openWithHttpsLink(String link) async{
  try{
    await launchUrl(Uri.parse(link));
  }
  catch(e){
    print(e.toString());
  }
}