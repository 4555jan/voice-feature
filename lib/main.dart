import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MethodChannel _channel = MethodChannel('voice_intent_channel');

  @override
  void initState() {
    super.initState();

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'openAddSplit') {
        final String value = call.arguments['value'] ?? '';
        // Pop all routes and push add-split
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/add-split',
          (route) => route.isFirst,
          arguments: value,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Intent Demo',
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/add-split') {
          final String value = settings.arguments as String? ?? '';
          return MaterialPageRoute(
            builder: (context) => AddSplitScreen(initialValue: value),
          );
        }
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add-split');
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: const Center(child: Text('Home Screen')),
    );
  }
}

class AddSplitScreen extends StatefulWidget {
  final String initialValue;

  const AddSplitScreen({super.key, this.initialValue = ''});

  @override
  State<AddSplitScreen> createState() => _AddSplitScreenState();
}

class _AddSplitScreenState extends State<AddSplitScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Split')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Split Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Saved: $name')));
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
