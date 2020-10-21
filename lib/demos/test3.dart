import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphx/gameutils.dart';
import 'package:graphx/graphx/display/sprite.dart';
import 'package:graphx/graphx/scene_painter.dart';
import 'package:graphx/graphx/utils/math_utils.dart';

class Test3Scene extends RootScene {
  @override
  init() {
    owner.needsRepaint = true;
    owner.core.config.usePointer = true;
    owner.core.config.useTicker = true;
    owner.core.config.painterWillChange = true;
  }

  @override
  void ready() {
    super.ready();

    owner.core.resumeTicker();

    var car = Sprite();
    addChild(car);

    car.y = 10;
    car.x = 10;
//    car.rotation = .3;
    car.graphics.beginFill(0xff0000).drawRect(0, 0, 30, 40).endFill();
    car.alignPivot(Alignment.bottomCenter);
    var c1 = Sprite();
    car.addChild(c1);
    c1.graphics
        .beginFill(Colors.blue.value)
        .drawRoundRect(0, 0, 20, 20, 4)
        .endFill();
//    c1.graphics.beginFill(0x00ff00).drawCircle(0, 0, 2).endFill();
    car.setPosition(100, 100);
    c1.x = -10;
    c1.alpha = 0.74;
    double cnt = 0;
    stage.onEnterFrame.add(() {
      cnt += .01;
      car.rotation += .01;
      c1.skewX = (.5 + sin(cnt) / 2) * 1.3;
    });
    List.generate(20, (index) {
      var box = Sprite();
      box.graphics
          .lineStyle(0x0, Colors.redAccent.value, 1)
          .beginFill(GameUtils.rndFromList<Color>(Colors.primaries).value, .6)
          .drawRoundRect(0, 0, 50, 40, 8)
          .endFill();
      box.scaleY = GameUtils.rndRange(.6, 1.5);
      box.scaleX = GameUtils.rndRange(.3, 2.5);
      box.rotation = GameUtils.rndRange(0, MathUtils.pi2 * 2);
      box.x = GameUtils.rndRange(-stage.stageWidth / 2, stage.stageWidth / 2);
      box.y = GameUtils.rndRange(-100, 100);
      car.addChild(box);
    });
    car.name = 'car';
    c1.name = 'c1';
    stage.pointer.onDown.add((e) {
      var p = e.stagePosition;
      car.globalToLocal(p, p);
      final obj = car.hitTest(p);
      obj?.alpha = obj?.alpha == 1 ? 0.5 : 1.0;
    });
  }
}