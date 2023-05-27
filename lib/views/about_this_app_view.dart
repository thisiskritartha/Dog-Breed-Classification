import 'package:dog_breed_classification/extension/app_color.dart';
import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutThisApp extends StatefulWidget {
  const AboutThisApp({Key? key}) : super(key: key);

  @override
  State<AboutThisApp> createState() => _AboutThisAppState();
}

class _AboutThisAppState extends State<AboutThisApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        leading: const Icon(
          FontAwesomeIcons.paw,
        ),
        title: Text(
          'About this App',
          style: TextStyle(
            fontSize: 6.0.wp,
            letterSpacing: 0.3.wp,
          ),
        ),
        backgroundColor: color,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            ExpansionTileWidget(
              title: 'How accurate is this app in general?',
              description:
                  "Generally, the results of this app are quite accurate and at least comparable to the current state of the art. However, this app is still giving predictions only and those won't be right all the time.",
            ),
            ExpansionTileWidget(
              title: 'How accurate is this app exactly?',
              description:
                  "This app was trained with 7,189 images to learn distinguishing 71 individual breeds. As evaluated on about 1,755 independent test images, there is a general probability of approximately 95% for the correct breed to be shown in the result. The threshold for our Model is 50% i.e Our app will only show the output if its Confidence level(or Probability) is more or equal to 50%. The mean and standard deviation of pixel values in an image or a set of images is taken as 127.5 for our application.",
            ),
            ExpansionTileWidget(
              title: 'What are the limitations of this app?',
              description:
                  "1) As our models are trained on specific views and perspectives of Dogs breed, dog images presented from a different angle or viewpoint than what the model has seen during training, it may struggle to correctly classify the image.\n "
                  "2) Our Model are sensitive to image quality factors such as lighting conditions, resolution, noise, and occlusions. Noisy or low-quality images may introduce artifacts or distortions that hinder accurate classification. \n"
                  "3) Distinguishing between visually similar breeds can be challenging for our model. For example, differentiating between breeds of dogs that have similar physical appearances may lead to misclassifications. As French Bulldog and Pug have quite similar facial structure, sometimes our model outputs the incorrect result.",
            ),
            Container(
              padding: EdgeInsets.all(4.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 6.0.wp,
                    ),
                  ),
                  SizedBox(height: 2.0.wp),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Sampang Chowk',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Dharan, Sunsari',
                      style: TextStyle(
                        letterSpacing: 0.6.wp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      '9816395937',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.github,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: GestureDetector(
                      onTap: () {
                        final Uri url = Uri.parse(
                            'https://github.com/thisiskritartha/Dog-Breed-Classification');
                        launchUrl(url);
                      },
                      child: Text(
                        'Dog-Breed-Classification',
                        style: TextStyle(
                          fontSize: 4.8.wp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Members',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 6.0.wp,
                    ),
                  ),
                  SizedBox(height: 2.0.wp),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.laptopCode,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Kritartha Bikram Shah',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '076BCT041',
                      style: TextStyle(
                        letterSpacing: 0.6.wp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.fileCode,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Dipesh Adhikari',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '076BCT031',
                      style: TextStyle(
                        letterSpacing: 0.6.wp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.code,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Lijesh Subedi',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '076BCT043',
                      style: TextStyle(
                        letterSpacing: 0.6.wp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.bug,
                      size: 8.0.wp,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Deepak Sharma',
                      style: TextStyle(
                        fontSize: 4.8.wp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '076BCT029',
                      style: TextStyle(
                        letterSpacing: 0.6.wp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ExpansionTileWidget extends StatelessWidget {
  ExpansionTileWidget(
      {super.key, required this.title, required this.description});

  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 5.39.wp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(
              title: Text(
                description,
                style: TextStyle(
                  fontSize: 4.8.wp,
                  color: Colors.black.withOpacity(0.7),
                  letterSpacing: 0.4.wp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
