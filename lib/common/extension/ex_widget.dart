import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../values/images.dart';

typedef GestureOnTapChangeCallback = void Function<T>(T val);

extension ExWidget on Widget {
  Widget align(
    AlignmentGeometry alignment, {
    Key? key,
  }) =>
      Align(
        key: key,
        alignment: alignment,
        child: this,
      );

  Widget alignCenter() => align(Alignment.center);

  Widget alignLeft() => align(Alignment.centerLeft);

  Widget alignRight() => align(Alignment.centerRight);

  Widget alignTop() => align(Alignment.topCenter);

  Widget alignBottom() => align(Alignment.bottomCenter);

  Widget aspectRatio({
    Key? key,
    required double aspectRatio,
  }) =>
      AspectRatio(
        key: key,
        aspectRatio: aspectRatio,
        child: this,
      );

  Widget backgroundColor(
    Color color, {
    Key? key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: BoxDecoration(color: color),
        child: this,
      );

  Widget backgroundImage(
    DecorationImage image, {
    Key? key,
  }) =>
      DecoratedBox(
        key: key,
        decoration: BoxDecoration(image: image),
        child: this,
      );

  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
  }) {
    BoxDecoration decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all ?? 0, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all ?? 0, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all ?? 0, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
      ),
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      child: this,
    );
  }

  Widget borderRadius({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0.0),
        topRight: Radius.circular(topRight ?? all ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
      ),
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      child: this,
    );
  }

  Widget boxShadow({
    Key? key,
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
  }) {
    BoxDecoration decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      child: this,
    );
  }

  /// Card
  Widget card({
    Key? key,
    Clip? clip,
    required Color color,
    BoxBorder? outsideBorder,
    required double radius,
  }) =>
      Container(
        clipBehavior: clip ?? Clip.none,
        decoration: BoxDecoration(
          color: color,
          border: outsideBorder,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: this,
      );

  Widget center({
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  Widget clipOval({Key? key}) => ClipOval(
        key: key,
        child: this,
      );

  Widget clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ClipRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget clipRRect({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
        child: this,
      );

  Widget constrained({
    Key? key,
    double? width,
    double? height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null)
        ? constraints.tighten(width: width, height: height)
        : constraints;
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }

  Widget unconstrained({
    Key? key,
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    Axis? constrainedAxis,
    Clip clipBehavior = Clip.none,
  }) =>
      UnconstrainedBox(
        key: key,
        textDirection: textDirection,
        alignment: alignment,
        constrainedAxis: constrainedAxis,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
  }) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  Widget elevation(
    double elevation, {
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        child: this,
      );

  Widget expanded({
    Key? key,
    int flex = 1,
  }) =>
      Expanded(
        key: key,
        flex: flex,
        child: this,
      );

  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.centerLeft,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
        key: key,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(
        key: key,
        flex: flex,
        fit: fit,
        child: this,
      );

  Widget fractionallySizedBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      FractionallySizedBox(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  Widget gestures({
    Key? key,
    GestureOnTapChangeCallback? onTapChange,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: () {
          if (onTap != null) onTap();
          if (onTapChange != null) onTapChange(false);
        },
        onTapUp: onTapUp,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragCancel: onVerticalDragCancel,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragDown: onHorizontalDragDown,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onScaleStart: onScaleStart,
        onScaleEnd: onScaleEnd,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  Widget onTap(
    GestureTapCallback? onTap, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  Widget onLongPress(
    GestureTapCallback? onLongPress, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onLongPress: onLongPress,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  Widget height(
    double height, {
    Key? key,
  }) =>
      ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(height: height),
        child: this,
      );

  Widget limitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) =>
      LimitedBox(
        key: key,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: this,
      );

  Widget offstage({
    Key? key,
    bool offstage = true,
  }) =>
      Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  Widget opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this,
      );

  Widget overflow({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      OverflowBox(
        key: key,
        alignment: alignment,
        minWidth: minWidth,
        maxWidth: minWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: this,
      );

  Widget padding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        child: this,
      );

  Widget paddingAll(double val) => padding(all: val);

  Widget paddingBottom(double val) => padding(bottom: val);

  Widget paddingHorizontal(double val) => padding(horizontal: val);

  Widget paddingLeft(double val) => padding(left: val);

  Widget paddingRight(double val) => padding(right: val);

  Widget paddingTop(double val) => padding(top: val);

  Widget paddingVertical(double val) => padding(vertical: val);

  Widget sliverPadding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      SliverPadding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        sliver: this,
      );

  Widget sliverPaddingBottom(double val) => sliverPadding(bottom: val);

  Widget sliverPaddingHorizontal(double val) => sliverPadding(horizontal: val);

  Widget sliverPaddingLeft(double val) => sliverPadding(left: val);

  Widget sliverPaddingRight(double val) => sliverPadding(right: val);

  Widget sliverPaddingTop(double val) => sliverPadding(top: val);

  Widget sliverPaddingVertical(double val) => sliverPadding(vertical: val);

  Widget positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  Widget inkWell({
    Key? key,
    Function()? onTap,
    double? borderRadius,
  }) =>
      Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            borderRadius: borderRadius != null
                ? BorderRadius.all(
                    Radius.circular(borderRadius),
                  )
                : null,
            onTap: onTap ?? () {},
            child: this,
          ),
        ),
      );

  Widget ripple({
    Key? key,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    bool autoFocus = false,
    bool enable = true,
  }) =>
      enable
          ? Builder(
              key: key,
              builder: (BuildContext context) {
                GestureDetector? gestures =
                    context.findAncestorWidgetOfExactType<GestureDetector>();
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: focusColor,
                    hoverColor: hoverColor,
                    highlightColor: highlightColor,
                    splashColor: splashColor,
                    splashFactory: splashFactory,
                    radius: radius,
                    customBorder: customBorder,
                    enableFeedback: enableFeedback,
                    excludeFromSemantics: excludeFromSemantics,
                    focusNode: focusNode,
                    canRequestFocus: canRequestFocus,
                    autofocus: autoFocus,
                    onTap: gestures?.onTap,
                    child: this,
                  ),
                );
              },
            )
          : Builder(
              key: key,
              builder: (context) => this,
            );

  Widget safeArea({
    Key? key,
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) =>
      SafeArea(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );

  Widget scale({
    Key? key,
    double? all,
    double? x,
    double? y,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: Matrix4.diagonal3Values(x ?? all ?? 0, y ?? all ?? 0, 1.0),
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  Widget scrollable({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    EdgeInsetsGeometry? padding,
  }) =>
      SingleChildScrollView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        padding: padding,
        child: this,
      );

  Widget semanticsLabel(
    String label, {
    Key? key,
  }) =>
      Semantics.fromProperties(
        key: key,
        properties: SemanticsProperties(label: label),
        child: this,
      );

  Widget tight({
    double? width,
    double? height,
    Key? key,
  }) =>
      ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: this,
      );

  Widget tightSize(
    double size, {
    Key? key,
  }) =>
      ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: size, height: size),
        child: this,
      );

  Widget transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: transform,
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  Widget translate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
  }) =>
      Transform.translate(
        key: key,
        offset: offset,
        transformHitTests: transformHitTests,
        child: this,
      );

  Widget width(
    double width, {
    Key? key,
  }) =>
      ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: width),
        child: this,
      );

  Widget sliverToBoxAdapter({
    Key? key,
  }) =>
      SliverToBoxAdapter(key: key, child: this);

  Widget gradientBody() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImages.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: this,
      );

  Widget visibility(bool isVisible) => Visibility(
        visible: isVisible,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: this,
      );
}
