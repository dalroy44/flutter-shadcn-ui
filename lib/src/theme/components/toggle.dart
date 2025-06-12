import 'package:flutter/material.dart';

/// Defines the theme for the `ShadToggle` component, specifically for its
/// pressed (or "on") state.
///
/// Use this class to customize the appearance of toggles when they are active.
/// This theme is applied based on the toggle's variant (`primary` or `outline`)
/// within the main `ShadThemeData`.
@immutable
class ShadToggleTheme {
  const ShadToggleTheme({
    this.merge = true,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.hoveredBackgroundColor,
    this.hoveredForegroundColor,
  });

  /// Whether to merge this theme with the parent theme.
  ///
  /// If `true` (default), this theme will be merged with the a theme from
  /// a parent `ShadTheme` widget. If `false`, this theme will replace
  /// the parent theme completely.
  final bool merge;

  /// The background color of the toggle when it is in the pressed state.
  final Color? pressedBackgroundColor;

  /// The foreground color (for the icon and text) of the toggle when it is
  /// in the pressed state.
  final Color? pressedForegroundColor;

  /// The background color of the toggle when it is hovered.
  final Color? hoveredBackgroundColor;

  /// The foreground color (for the icon and text) of the toggle when it is
  /// hovered.
  final Color? hoveredForegroundColor;

  /// Linearly interpolates between two `ShadToggleTheme`s.
  static ShadToggleTheme? lerp(
    ShadToggleTheme? a,
    ShadToggleTheme? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    return ShadToggleTheme(
      pressedBackgroundColor:
          Color.lerp(a?.pressedBackgroundColor, b?.pressedBackgroundColor, t),
      pressedForegroundColor:
          Color.lerp(a?.pressedForegroundColor, b?.pressedForegroundColor, t),
      hoveredBackgroundColor:
          Color.lerp(a?.hoveredBackgroundColor, b?.hoveredBackgroundColor, t),
      hoveredForegroundColor:
          Color.lerp(a?.hoveredForegroundColor, b?.hoveredForegroundColor, t),
    );
  }

  /// Creates a copy of this theme but with the given fields replaced with the
  /// new values.
  ShadToggleTheme copyWith({
    bool? merge,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    Color? hoveredBackgroundColor,
    Color? hoveredForegroundColor,
  }) {
    return ShadToggleTheme(
      merge: merge ?? this.merge,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      hoveredBackgroundColor:
          hoveredBackgroundColor ?? this.hoveredBackgroundColor,
      hoveredForegroundColor:   
          hoveredForegroundColor ?? this.hoveredForegroundColor,
    );
  }

  /// Merges this theme with another `ShadToggleTheme`.
  ///
  /// The `other` theme's properties will override this theme's properties.
  ShadToggleTheme mergeWith(ShadToggleTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      hoveredBackgroundColor: other.hoveredBackgroundColor,
      hoveredForegroundColor: other.hoveredForegroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadToggleTheme &&
        other.merge == merge &&
        other.pressedBackgroundColor == pressedBackgroundColor &&
        other.pressedForegroundColor == pressedForegroundColor &&
        other.hoveredBackgroundColor == hoveredBackgroundColor &&
        other.hoveredForegroundColor == hoveredForegroundColor;
  }

  @override
  int get hashCode =>
      merge.hashCode ^
      pressedBackgroundColor.hashCode ^
      pressedForegroundColor.hashCode ^
      hoveredBackgroundColor.hashCode ^
      hoveredForegroundColor.hashCode;
}
