import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LiscenceDialog extends StatelessWidget {
  const LiscenceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Danfoss Tools - End User Liscence Agreement',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please read these terms and conditions (the “Terms”) carefully before using the App. By using the App you signify your consent to these Terms. If you do not agree to the Terms please do not use the App. The Terms addresses your legal rights and obligations and includes important disclaimers and choice of law and forum provisions. Please read carefully.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ownership of the Site',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The Site is owned and operated by Danfoss A/S (hereinafter referred to as Danfoss), a corporation incorporated under the laws of Denmark, having its principle office in Nordborg.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Use Liscence',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please feel free to browse the App. Danfoss grants you permission to view on this App and to print or download material displayed on the Site for your own personal, non-commercial use, provided that you agree to and accept without modification the notices, terms and conditions set forth in this agreement and provided that you keep intact all copyright, trademark and other proprietary notices. You may not however copy, reproduce, republish, upload, transmit or distribute in any way the contents of this Site, including the text, images, audio and video for public or commercial purposes, without written permission from Danfoss. You are also prohibited from using any content of this app in a frame on any other internet app in any way. Your use of this app constitutes your agreement and acceptance without modification of the notices, terms and conditions set forth herein. In addition as a condition of your use of this app, you represent and warrant to Danfoss that you will not use this Site for any purpose that is unlawful, immoral or prohibited by these terms, conditions and notices',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'User Submissions',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Any communication or material that you transmit to the Site by e-mail or otherwise is, and will be treated as non-confidential and non-proprietary information. Anything you transmit or post may be used by Danfoss for any purpose. You are prohibited from posting or transmitting to or from this Site any unlawful, threatening, libelous, defamatory, obscene, pornographic, or other material that may violate any law.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Content',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Danfoss takes great care in creating and maintaining this Site, and in providing accurate and up-to-date content such as, but not limited to, price quotations and product descriptions. However, the content of this Site is subject to frequent modifications without prior notice. Therefore, Danfoss does not guarantee the correct and actual status of said content. The visitors to the Site accept Danfoss exoneration of any liability whatsoever for the content of the Site, the software on the Site or for any use made of it.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Intellectual Property',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'The texts, layouts, drawings, databases and other items on this Site, as well as the Site itself, are protected by copyright and by the right of the producer of the database. Some of the names, signs and logos on this Site are protected trademarks or trade names. \n \n Nothing contained on the Site should be construed as granting any license or right to use any trademark, displayed on the Site without the written permission from Danfoss or such third party that may own the trademarks displayed on the Site. \n Any copy, adaptation, translation, arrangement, modification, or any use whatsoever of the whole or of any part of this Site of its protected elements, in any form and by any means, is strictly prohibited.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Liability',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your use of and browsing in this Site is at your own risk. Danfoss does not warrant that the software used for this Site, and the information, the on-line applications, or any other services provided by means of this Site are error-free, or that their use will be uninterrupted. Danfoss expressly disclaims all warranties related to the above-mentioned subject matter, including, without limitation, those of accuracy, condition, merchantability and fitness for particular purpose. \n Notwithstanding anything to the contrary in this Site, in no event shall Danfoss be liable for any loss of profits, revenues, indirect, special, incidental, consequential, or other similar damages arising out of or in connection with this Site or out of the use of any of the services proposed by means of this Site.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Agreed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
