package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Norman Sander, 2012
	 */
	public class TimelineboxButtonManager extends ButtonManager implements IManager {

		private var _label : String;
		private var _elapsed : Boolean;
		private var _active : Boolean;
		private var _absolved : Boolean;
		private var _id : int;

		public function TimelineboxButtonManager( displayObject : MovieClip, label : String ) {
			_label = label;
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do._tf.text = _label;
			_do._check.visible = false;
			_do._circle.visible = false;
			_do._bgFilled.visible = false;
			enabled = false;
		}

		override protected function onClick( event : MouseEvent ) : void {
			dispatchEvent( event );
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			_do.alpha = .6;
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			_do.alpha = 1;
		}

		public function set elapsed( value : Boolean ) : void {
			_elapsed = value;
			_do._bgFilled.visible = _elapsed;
			enabled = true;
		}

		override public function set enabled( enabled : Boolean ) : void {
			_enabled = enabled;
			_do.mouseEnabled = _enabled;
		}

		public function set active( value : Boolean ) : void {
			_active = value;
			_do._circle.visible = _active;
		}

		public function set absolved( value : Boolean ) : void {
			_absolved = value;
			_do._check.visible = _absolved;
		}

		public function set id( id : int ) : void {
			_id = id;
		}

		public function get id() : int {
			return _id;
		}
	}
}
