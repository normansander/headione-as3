package de.headione.display.components
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Norman Sander
	 */
	public class HOPointsCounterView extends Sprite
	{
		private var _asset : HOPointsCounterAsset;
		private var _timer : Timer;
		private var _endPoints : uint;
		private var _currentPoints : int;

		public function HOPointsCounterView()
		{
			_asset = new HOPointCounterAsset();
			_asset.y = _asset.height + 40;
			_currentPoints = 0;
			addChild( _asset );
			setText();
			setTimer();
		}

		private function setTimer() : void
		{
			_timer = new Timer( 5 );
			_timer.addEventListener( TimerEvent.TIMER, onTimer );
		}

		private function setText() : void
		{
			var text : String = String( _currentPoints );
			if (text.length == 1) text = "00" + text;
			if (text.length == 2) text = "0" + text;
			HOUtils.setHtmlText( _asset._text, text, false, true );
		}

		public function show() : void
		{
			TweenLite.to( _asset, .5, { y:0, overwrite:true } );
		}

		public function hide() : void
		{
			TweenLite.to( _asset, .2, { y:_asset.height, delay:1, overwrite:true } );
		}

		public function countUpTo( points : uint ) : void
		{
			_endPoints = points;
			_timer.start();
		}

		private function onTimer( event : TimerEvent ) : void
		{
			if (_currentPoints < _endPoints)
			{
				_currentPoints++;
				setText();
			}
			else
			{
				_timer.stop();
			}
		}
	}
}
