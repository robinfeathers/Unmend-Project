var _current = argument[0]
var _max = argument[1]
var _inc = argument[2]

_current += _inc
if _current < 0 {_current += _max + 1}
if _current > _max {_current -= _max + 1}
return _current