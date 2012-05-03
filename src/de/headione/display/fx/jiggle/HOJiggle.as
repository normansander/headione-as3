package de.headione.display.fx.jiggle
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class HOJiggle extends MovieClip
	{
		private static const SPEED_FACTOR : Number = 1;
		private static const SPEED_DEFAULT : Number = 1.3;
		private static const AMPLITUDE_DEFAULT : Number = 3;
		private static const AMPLITUDE_FACTOR : Number = .5;
		private static const ANGLE_SHIFT_DEFAULT : Number = 4;
		private static var _speed : Number;
		private static var _amplitude : Number;
		private static var _vars : Object;
		private var _speed : Number;

		public function HOJiggle()
		{
		}

		public static function start( mc_array : Array ) : void
		{
			_speed = SPEED_DEFAULT;
			_amplitude = AMPLITUDE_DEFAULT;
			_vars = {};
			_vars.reverse = false;
			_vars.angleShift = ANGLE_SHIFT_DEFAULT;

			for (var i = 0; i < mc_array.length; i++)
			{
				mc_array[i].angle = -i * _vars.angleShift;

				if (_vars.reverse)
				{
					mc_array[i].factor = (i % 2 == 0) ? 1 : -1;
				}
				else
				{
					mc_array[i].factor = 1;
				}

				mc_array[i].position = mc_array[i].x;

				mc_array[i].addEventListener( Event.ENTER_FRAME, frameHandler );
			}
		}

		public static function kill( mc_array : Array ) : void
		{
			for (var i = 0; i < mc_array.length; i++)
			{
				mc_array[i].removeEventListener( Event.ENTER_FRAME, frameHandler );
			}
		}

		public static function frameHandler( e : Event ) : void
		{
			e.target.angle++;
			e.target.x = e.target.position + Math.sin( e.target.angle * _speed * SPEED_FACTOR / 5 ) * _amplitude * AMPLITUDE_FACTOR * e.target.factor;
		}
	}
}