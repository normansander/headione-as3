package de.headione.ui.checkbox {
	import de.headione.interfaces.IManager;
	import de.headione.ui.buttons.ButtonManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	/**
	 * @author Norman Sander, 2012
	 */
	public class CheckboxManager extends ButtonManager implements IManager {

		private var _label : String;

		public function CheckboxManager( displayObject : MovieClip, label : String ) {
			_label = label;
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do._label._tf.autoSize = TextFieldAutoSize.LEFT;
			_do._label._tf.text = _label;
			_do._checkBox._check.visible = false;
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			_do._checkBox.alpha = .8;
			_do._label.alpha = .8;
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			_do._checkBox.alpha = 1;
			_do._label.alpha = 1;
		}

		override public function get selected() : Boolean {
			return _selected;
		}

		override public function set selected( selected : Boolean ) : void {
			_selected = selected;
			_do._checkBox._check.visible = _selected;
		}
	}
}
