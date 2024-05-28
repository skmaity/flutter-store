import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataSafty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Safety'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Introduction'),
                  _buildSectionContent(
                      'At FusionApps, your privacy is important to us. This page explains how we handle your data safely and responsibly.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Data Collection'),
                  _buildSectionContent(
                      'What We Collect:\n'
                      '- Personal Information: Like your name and email address.\n'
                      '- Usage Data: Such as the apps you download and how you use FusionApps.\n'
                      '- Device Information: Including your device type and operating system.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'How We Collect It:\n'
                      '- Directly from You: When you create an account or use our services.\n'
                      '- Automatically: Through cookies and similar technologies.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Data Usage'),
                  _buildSectionContent(
                      'Why We Collect Data:\n'
                      '- To improve and personalize your experience.\n'
                      '- To send you updates and notifications.\n'
                      '- To make FusionApps better and develop new features.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'Sharing Data:\n'
                      'We may share your data with trusted partners who help us run our services. These partners must keep your data confidential.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Data Storage and Security'),
                  _buildSectionContent(
                      'Where Your Data Goes:\n'
                      'Your data is stored securely on our servers.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'How We Protect Your Data:\n'
                      'We use strong security measures like encryption to keep your data safe.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Your Rights'),
                  _buildSectionContent(
                      'Access and Correction:\n'
                      'You can view and update your personal information.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'Deletion:\n'
                      'You can ask us to delete your data at any time.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'Opt-Out:\n'
                      'You can opt out of receiving marketing emails from us.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Cookies and Tracking'),
                  _buildSectionContent(
                      'Using Cookies:\n'
                      'We use cookies to remember your preferences and improve your experience.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'Managing Cookies:\n'
                      'You can control cookies through your browser settings. Note that disabling cookies may affect how FusionApps works for you.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Third-Party Services'),
                  _buildSectionContent(
                      'Links to Other Sites:\n'
                      'FusionApps may link to other websites. Please review their privacy policies.'),
                  SizedBox(height: 20.0),

                  _buildSectionContent(
                      'Third-Party Data:\n'
                      'We’re not responsible for the privacy practices of other sites. Check their policies for details.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Updates to This Policy'),
                  _buildSectionContent(
                      'Keeping You Informed:\n'
                      'We may update this policy from time to time. We’ll let you know about significant changes.'),
                  SizedBox(height: 20.0),

                  _buildSectionTitle('Contact Us'),
                  _buildSectionContent(
                      'Need Help?\n'
                      'If you have questions or concerns about your data, please contact us at support@fusionapps.com.'),
                  SizedBox(height: 20.0),

                  _buildPrivacyPolicyLink('Privacy Policy'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildPrivacyPolicyLink(String text) {
    return GestureDetector(
      onTap: _launchPrivacyPolicyURL,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 16.0,
        ),
      ),
    );
  }


  void _launchPrivacyPolicyURL() async {
    const url = 'https://www.termsfeed.com/live/15ae699e-472f-45f7-a6e0-3f10fb1df391';
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

}