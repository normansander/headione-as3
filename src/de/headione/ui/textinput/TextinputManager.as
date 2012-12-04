package de.headione.ui.textinput {
	import de.headione.interfaces.IManager;
	import de.headione.ui.CoreInteractiveManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * @author Norman Sander, 2012
	 */
	public class TextinputManager extends CoreInteractiveManager implements IManager {

		private var _label : String;
		private var _align : String;
		private var _xRight : int;
		private var _restrict : String;
		private var _maxChars : int;
		private var _error : Boolean = false;
		private var _displayAsPassword : Boolean;
		private var _tabIndex : uint;
		private var _selectable : Boolean;

		public function TextinputManager( displayObject : MovieClip, label : String, align : String = "left" ) {
			_label = label;
			_align = align;
			_xRight = int( displayObject.x + displayObject.width );
			super( displayObject );
		}

		override protected function setup() : void {
			_do._border.visible = false;
			_do._tf.text = _label;
			maxChars = 100;
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
		}

		override public function set width( value : Number ) : void {
			_do._border.width = value;
			_do._bg.width = value - 2;
			_do._tf.width = value - 5;
			if (_align == "right")
				_do.x = _xRight - int( _do.width );
		}

		public function set restrict( value : String ) : void {
			_restrict = value;
			TextField( _do._tf ).restrict = _restrict;
		}

		public function set maxChars( value : int ) : void {
			_maxChars = value;
			TextField( _do._tf ).maxChars = _maxChars;
		}

		public function set displayAsPassword( value : Boolean ) : void {
			_displayAsPassword = value;
			TextField( _do._tf ).displayAsPassword = _displayAsPassword;
		}

		public function set input( value : String ) : void {
			_do._tf.text = value;
		}

		public function get input() : String {
			return _do._tf.text;
		}

		public function set error( value : Boolean ) : void {
			_error = value;
			_do._border.visible = _error;
			if (_error) {
				_do._bg.visible = true;
				selectable = true;
			}
		}

		public function get error() : Boolean {
			return _error;
		}

		public function set tabIndex( value : uint ) : void {
			_tabIndex = value;
			TextField( _do._tf ).tabIndex = _tabIndex;
		}

		public function get selectable() : Boolean {
			return _selectable;
		}

		public function set selectable( value : Boolean ) : void {
			_selectable = selectable;
			_do._tf.selectable = value;
			_do._bg.visible = value;
		}
	}
}