package de.headione.fx.laser {
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;

	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author t-normans
	 */
	public class HOLaser extends Sprite {
		private const DUR : Number = .5;
		private const EASE : Function = Quad.easeInOut;
		private const SCALE_MAX : Number = 1;
		private const SCALE_MIN : Number = .8;
		private var _laser : Bitmap;
		private var _container : Sprite;
		private var _sca : Number = SCALE_MAX;

		public function HOLaser() {
			_container = new Sprite();
			addChild( _container );

			_laser = new Bitmap();
			_laser.x = - _laser.width * .5;
			_laser.y = - _laser.height;

			_container.addChild( _laser );
		}

		private function go() : void {
			TweenLite.to( _container, DUR, { scaleX:_sca, scaleY:_sca, ease:EASE, onComplete:go } );
			_sca == SCALE_MAX ? _sca = SCALE_MIN : _sca = SCALE_MAX;
		}

		public function start() : void {
			go();
		}

		public function stop() : void {
			TweenLite.killTweensOf( _container );
		}
	}
}
