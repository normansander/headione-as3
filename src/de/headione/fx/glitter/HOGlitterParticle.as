package de.headione.fx.glitter {
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.Sprite;
	/**
	 * @author headione
	 */
	public class HOGlitterParticle extends Sprite {

		private const DISTANCE : Number = randRange( 30, 50 );
		private const SPEED : Number = randRange( .5, 1 );
		private const SCALE : Number = randRange2( .2, .5 );
		private const ROTATION : Number = randRange( 0, 360 );
		private var _particle : Bitmap;
		private var _container : Sprite;
		private var _width : Number;
		private var _height : Number;

		public function HOGlitterParticle( width : Number, height : Number ) {
			_width = width;
			_height = height;

			_container = new Sprite();
			_container.scaleX = _container.scaleY = SCALE;
			addChild( _container );

			_particle = new Bitmap();
			_particle.rotation = ROTATION;

			_container.addChild( _particle );

			resetParticle();
			start();
		}

		private function enterFrame( event : Event ) : void {
			_particle.y += SPEED;
			_particle.alpha = (DISTANCE / 2 - Math.abs( DISTANCE / 2 - _particle.y )) / (DISTANCE / 2);

			if (_particle.y > DISTANCE) {
				resetParticle();
			}
		}

		private function resetParticle() : void {
			_particle.y = 0;
			x = randRange( 0, _width );
			y = randRange( 0, _height );
			rotation = randRange( 0, 360 );
		}

		private function randRange( minNum : Number, maxNum : Number ) : Number {
			return (Math.floor( Math.random() * (maxNum - minNum + 1) ) + minNum);
		}

		private function randRange2( minNum : Number, maxNum : Number ) : Number {
			return (Math.random() * (maxNum - minNum + 1)) + minNum;
		}

		public function start() : void {
			addEventListener( Event.ENTER_FRAME, enterFrame );
		}

		public function stop() : void {
			removeEventListener( Event.ENTER_FRAME, enterFrame );
		}
	}
}
