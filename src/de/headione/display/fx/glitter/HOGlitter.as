package de.headione.display.fx.glitter {
	import flash.display.Sprite;
	
	/**
	 * @author headione
	 */
	 
	public class HOGlitter extends Sprite {
		
		private var _particles : Array;

		public function HOGlitter(width : Number, height : Number, number : Number) {
			
			_particles = [];
			
			for (var i : int = 1; i <= number; i++) 
			{
				var particle : HOGlitterParticle = new HOGlitterParticle(width, height);
				addChild(particle);
				_particles.push(particle);
			}
		}
		
		public function start() : void{
			for each (var particle : HOGlitterParticle in _particles){
				particle.start();
			}
		}
		
		public function stop() : void{
			for each (var particle : HOGlitterParticle in _particles){
				particle.stop();
			}
		}		
	}
}