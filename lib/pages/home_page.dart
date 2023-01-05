import 'package:copyphone/providers/copy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<CopyProvider>(context);

    final textform = TextEditingController(text: textProvider.phone);
    return Scaffold(
      appBar: AppBar(
        title: const Text('COPY PHONE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: textform,
              keyboardType: TextInputType.phone,
              focusNode: AlwaysDisableFocusNode(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 193, 253, 195)),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 188, 255, 190)),
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 191, 255, 186),
                contentPadding: const EdgeInsets.all(15),
                suffixIcon: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: textform.text),
                    );
                  },
                  icon: const Icon(Icons.copy_all_rounded),
                ),
                prefixIcon: const Icon(
                  Icons.phone,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
