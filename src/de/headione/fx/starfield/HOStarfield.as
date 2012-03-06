package de.headione.fx.starfield 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Zach Foley 
	 * Plastic Sturgeon.com
	 */
	public class HOStarfield extends Sprite
	{
		public function HOStarfield() 
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if (this.numChildren < 150) {
				var s:HOStar = new HOStar();
				s.x = Math.random() * 1000;
				s.y = Math.random() * 650;
				addChild(s);
			} else {
				removeEventListener(Event.ENTER_FRAME, update);
			}
		}
		
	}
}