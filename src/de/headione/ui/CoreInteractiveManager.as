package de.headione.ui {
	import de.headione.events.ControllerEvent;
	import de.headione.interfaces.IManager;

	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Norman Sander
	 */
	[Event(name="button_clicked", type="de.headione.events.ControllerEvent")]
	public class CoreInteractiveManager extends CoreManager implements IManager {

		protected var _tooltipMessage : String;

		
		public function CoreInteractiveManager( displayObject : MovieClip ) {
			super( displayObject );
		}

		override protected function setup() : void {
			_do.buttonMode = true;
			_do.mouseChildren = false;
		}

		override protected function addListener() : void {
			_do.addEventListener( MouseEvent.CLICK, onClick );
			_do.addEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			_do.addEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
		}

		override protected function removeListener() : void {
			_do.removeEventListener( MouseEvent.CLICK, onClick );
			_do.removeEventListener( MouseEvent.MOUSE_OVER, onMouseOver );
			_do.removeEventListener( MouseEvent.MOUSE_OUT, onMouseOut );
		}

		/*
		 * HANDLER
		 */
		protected function onClick( event : MouseEvent ) : void {
			dispatchEvent( new ControllerEvent( ControllerEvent.BUTTON_CLICKED ) );
		}

		protected function onMouseOver( event : MouseEvent ) : void {
			_do.alpha = .5;
			TweenLite.killDelayedCallsTo(onTooltip);
			TweenLite.delayedCall(.5, onTooltip);
		}

		protected function onMouseOut( event : MouseEvent ) : void {
			_do.alpha = 1;
			TweenLite.killDelayedCallsTo(onTooltip);
			onTooltipHide();
		}
		
		protected function onTooltip() : void {
			dispatchEvent( new ControllerEvent( ControllerEvent.TOOLTIP_SHOW ) );
		}
		protected function onTooltipHide() : void {
			dispatchEvent( new ControllerEvent( ControllerEvent.TOOLTIP_HIDE ) );
		}

		public function get tooltipMessage() : String {
			return _tooltipMessage;
		}

		public function set tooltipMessage( tooltipMessage : String ) : void {
			_tooltipMessage = tooltipMessage;
		}
	}
}