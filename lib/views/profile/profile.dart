import 'package:bible_app/imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.goHome});
  final VoidCallback goHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            title: const Text("Profile"),
            leading: IconButton(
              onPressed: goHome,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            itemCount: profileItems.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileItem(
                  label: profileItems.keys.toList()[index],
                  onTap: () {
                    profileItems.keys.toList()[index] == "Feedback"
                        ? showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return profileItems[
                                  profileItems.keys.toList()[index]];
                            })
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return profileItems[
                                    profileItems.keys.toList()[index]];
                              },
                            ),
                          );
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(label)),
    );
  }
}
