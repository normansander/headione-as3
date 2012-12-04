package de.headione.fx.glowpoints {
	import flash.display.Sprite;
	/**
	 * @author t-normans
	 */
	public class HOGlowpoints extends Sprite {

		private static const MAX_GLOWS : Number = 3;
		private var _glowpoints : Array;

		public function HOGlowpoints() {
			_glowpoints = [];

			for (var i : int = 1; i <= MAX_GLOWS; i++) {
				var glow : HOGlowParticle = new HOGlowParticle();
				addChild( glow );
				_glowpoints.push( glow );
			}
		}

		public function start() : void {
			for each (var glow : HOGlowParticle in _glowpoints) {
				glow.start();
			}
		}

		public function stop() : void {
			for each (var glow : HOGlowParticle in _glowpoints) {
				glow.stop();
			}
		}
	}
}
