package de.headione.utils {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;

	/**
	 * @author Norman Sander
	 */
	public class HOUtils {
		public static function removeChildren( mc : DisplayObjectContainer ) : void {
			while ( mc.numChildren ) {
				mc.removeChildAt( 0 );
			}
		}
		
		public static function elementInArray( element : *, array : Array ) : Boolean {
			var ret : Boolean = false;
			for each (var i : * in array) {
				if (i == element) ret = true;
			}
			return ret;
		}

		public static function centerAllObjectsOf( asset : MovieClip, bySizeOf : MovieClip = null ) : void {
			var biggestWidth : Number = 0;
			var biggestHeight : Number = 0;

			if (!bySizeOf) {
				for (var i : int = 0; i < asset.numChildren; i++) {
					if (asset.getChildAt( i ).width > biggestWidth) biggestWidth = asset.getChildAt( i ).width;
					if (asset.getChildAt( i ).height > biggestHeight) biggestHeight = asset.getChildAt( i ).height;
				}
			} else {
				biggestWidth = bySizeOf.width;
				biggestHeight = bySizeOf.height;
			}
			var deltaX : Number = biggestWidth / 2;
			var deltaY : Number = biggestHeight / 2;

			for (i = 0; i < asset.numChildren; i++) {
				asset.getChildAt( i ).x -= deltaX;
				asset.getChildAt( i ).y -= deltaY;
			}
		}

		public static function posBeneath( master : DisplayObject, margin : Number ) : Point {
			var ret : Point = new Point();
			ret.x = master.x;
			ret.y = Math.round( master.y + master.height + margin );
			return ret;
		}
		
		private static function onScrollTextField( event : Event ) : void {
			event.target.scrollV = 0;
		}
	}
}