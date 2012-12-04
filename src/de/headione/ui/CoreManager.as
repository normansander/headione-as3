package de.headione.ui {
	import de.headione.interfaces.IManager;

	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	/**
	 * @author Norman Sander
	 */
	public class CoreManager extends EventDispatcher implements IManager {

		protected var _do : MovieClip;
		protected var _config : Object;
		protected var _visible : Boolean;

		public function CoreManager( displayObject : MovieClip, config : Object = null ) {
			_do = displayObject;
			_config = config;
			init();
			setup();
			addListener();
		}

		protected function init() : void {
		}

		protected function setup() : void {
		}

		protected function addListener() : void {
		}

		protected function removeListener() : void {
		}

		/**
		 * LOGGING
		 */
		protected function log( ...args : * ) : void {
			if (Constants.DEBUG_MODE) Cc.logch( this, args );
		}

		protected function logInfo( ...args : * ) : void {
			if (Constants.DEBUG_MODE) Cc.infoch( this, args );
		}

		protected function logWarn( ...args : * ) : void {
			if (Constants.DEBUG_MODE) Cc.warnch( this, args );
		}

		protected function logError( ...args : * ) : void {
			if (Constants.DEBUG_MODE) Cc.errorch( this, args );
		}

		/**
		 * PUBLIC
		 */
		public function show() : void {
			_do.visible = true;
		}

		public function hide() : void {
			_do.visible = false;
		}

		public function dispose() : void {
			removeListener();
		}

		public function freeze() : void {
		}

		public function unfreeze() : void {
		}

		/**
		 * GETTER AND SETTER
		 */
		public function get display() : MovieClip {
			return _do;
		}

		public function set x( xPos : Number ) : void {
			_do.x = int( xPos );
		}

		public function set y( yPos : Number ) : void {
			_do.y = int( yPos );
		}

		public function get x() : Number {
			return _do.x;
		}

		public function get y() : Number {
			return _do.y;
		}

		public function set width( value : Number ) : void {
			_do.width = value;
		}

		public function get width() : Number {
			return _do.width;
		}

		public function get height() : Number {
			return _do.height;
		}

		public function set visible( value : Boolean ) : void {
			_visible = value;
			_do.visible = value;
		}

		public function get visible() : Boolean {
			return _visible;
		}
	}
}