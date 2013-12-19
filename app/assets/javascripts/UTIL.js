UTIL = {
  exec: function( controller, action ) {
    var ns = window[controller],
        action = ( action === undefined ) ? "init" : action;

    if ( controller !== ""  && typeof ns[action] == "function" ) {
      ns[action]();
    }
  },

  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );

    //UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};

$( document ).ready( UTIL.init );
$( document ).on( 'page:load', UTIL.init );
