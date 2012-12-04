package de.headione.utils {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	/**
	 * @author Norman Sander
	 */
	public class HOUtils {

		public static function xmlTranslater( xmlNode : XMLList, entry : Class, xmlDescriptions : Array, classDescriptions : Array ) : Dictionary {
			var dict : Dictionary = new Dictionary();
			for each (var  xml: XML in xmlNode) {
				var vo : Object = new entry();
				for (var i : int = 0; i < xmlDescriptions.length; i++) {
					vo[classDescriptions[i]] = xml[xmlDescriptions[i]];
				}
				dict[String( xml.@key )] = vo;
			}
			return dict;
		}

		public static function xmlStringsTranslater( xmlNode : XMLList ) : Dictionary {
			var dict : Dictionary = new Dictionary();
			for each (var  xml: XML in xmlNode) {
				dict[String( xml.@key )] = xml.toString();
			}
			return dict;
		}

		public static function setBasicStyle( tf : TextField ) : void {
			var style : StyleSheet = new StyleSheet();
			var link : Object = new Object();
			link.fontWeight = "bold";
			link.textDecoration = "underline";
			link.color = ColorConstants.GRAY;
			var hover : Object = new Object();
			hover.fontWeight = "bold";
			hover.textDecoration = "underline";
			hover.color = ColorConstants.BLUE;
			style.setStyle( "a:link", link );
			style.setStyle( "a:hover", hover );
			tf.styleSheet = style;
		}

		public static function stringToPoint( string : String ) : Point {
			var positions : Array = String( string ).split( "," );
			var ret : Point = new Point( positions[0], positions[1] );
			return ret;
		}

		public static function removeChildren( mc : DisplayObjectContainer ) : void {
			while ( mc.numChildren ) {
				mc.removeChildAt( 0 );
			}
		}

		public static function rad2deg( rad : Number ) : Number {
			return rad * (180 / Math.PI);
		}

		public static function deg2rad( degree : Number ) : Number {
			return degree * (Math.PI / 180);
		}

		public static function getAreaBitmap( asset : DisplayObject, area : Rectangle ) : Bitmap {
			var assetBitmapData : BitmapData = new BitmapData( asset.width, asset.height, true, 0x000000 );
			assetBitmapData.draw( asset );

			var areaBitmapData : BitmapData = new BitmapData( area.width, area.height, true, 0x000000 );
			areaBitmapData.copyPixels( assetBitmapData, area, new Point( 0, 0 ) );

			var areaBitmap : Bitmap = new Bitmap( areaBitmapData );

			return areaBitmap;
		}

		public static function getBitmap( asset : DisplayObject ) : Bitmap {
			var assetBitmapData : BitmapData = new BitmapData( asset.width, asset.height, true, 0 );
			assetBitmapData.draw( asset, new Matrix(), null, null, null, true );

			var assetBitmap : Bitmap = new Bitmap( assetBitmapData );

			return assetBitmap;
		}

		public static function getSmoothedCenteredMovieclip( asset : DisplayObject ) : MovieClip {
			var centerContainer : MovieClip = new MovieClip();

			var assetBitmapData : BitmapData = new BitmapData( asset.width, asset.height, true, 0 );
			assetBitmapData.draw( asset, new Matrix(), null, null, null, true );

			var shape : Shape = new Shape();
			shape.graphics.beginBitmapFill( assetBitmapData, new Matrix(), false, true );
			shape.graphics.drawRect( 0, 0, asset.width, asset.height );
			shape.graphics.endFill();

			centerObjectInContainer( shape, centerContainer );
			centerContainer.addChild( shape );
			return centerContainer;
		}

		public static function centerObjectInContainer( object : DisplayObject, container : DisplayObject ) : void {
			object.x = Math.round( container.width / 2 - object.width / 2 );
			object.y = Math.round( container.height / 2 - object.height / 2 );
		}

		public static function grab( source : DisplayObject, rect : Rectangle, smoothing : Boolean = true ) : BitmapData {
			var draw : BitmapData = new BitmapData( source.width, source.height, true, 0 );
			var copy : BitmapData = new BitmapData( rect.width, rect.height, true, 0 );

			draw.draw( source, null, null, null, null, smoothing );
			copy.copyPixels( draw, rect, new Point( 0, 0 ) );

			draw.dispose();

			return copy;
		}

		public static function disableTextScrolling( tf : TextField ) : void {
			tf.addEventListener( Event.SCROLL, lockTf );
		}

		private static function lockTf( event : Event ) : void {
			event.target.scrollV = 0;
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
	}
}