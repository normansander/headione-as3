package de.headione.fx {
	import de.headione.utils.HOUtils;

	import com.greensock.TweenLite;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author Norman Sander
	 */
	public class HONoiseFx extends Sprite {
		private static const DEFAULT_DIVISIONS : uint = 10;
		private var _asset : Sprite;
		private var _parts : Array = new Array();
		private var _range : uint;
		private var _fxWidth : Number;
		private var _fxHeight : Number;
		private var _startX : Number;

		public function HONoiseFx( asset : Sprite ) {
			_asset = asset;
			_asset.visible = false;
			_parts = new Array();
			_fxWidth = asset.width + 20;
			_fxHeight = asset.height;
			_startX = _asset.x;
			addChild( _asset );
			init();
		}

		private function init() : void {
			split();
		}

		private function split() : void {
			var assetBitmapData : BitmapData = new BitmapData( _fxWidth, _fxHeight, true, 0x000000 );
			assetBitmapData.draw( _asset );
			HOUtils.removeChildren( _asset );

			var divisionHeight : Number = Math.round( _fxHeight / DEFAULT_DIVISIONS );

			for (var i : int = 0; i < DEFAULT_DIVISIONS; i++) {
				var newBitmapData : BitmapData = new BitmapData( _fxWidth, divisionHeight, true, 0x000000 );
				newBitmapData.copyPixels( assetBitmapData, new Rectangle( 0, divisionHeight * i, _fxWidth, (i + 1) * divisionHeight ), new Point( 0, 0 ) );

				var newBitmap : Bitmap = new Bitmap( newBitmapData );

				var part : Sprite = new Sprite();
				part.addChild( newBitmap );
				_parts.push( part );
				part.y = divisionHeight * i;
				_asset.addChild( part );
			}
		}

		private function reset() : void {
			removeEventListener( Event.ENTER_FRAME, onEnterFrame );
			for each (var part : Sprite in _parts) {
				part.x = 0;
			}
		}

		private function start( range : uint ) : void {
			_range = range;
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}

		private function onEnterFrame( event : Event ) : void {
			for each (var part : Sprite in _parts) {
				part.x = positionInRange( _range );
			}
		}

		private function positionInRange( range : int ) : Number {
			var positionInRange : int = Math.round( Math.random() * range - range / 2 );
			return positionInRange;
		}

		public function show() : void {
			_asset.x = _startX;
			_asset.visible = true;
			start( 50 );
			TweenLite.delayedCall( .1, reset );
			TweenLite.delayedCall( .2, start, [ 30 ] );
			TweenLite.delayedCall( .3, reset );
		}

		public function addNoise() : void {
			start( 7 );
			TweenLite.delayedCall( .4, reset );
		}

		public function addShortNoise() : void {
			start( 15 );
			TweenLite.delayedCall( .1, reset );
		}

		public function addLongerNoise() : void {
			start( 40 );
			TweenLite.delayedCall( .1, reset );
			TweenLite.delayedCall( .3, start, [ 15 ] );
			TweenLite.delayedCall( .4, reset );
		}

		public function pushToRight() : void {
			TweenLite.to( _asset, .1, { x:_startX + 52 } );
		}

		public function hide() : void {
			start( 40 );
			TweenLite.delayedCall( .1, remove );
		}

		private function remove() : void {
			reset();
			_asset.visible = false;
		}
	}
}
