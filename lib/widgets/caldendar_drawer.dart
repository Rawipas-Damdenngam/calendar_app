import 'package:flutter/material.dart';

class CalendarDrawer extends StatelessWidget {
  const CalendarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 9.5),
                    child: Text('data')),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 11.5),
                  child: Text(
                    'Gmail',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 100, 104),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.circle,
                color: Colors.green,
              ),
              title: const Text(
                'Active',
              ),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.create_outlined,
              ),
              title: const Text(
                'Add a status',
              ),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.all_inbox),
              title: const Text('All Inboxes'),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   // builder: ((ctx) => const TabScreen()),
                // ));
              },
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.inbox),
              title: const Text('Inbox'),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: ((ctx) => const TabScreen()),
                // ));
              },
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Starred'),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: ((ctx) => const StarredGmailScreen()),
                //   ),
                // );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.watch_later_outlined),
              title: const Text('Snoozed'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.label_important_outline),
              title: const Text('Important'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.send_outlined),
              title: const Text('Sent'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.schedule_send_outlined),
              title: const Text('Scheduled'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined),
              title: const Text('Drafts'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text('All mail'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text('Spam'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Trash'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create new'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Send feedback'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
