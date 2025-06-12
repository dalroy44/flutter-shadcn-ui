import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

enum ShadToggleVariant { primary, outline }
enum ShadToggleSize { regular, sm, lg }

class ShadToggle extends StatefulWidget {
  const ShadToggle({
    super.key,
    this.variant = ShadToggleVariant.primary,
    this.size = ShadToggleSize.regular,
    this.pressed,
    this.defaultPressed = false,
    this.onPressedChange,
    required this.icon,
    this.child,
    this.enabled = true,
  });

  final ShadToggleVariant variant;
  final ShadToggleSize size;
  final bool? pressed;
  final bool defaultPressed;
  final ValueChanged<bool>? onPressedChange;
  final Widget icon;
  final Widget? child;
  final bool enabled;

  @override
  State<ShadToggle> createState() => _ShadToggleState();
}

class _ShadToggleState extends State<ShadToggle> {
  late bool _pressed;
  bool get isControlled => widget.pressed != null;

  @override
  void initState() {
    super.initState();
    _pressed = widget.pressed ?? widget.defaultPressed;
  }

  @override
  void didUpdateWidget(covariant ShadToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isControlled) {
      _pressed = widget.pressed!;
    }
  }

  void _handlePressed() {
    if (!widget.enabled) return;
    final newPressed = !(isControlled ? widget.pressed! : _pressed);
    if (!isControlled) {
      setState(() => _pressed = newPressed);
    }
    widget.onPressedChange?.call(newPressed);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final pressed = isControlled ? widget.pressed! : _pressed;
    

    // Use the unified toggle theme
    final toggleTheme = theme.toggleTheme;

    final backgroundColor = pressed ? toggleTheme.pressedBackgroundColor : null;
    final foregroundColor = pressed ? toggleTheme.pressedForegroundColor : null;
    final hoveredBackgroundColor = toggleTheme.hoveredBackgroundColor;
    final hoveredForegroundColor = pressed ? toggleTheme.pressedForegroundColor 
      : toggleTheme.hoveredForegroundColor;

    final buttonVariant = switch (widget.variant) {
      ShadToggleVariant.primary => ShadButtonVariant.ghost,
      ShadToggleVariant.outline => ShadButtonVariant.outline,
    };

    final buttonSize = switch (widget.size) {
      ShadToggleSize.sm => ShadButtonSize.sm,
      ShadToggleSize.regular => ShadButtonSize.regular,
      ShadToggleSize.lg => ShadButtonSize.lg,
    };

    final Widget? leading;
    final Widget? child;

    if (widget.child == null) {
      leading = null;
      child = widget.icon;
    } else {
      leading = widget.icon;
      child = widget.child;
    }

    return Semantics(
      button: true,
      toggled: pressed,
      enabled: widget.enabled,
      child: ShadButton.raw(
        enabled: widget.enabled,
        variant: buttonVariant,
        size: buttonSize,
        onPressed: _handlePressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        hoverBackgroundColor: hoveredBackgroundColor,
        hoverForegroundColor: hoveredForegroundColor,
        leading: leading,
        child: child,
      ),
    );
  }
}
