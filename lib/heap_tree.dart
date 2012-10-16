library dn_util;

class HeapTree<E> {
  List<E> _nodes;

  HeapTree() {
    _nodes = new List<E>();
    _nodes.add(0);  // dummy
  }

  void add(E e) {
    _nodes.add(e);
    int n = (_nodes.length - 1).toInt();
    int parent = (n / 2).toInt();
    while ( n > 1 && _nodes[parent] < _nodes[n] ) {
      _swap(n, parent);
      n = parent;
      parent = (n / 2).toInt();
    }
  }

  E removeTop() {
    var ret = _nodes[1];
    var last = _nodes.removeLast();
    if ( _nodes.length == 1 ) {
      return last;
    }
    _nodes[1] = last;

    var n = 1;
    while ( true ) {
      var lidx = 2*n;
      var ridx = 2*n+1;

      var lgreater = ( lidx < _nodes.length && _nodes[n] < _nodes[lidx] );
      var rgreater = ( ridx < _nodes.length && _nodes[n] < _nodes[ridx] );
      if ( lgreater && rgreater ) {
        if ( _nodes[lidx] < _nodes[ridx] ) {
          _swap(n, ridx);
          n = ridx;
        } else {
          _swap(n, lidx);
          n = lidx;
        }
      } else if ( lgreater ) {
        _swap(n, lidx);
        n = lidx;
      } else if ( rgreater ) {
        _swap(n, ridx);
        n = ridx;
      } else {
        break;
      }
    }
    
    return ret;
  }

  void _swap(int idx1, int idx2) {
    var t = _nodes[idx1];
    _nodes[idx1] = _nodes[idx2];
    _nodes[idx2] = t;
  }
}

