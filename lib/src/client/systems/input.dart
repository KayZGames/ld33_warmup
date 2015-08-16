part of client;

class GamepadInputHandlingSystem extends EntitySystem {
  Mapper<Position> pm;
  Mapper<Controller> cm;

  GamepadInputHandlingSystem()
      : super(Aspect.getAspectForAllOf([Position, Controller]));

  @override
  void processEntities(Iterable<Entity> entities) {
    window.navigator.getGamepads().forEach((Gamepad gamepad) {
      if (null != gamepad) {
        entities.forEach((e) {
          var pos = pm[e];
          var c = cm[e];

          pos.x += gamepad.axes[c.index * 2];
          pos.y += gamepad.axes[c.index * 2 + 1];
        });
      }
    });
  }

  @override
  bool checkProcessing() => true;
}
