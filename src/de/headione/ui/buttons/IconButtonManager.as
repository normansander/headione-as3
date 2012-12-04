package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;

	import flash.display.MovieClip;
	/**
	 * @author Norman Sander, 2012
	 */
	public class IconButtonManager extends ButtonManager implements IManager{

		public function IconButtonManager( displayObject : MovieClip ) {
			super( displayObject );
		}

		override public function set enabled( value : Boolean ) : void {
			_enabled = value;
			_do.mouseEnabled = _enabled;
			_do.alpha = value || selected ? 1 : 0.5;
		}
	}
}
