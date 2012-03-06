package de.headione.utils {
	import flash.display.DisplayObjectContainer;

	/**
	 * @author Norman Sander
	 */
	public class HOUtils {
		public static function removeChildren( mc : DisplayObjectContainer ) : void {
			while ( mc.numChildren ) {
				mc.removeChildAt( 0 );
			}
		}
	}
}