part of client;

class ThingRenderingSystem extends EntityProcessingSystem {
  Mapper<Position> pm;
  CanvasRenderingContext2D ctx;
  ThingRenderingSystem(this.ctx) : super(Aspect.getAspectForAllOf([Position]));

  @override
  void processEntity(Entity entity) {
    var pos = pm[entity];

    ctx
      ..save()
      ..fillStyle = 'white'
      ..fillRect(pos.x - 2.0, pos.y - 2.0, 4.0, 4.0)
      ..restore();
  }
}
