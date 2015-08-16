library client;

import 'dart:html' hide Player, Timeline;
export 'dart:html' hide Player, Timeline;
import 'package:ld33_warmup/shared.dart';
import 'package:gamedev_helpers/gamedev_helpers.dart';
export 'package:gamedev_helpers/gamedev_helpers.dart';
//part 'src/client/systems/name.dart';
part 'src/client/systems/events.dart';
part 'src/client/systems/input.dart';
part 'src/client/systems/rendering.dart';

class Game extends GameBase {
  CanvasElement hudCanvas;
  CanvasRenderingContext2D hudCtx;

  Game() : super.noAssets('ld33_warmup', '#game', 800, 600, webgl: true) {
    hudCanvas = querySelector('#hud');
    hudCtx = hudCanvas.context2D;
    hudCtx
      ..textBaseline = 'top'
      ..font = '16px Verdana';
  }
  void createEntities() {
     addEntity([new Position(400.0, 300.0), new Controller(0)]);
     addEntity([new Position(400.0, 300.0), new Controller(1)]);
  }
  Map<int, List<EntitySystem>> getSystems() {
    return {
      GameBase.rendering: [
        new GamepadInputHandlingSystem(),
        new WebGlCanvasCleaningSystem(ctx),
        new CanvasCleaningSystem(hudCanvas),
        new ThingRenderingSystem(hudCtx),
        new FpsRenderingSystem(hudCtx, fillStyle: 'white'),
      ],
      GameBase.physics: [
        new MovementSystem(),
      ]
    };
  }
}

