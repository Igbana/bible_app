import 'package:bible_app/imports.dart';
import 'package:bible_app/views/widgets/search_box.dart';

class SavedNotes extends GetView<BibleService> {
  const SavedNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Saved Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchBox(),
            const SizedBox(height: 32),
            Obx(
              () => controller.searchResult.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text("No Saved Notes"),
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                          itemCount: controller.searchResult.length,
                          itemBuilder: (_, index) {
                            BibleReference ref = controller.searchResult[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.reference = controller.getChapter(
                                    book: ref.book,
                                    chapter: ref.chapter,
                                  );
                                  Navigator.of(context).pop();
                                  controller.reference = ref;
                                },
                                child: Container(),
                              ),
                            );
                          }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
