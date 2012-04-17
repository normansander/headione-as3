package de.headione.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	/**
	 * @author Norman Sander
	 */
	public class HOWavLoader extends EventDispatcher {
		private var _currUrl : String;
		private var _wav : URLLoader;
		private var _currIndex : uint = 0;
		private var _soundList : Vector.<WavSound>;
		private var _urlList : Array;

		public function HOWavLoader( urlList : Array ) {
			_urlList = urlList;
			_soundList = new Vector.<WavSound>();
			loadWav( _urlList[_currIndex] );
		}

		private final function loadWav( url : String ) : void {
			_currUrl = url;

			var urlRequest : URLRequest = new URLRequest( url );
			_wav = new URLLoader();
			_wav.dataFormat = 'binary';
			_wav.load( urlRequest );
			_wav.addEventListener( Event.COMPLETE, storeWav );
		}

		private function storeWav( e : Event ) : void {
			_soundList.push( new WavSound( e.target.data as ByteArray ) );
			_currIndex++;
			if (_currIndex < _urlList.length){
				loadWav( _urlList[_currIndex] );
			}else{
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}

		public function get soundList() : Vector.<WavSound> {
			return _soundList;
		}
	}
}