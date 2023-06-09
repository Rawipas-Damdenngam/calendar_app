import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/account_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isSelected = false;
  void onTapProfile() {
    Navigator.pop(context);
  }

  void changeProfile() {
    setState(() {
      isSelected = !isSelected;
      ref.read(accountsProvider.notifier).swapAccounts();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(
          top: 79,
          left: 15,
          right: 15,
          bottom: 220,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.close,
                        size: 35,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Image.asset(
                          'assets/images/google.jpeg',
                          scale: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: onTapProfile,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Text(
                              ref.watch(accountsProvider).first.name[0],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '    ${ref.watch(accountsProvider).first.name}',
                                  style: const TextStyle(),
                                ),
                                TextSpan(
                                  text:
                                      '\n     ${ref.watch(accountsProvider).first.address}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 45, right: 45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Manage your Google Account',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: GestureDetector(
                  onTap: changeProfile,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        child: Text(
                          ref.watch(accountsProvider).last.name[0],
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '    ${(ref.watch(accountsProvider).last.name)}',
                              style: const TextStyle(),
                            ),
                            TextSpan(
                              text:
                                  '\n     ${(ref.watch(accountsProvider).last.address)}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_alt_1_outlined,
                      color: Colors.black,
                    ),
                    label: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '    Add another account',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.manage_accounts_outlined,
                      color: Colors.black,
                    ),
                    label: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        '    Manage accounts on this device',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 8),
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.black87,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
