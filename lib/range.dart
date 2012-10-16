library dn_util;

typedef void RangeCallback(num n);

class _RangeIterator extends Iterator<num> {
  Range _range;
  num _current;
  _RangeIterator(this._range) {
    _current = _range.start;
  }
  bool hasNext() {
    return _current <= _range.end;
  }
  num next() {
    var ret = _current;
    _current += _range.inc;
    return ret;
  }
}

class Range extends Iterable<num> {
  num _start;
  num _end;
  num _inc;
  Range(this._start, this._end, [this._inc = 1]) {
  }
  Iterator<num> iterator() {
    return new _RangeIterator(this);
  }
  num get start() => _start;
  num get end() => _end;
  num get inc() => _inc;
  
  void forEach(RangeCallback cb) {
    for ( var i in this ) {
      cb(i);
    }
  }
}

Range range(num s, num e, [num inc = 1]) {
  return new Range(s, e, inc);
}

