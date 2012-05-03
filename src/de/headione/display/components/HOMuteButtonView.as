package de.headione.display.components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Norman Sander
	 */
	public class HOMuteButtonView extends Sprite
	{
		public static const MUTE_BUTTON_CLICKED : String = "mutebutton_clicked";
		private var _muteBtn : HOMuteButtonAsset;
		private var _muted : Boolean = false;

		public function LRMuteButtonVC()
		{
			_muteBtn = new HOMuteButtonAsset();
			_muteBtn._area.visible = false;
			_muteBtn._mute.visible = true;
			hitArea = _muteBtn._area;
			buttonMode = true;
			addEventListener( MouseEvent.CLICK, onClick );
			addChild( _muteBtn );
		}

		private function onClick( event : MouseEvent ) : void
		{
			dispatchEvent( new Event( MUTE_BUTTON_CLICKED ) );
		}

		public function get muted() : Boolean
		{
			return _muted;
		}

		public function set muted( muted : Boolean ) : void
		{
			_muted = muted;
			_muteBtn._mute.visible = !_muted;
		}
	}
} 