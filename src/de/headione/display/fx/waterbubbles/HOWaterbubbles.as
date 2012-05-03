package de.headione.display.fx.waterbubbles
{
	import flash.display.Sprite;

	/**
	 * @author t-normans
	 */
	public class HOWaterbubbles extends Sprite
	{
		private var _particles : Array;

		public function HOWaterbubbles( number : Number )
		{
			_particles = [];

			for (var i : int = 1; i <= number; i++)
			{
				var particle : HOBubbleParticle = new HOBubbleParticle();
				addChild( particle );
				_particles.push( particle );
			}
		}

		public function start() : void
		{
			for each (var particle : HOBubbleParticle in _particles)
			{
				particle.start();
			}
		}

		public function stop() : void
		{
			for each (var particle : HOBubbleParticle in _particles)
			{
				particle.stop();
			}
		}

		public function resetOnFinish() : void
		{
			for each (var particle : HOBubbleParticle in _particles)
			{
				particle.resetOnFinish();
			}
		}
	}
}