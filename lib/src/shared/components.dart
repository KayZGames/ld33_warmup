part of shared;


class Position extends Component {
  Vector2 _pos;
  Position(double x, double y) : _pos = new Vector2(x, y);
  double get x => _pos.x;
  double get y => _pos.y;
  set x(double value) => _pos.x = value;
  set y(double value) => _pos.y = value;
}

class Controller extends Component {
  int index;
  Controller(this.index);
}