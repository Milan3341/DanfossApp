import 'package:danfossapp/settings/liscence_agreement.dart';
import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.brightness_6),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.green[800]!],
                    [Colors.red[800]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['On', 'off'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 390,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Edit User',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        )
                      ],
                    ))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 390,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.warning,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Change Password',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        )
                      ],
                    ))),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: () {
                launchUrl(
                    Uri.parse('https://www.danfoss.com/en-au/terms/privacy/'));
              },
              subtitle: Text(
                'https://www.danfoss.com/en-au/terms/privacy/',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding: const EdgeInsets.only(left: 100),
              leading: const Icon(Icons.policy),
              tileColor: Theme.of(context).colorScheme.outlineVariant,
              title: const Text('Danfoss Privacy Policy'),
              textColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 15),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LiscenceDialog();
                    });
              },
              contentPadding: const EdgeInsets.only(left: 100),
              leading: const Icon(Icons.description),
              tileColor: Theme.of(context).colorScheme.outlineVariant,
              title: const Text('Liscence Agreement'),
              textColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 390,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Icon(
                          Icons.app_registration_rounded,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          'Sign In / Register',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 390,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Icon(
                          Icons.logout,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          'Logout',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
