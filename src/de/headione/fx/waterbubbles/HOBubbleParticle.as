package de.headione.fx.waterbubbles {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author t-normans
	 */
	public class HOBubbleParticle extends Sprite {

		private const DISTANCE : Number = randRange( 50, 70 );
		private const SPEED : Number = randRange( 1, 2 );
		private const SCALE : Number = randRange( 1, 2 );
		private var _particle : Shape = new Shape();
		private var _container : Sprite;

		public function HOBubbleParticle() {
			_particle.graphics.beginFill( 0xffffff, .2 );
			_particle.graphics.drawCircle( 0, 0, 1.5 );

			_container = new Sprite();
			_container.scaleX = _container.scaleY = SCALE;
			_container.x = mouseX;
			_container.y = mouseY;
			addChild( _container );

			_container.addChild( _particle );

			resetParticle();
			start();
		}

		private function enterFrame( event : Event ) : void {
			_particle.y -= SPEED;
			_particle.x = + (Math.sin( _particle.y / 5 )) * 4;
			_particle.alpha = (DISTANCE / 2 - Math.abs( DISTANCE / 2 - Math.abs( _particle.y ) )) / (DISTANCE / 2);
		}

		public function resetOnFinish() : void {
			if (Math.abs( _particle.y ) > DISTANCE) {
				resetParticle();
			}
		}

		public function resetParticle() : void {
			_particle.y = 0;
			_container.x = mouseX;
			_container.y = mouseY;
		}

		private function randRange( minNum : Number, maxNum : Number ) : Number {
			return (Math.floor( Math.random() * (maxNum - minNum + 1) ) + minNum);
		}

		public function start() : void {
			addEventListener( Event.ENTER_FRAME, enterFrame );
		}

		public function stop() : void {
			removeEventListener( Event.ENTER_FRAME, enterFrame );
		}
	}
}
