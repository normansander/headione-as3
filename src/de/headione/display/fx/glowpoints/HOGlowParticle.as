package de.headione.display.fx.glowpoints
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author t-normans
	 */
	public class HOGlowParticle extends Sprite
	{
		private const SPEED : Number = randRange( 2, 4 );
		private const START_AT : Number = -70;
		private const SCALE : Number = randRangeScale( .2, .7 );
		private const ROTATION : Number = randRange( 0, 360 );
		private const MIN_DISTANCE : Number = 140;
		private const MAX_DISTANCE : Number = 300;
		private const MIN_ANGLE : Number = -50;
		private const MAX_ANGLE : Number = 50;
		private var _glowBitmap : Bitmap;
		private var _glowPoint : Sprite;
		private var _container : Sprite;
		private var _distance : Number;
		private var _speed : Number;

		public function HOGlowParticle()
		{
			_container = new Sprite();
			addChild( _container );

			_glowPoint = new Sprite();
			_container.addChild( _glowPoint );

			_glowBitmap = new Bitmap();
			_glowBitmap.x = - _glowBitmap.width / 2;
			_glowBitmap.y = - _glowBitmap.height / 2;
			_glowPoint.addChild( _glowBitmap );

			_glowPoint.scaleX = _glowPoint.scaleY = SCALE;
			_glowPoint.rotation = ROTATION;

			_container.addChild( _glowPoint );

			resetParticle();
			start();
		}

		private function resetParticle() : void
		{
			_glowPoint.y = START_AT;
			_container.rotation = randRange( MIN_ANGLE, MAX_ANGLE );
			_distance = randRange( MIN_DISTANCE, MAX_DISTANCE );
			_speed = SPEED;
		}

		private function enterFrame( event : Event ) : void
		{
			_glowPoint.y -= _speed;
			_glowPoint.alpha = (_distance / 2 - Math.abs( _distance / 2 + _glowPoint.y )) / (_distance / 2);

			if (_glowPoint.y < - _distance)
			{
				resetParticle();
			}
		}

		public function start() : void
		{
			addEventListener( Event.ENTER_FRAME, enterFrame );
		}

		public function stop() : void
		{
			removeEventListener( Event.ENTER_FRAME, enterFrame );
		}

		private function randRange( minNum : Number, maxNum : Number ) : Number
		{
			return (Math.floor( Math.random() * (maxNum - minNum + 1) ) + minNum);
		}

		private function randRangeScale( minNum : Number, maxNum : Number ) : Number
		{
			return (Math.random() * (maxNum - minNum + 1)) + minNum;
		}
	}
}
