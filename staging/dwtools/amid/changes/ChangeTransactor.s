( function _ChangeTransactor_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wProto' );

  require( './Changes.s' );

}

var _ = _global_.wTools;
var _hasOwnProperty = Object.hasOwnProperty;

//

function _mixin( cls )
{

  var dstProto = cls.prototype;

  _.mixinApply
  ({
    dstProto : dstProto,
    descriptor : Self,
  });

  _.assert( arguments.length === 1 );
  _.assert( dstProto.Events.changed );

}

//

function changeBegin()
{
  var self = this;

  _.assert( arguments.length === 0 );
  _.assert( self._changeLevel >= 0 );

  self._changeLevel += 1;

}

//

function changeEnd()
{
  var self = this;

  _.assert( arguments.length === 0 );
  _.assert( self._changeLevel >= 1 );

  self._changeLevel -= 1;

  if( self._changeLevel === 0 )
  self._changed();

}

//

function changed()
{
  var self = this;

  _.assert( arguments.length === 0 );

  if( self._changeLevel === 0 )
  self._changed();

}

//

function _changed()
{
  var self = this;

  if( _.routineIs( self.eventGive ) )
  self.eventGive({ kind : 'changed' });

}

// --
// define class
// --

var Composes =
{
}

var Restricts =
{
  _changeLevel : 0,
}

var Statics =
{
}

var Events =
{
  'changed' : 'changed',
}

var Functor =
{
}

var Supplement =
{

  changeBegin : changeBegin,
  changeEnd : changeEnd,
  changed : changed,
  _changed : _changed,

  Composes : Composes,
  Restricts : Restricts,
  Statics : Statics,
  Events : Events,

}

//

var Self =
{

  _mixin : _mixin,

  functor : Functor,
  supplement : Supplement,

  name : 'wChangeTransactor',
  nameShort : 'ChangeTransactor',

}

//

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;
_global_[ Self.name ] = _[ Self.nameShort ] = _.mixinMake( Self );

})();
