import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A demo page showcasing the usage of [ShadTextarea] with controls
/// to toggle `enabled` and `resizable` states dynamically.
class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ShadToggle(
            icon: const Icon(LucideIcons.italic),
            enabled: false,
            child: const Text('Toggle Italic'),
            onPressedChange: (value) => print('Toggle pressed: $value'),
          ),
        ),
      ),
    );
  }
}
