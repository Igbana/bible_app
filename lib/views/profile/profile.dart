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
            itemBuilder: (context, index) => ProfileItem(
              label: profileItems[index],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(label));
  }
}
