import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/screens/thermometer_image.dart';
import 'package:thermometer/widgets/detail_pages_widgets/maindetail_widget.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';
import '../widgets/detail_pages_widgets/detail_card_style.dart';
import '../widgets/settting_widgets/rating_app_widget.dart';
import '../widgets/settting_widgets/settring_first_container.dart';
import '../widgets/settting_widgets/text_icon_setting_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<AllWeatherAPiProvider>(
      builder: (BuildContext context, value, Widget? child) {
        value.MediaQueryy(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailWidgetMain(height: value.height, name: 'Setting', color: Colors.blue.shade900),
          Container(
          decoration:   BoxDecoration(
          color: Colors.blue.shade900,
          ),
          child: DetailCardStyle(
            color: Colors.grey.shade100,
            height: value.height,
          child: Column(
            children: [
              const SettingFirstConatainer(),
              SettingIconText(icon: Icons.thermostat, text: 'Thermometer', color: Colors.blue.shade900,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThermometerImage()));
                },),
              SettingIconText(icon: Icons.list_alt_outlined, text: 'Term of condition',color: Colors.blue.shade900,
                onTap: () {  },),
              SettingIconText(icon: Icons.privacy_tip_sharp, text: 'Privacy',color: Colors.blue.shade900,
                onTap: () {  },),
              SettingIconText(icon: Icons.email, text: 'Contact us',color: Colors.blue.shade900,
                onTap: () {
                launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'humairanazir77@gmail.com',
                  queryParameters: {
                    'subject': 'Any Question',
                    'body': 'Hello, I would like to provide feedback...',
                  },
                ),
                  mode: LaunchMode.externalApplication);},),
              SettingIconText(icon: Icons.star,color: Colors.orange,  text: 'Rating app',
                onTap: () {
                  showRatingDialog(context);
                }, ),
              SettingIconText(icon: FontAwesomeIcons.share, text: 'Share app',color: Colors.blue.shade900,
                onTap: () {
                    Share.share('com.example.thermometer');
                },),

            ],
          ),
          ),)
              ],
            ),
          ),
        );
      },

    );
  }
}




