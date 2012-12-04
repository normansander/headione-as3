package de.headione.events {
	import flash.events.MouseEvent;
	public class ControllerEvent extends MouseEvent {

		public static const BUTTON_CLICKED : String = "button_clicked";
		public static const TOOLTIP_SHOW : String = "tooltip_show";
		public static const TOOLTIP_HIDE : String = "tooltip_hide";
				
		public function ControllerEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}		
	}
}
