package de.headione.display.fx.starfield
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * ...
	 * @author Zach
	 */
	public class HOStar extends Sprite
	{
		private var d : Number;
		private var r : Number;
		private var stageCenter : Point;
		private var speed : Number;
		private var acceleration : Number = 1.025;

		public function HOStar()
		{
			this.alpha = 0;
			init();
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}

		private function onAddedToStage( e : Event ) : void
		{
			removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			addEventListener( Event.ENTER_FRAME, update );
			stageCenter = new Point( stage.stageWidth / 2, stage.stageHeight / 2 );
		}

		private function update( e : Event ) : void
		{
			d *= acceleration + (speed * 0.25);
			alpha = d / 500;
			x = stageCenter.x + Math.cos( r ) * d / 2;
			y = stageCenter.y + Math.sin( r ) * d / 2;
			if (x > stageCenter.x * 2 || x < 0 || y > stageCenter.y * 2 || y < 0)
			{
				init();
			}
		}

		private function init() : void
		{
			r = Math.random() * 6;
			d = Math.random() * 150;
			speed = Math.random() * 0.0510;
			this.graphics.clear();
			this.graphics.beginFill( 0xFFFFFF );
			this.graphics.drawCircle( 0, 0, speed * 20 );
		}
	}
}