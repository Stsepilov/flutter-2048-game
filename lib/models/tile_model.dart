class TileModel {
  (int, int) _index;
  int _value = 0;

  TileModel(this._index, [this._value = 0]);

  int get value => _value;
  (int, int) get index => _index;

  set value(int value) => _value = value;
}