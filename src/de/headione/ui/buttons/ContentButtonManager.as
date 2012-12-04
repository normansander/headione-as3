package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	/**
	 * @author Norman Sander, 2012
	 */
	[Event(name="button_clicked", type="de.headione.events.ControllerEvent")]
	public class ContentButtonManager extends ButtonManager implements IManager {

		protected var _label : String;

		public function ContentButtonManager( displayObject : MovieClip, label : String ) {
			_label = label;
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do._tf.autoSize = TextFieldAutoSize.LEFT;
			_do._tf.text = _label;
			_do._bg.width = _do._tf.width + 40;
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			_do._bg.alpha = .7;
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			_do._bg.alpha = 1;
		}
	}
}