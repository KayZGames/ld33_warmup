part of shared;


class MovementSystem extends EntityProcessingSystem {
  MovementSystem() : super(Aspect.getAspectForAllOf([]));

  @override
  void processEntity(Entity entity) {
    // just a dummy..
  }
}