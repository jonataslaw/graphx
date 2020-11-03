import 'dart:collection';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../../graphx.dart';
import 'signal.dart';

mixin EventDispatcherMixin implements Listenable {
  final _updaters = HashSet<VoidCallback>();

  void notify() {
    for (final updater in _updaters) updater();
  }

  @override
  void addListener(listener) => _updaters.add(listener);

  @override
  void removeListener(listener) => _updaters.remove(listener);

  void dispose() {
    _updaters.clear();
  }
}

mixin TickerSignalMixin {
  EventSignal<double> $onEnterFrame;

  EventSignal<double> get onEnterFrame =>
      $onEnterFrame ??= EventSignal<double>();

  void $disposeTickerSignals() {
    $onEnterFrame?.removeAll();
    $onEnterFrame = null;
  }
}

mixin JugglerSignalMixin {
  EventSignal<JugglerObjectEventData> $onRemovedFromJuggler;
  EventSignal<JugglerObjectEventData> get onRemovedFromJuggler =>
      $onRemovedFromJuggler ??= EventSignal<JugglerObjectEventData>();
}

mixin ResizeSignalMixin {
  Signal $onResized;
  Signal get onResized => $onResized ??= Signal();

  void $disposeResizeSignals() {
    $onResized?.removeAll();
    $onResized = null;
  }
}

mixin DisplayListSignalsMixin {
  Signal $onAdded;

  Signal get onAdded => $onAdded ??= Signal();

  Signal $onRemoved;

  Signal get onRemoved => $onRemoved ??= Signal();

  Signal $onRemovedFromStage;

  Signal get onRemovedFromStage => $onRemovedFromStage ??= Signal();

  Signal $onAddedToStage;

  Signal get onAddedToStage => $onAddedToStage ??= Signal();

  void $disposeDisplayListSignals() {
    $onAdded?.removeAll();
    $onAdded = null;
    $onRemoved?.removeAll();
    $onRemoved = null;
    $onRemovedFromStage?.removeAll();
    $onRemovedFromStage = null;
    $onAddedToStage?.removeAll();
    $onAddedToStage = null;
  }
}

mixin RenderSignalMixin {
  Signal $onPrePaint;
  Signal $onPostPaint;
  Signal $onPaint;

  Signal get onPrePaint => $onPrePaint ??= Signal();

  Signal get onPostPaint => $onPostPaint ??= Signal();

  Signal get onPaint => $onPaint ??= Signal();

  void $disposeRenderSignals() {
    $onPrePaint?.removeAll();
    $onPrePaint = null;
    $onPostPaint?.removeAll();
    $onPostPaint = null;
    $onPaint?.removeAll();
    $onPaint = null;
  }
}

/// use mouse signal for now.
mixin MouseSignalsMixin<T extends MouseInputData> {
  EventSignal<T> $onRightMouseDown;
  EventSignal<T> $onMouseDoubleClick;
  EventSignal<T> $onMouseClick;
  EventSignal<T> $onMouseDown;
  EventSignal<T> $onMouseUp;
  EventSignal<T> $onMouseMove;
  EventSignal<T> $onMouseOut;
  EventSignal<T> $onMouseOver;
  EventSignal<T> $onMouseWheel;

  EventSignal<T> get onMouseClick => $onMouseClick ??= EventSignal();
  EventSignal<T> get onMouseDoubleClick =>
      $onMouseDoubleClick ??= EventSignal();
  EventSignal<T> get onRightMouseDown => $onRightMouseDown ??= EventSignal();
  EventSignal<T> get onMouseDown => $onMouseDown ??= EventSignal();
  EventSignal<T> get onMouseUp => $onMouseUp ??= EventSignal();
  EventSignal<T> get onMouseMove => $onMouseMove ??= EventSignal();
  EventSignal<T> get onMouseOver => $onMouseOver ??= EventSignal();
  EventSignal<T> get onMouseOut => $onMouseOut ??= EventSignal();
  EventSignal<T> get onMouseScroll => $onMouseWheel ??= EventSignal();

  void $disposePointerSignals() {
    $onRightMouseDown?.removeAll();
    $onRightMouseDown = null;
    $onMouseClick?.removeAll();
    $onMouseClick = null;
    $onMouseDoubleClick?.removeAll();
    $onMouseDoubleClick = null;
    $onMouseDown?.removeAll();
    $onMouseDown = null;
    $onMouseUp?.removeAll();
    $onMouseUp = null;
    $onMouseMove?.removeAll();
    $onMouseMove = null;
    $onMouseOver?.removeAll();
    $onMouseOver = null;
    $onMouseOut?.removeAll();
    $onMouseOut = null;
    $onMouseWheel?.removeAll();
    $onMouseWheel = null;
  }
}

mixin PointerSignalsMixin<T extends PointerEventData> {
  EventSignal<T> $onClick;
  EventSignal<T> $onDown;
  EventSignal<T> $onUp;
  EventSignal<T> $onHover;
  EventSignal<T> $onOut;
  EventSignal<T> $onScroll;

  EventSignal<T> get onClick => $onClick ??= EventSignal();
  EventSignal<T> get onDown => $onDown ??= EventSignal();
  EventSignal<T> get onUp => $onUp ??= EventSignal();
  EventSignal<T> get onHover => $onHover ??= EventSignal();
  EventSignal<T> get onOut => $onOut ??= EventSignal();
  EventSignal<T> get onScroll => $onScroll ??= EventSignal();

  void $disposePointerSignals() {
    $onClick?.removeAll();
    $onClick = null;
    $onDown?.removeAll();
    $onDown = null;
    $onUp?.removeAll();
    $onUp = null;
    $onHover?.removeAll();
    $onHover = null;
    $onOut?.removeAll();
    $onOut = null;
    $onScroll?.removeAll();
    $onScroll = null;
  }
}