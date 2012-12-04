package de.headione.ui.dropdown {
	import de.headione.interfaces.IManager;
	import de.headione.ui.CoreInteractiveManager;

	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	/**
	 * @author Norman Sander, 2012
	 */
	public class DropdownManager extends CoreInteractiveManager implements IManager {

		public static const CHOOSEN : String = "choosen";
		private static const MENU_WIDTH : Number = 250;
		private static const MENU_RADIUS : Number = 5;
		private static const HIGLIGHT_COLOR : int = ColorConstants.BLUE_INT;
		private static const ENTRY_HEIGHT : Number = 20;
		private var _entryList : Array = new Array();
		private var _menu : Sprite;
		private var _stringList : Array;
		private var _selectedId : uint = 0;
		private var _selectedValue : String;
		private var _button : Sprite;
		private var _error : Boolean;

		public function DropdownManager( displayObject : MovieClip, stringList : Array ) {
			_stringList = stringList;
			super( displayObject );
		}

		override protected function init() : void {
			super.init();
		}

		override protected function setup() : void {
			// super.setup();
			_d._border.visible = false;
			createButton();
			createMenu();
			_d._tf.text = _stringList[0];
		}

		private function createButton() : void {
			_button = new Sprite();
			_button.graphics.beginFill( 0x000000, 0 );
			_button.graphics.drawRect( 0, 0, _d._bg.width, _d._bg.height );
			_button.graphics.endFill();
			_button.x = _d.x;
			_button.y = _d.y;
			_button.buttonMode = true;
			_d.parent.addChild( _button );
		}

		private function createMenu() : void {
			var elementNum : int = _stringList.length;

			_menu = new Sprite();

			var bg : Shape = Shape( _menu.addChild( new Shape() ) );
			bg.graphics.beginFill( 0xFFFFFF );
			bg.graphics.drawRoundRectComplex( 0, 0, MENU_WIDTH, elementNum * 20 + 13, MENU_RADIUS, MENU_RADIUS, MENU_RADIUS, MENU_RADIUS );
			bg.graphics.endFill();

			var dropShadow : DropShadowFilter = new DropShadowFilter();
			dropShadow.distance = 0;
			dropShadow.angle = 45;
			dropShadow.color = 0x333333;
			dropShadow.alpha = 1;
			dropShadow.blurX = 10;
			dropShadow.blurY = 10;
			dropShadow.strength = 1;
			dropShadow.quality = 15;
			dropShadow.inner = false;
			dropShadow.knockout = false;
			dropShadow.hideObject = false;

			bg.filters = new Array( dropShadow );

			_menu.addChild( bg );

			for (var i : int = 0; i < elementNum; i++) {
				var entryContainer : MovieClip = new MovieClip();
				var entryBG : Shape = new Shape();
				entryBG.graphics.beginFill( HIGLIGHT_COLOR, .6 );
				entryBG.graphics.drawRect( 0, 0, MENU_WIDTH, ENTRY_HEIGHT );
				entryBG.graphics.endFill();
				entryBG.visible = false;
				entryContainer.addChild( entryBG );
				var entryTF : EntryView = new EntryView();
				entryTF._tf.width = MENU_WIDTH - 20;
				entryTF._tf.height = ENTRY_HEIGHT;
				entryTF._tf.text = _stringList[i];
				entryTF.x = 10;
				entryContainer.y = i * ENTRY_HEIGHT + 5;
				entryContainer.addChild( entryTF );
				_menu.addChild( entryContainer );
				entryContainer.id = i;
				entryContainer.bg = entryBG;
				_entryList.push( entryContainer );
			}

			_menu.x = _d._tf.x - 10;
			// _menu.y = _d._tf.y - 5;
			_menu.y = _d._tf.y - _menu.height;
			_menu.visible = false;
			_d._tf.parent.addChild( _menu );
		}

		override protected function addListener() : void {
			_button.addEventListener( MouseEvent.CLICK, onClick );
			for each (var entry : MovieClip in _entryList) {
				entry.buttonMode = true;
				entry.mouseChildren = false;
				entry.addEventListener( MouseEvent.CLICK, onClickEntry );
				entry.addEventListener( MouseEvent.ROLL_OVER, onRolloverEntry );
				entry.addEventListener( MouseEvent.ROLL_OUT, onRolloutEntry );
			}
		}

		private function onRolloutEntry( event : MouseEvent ) : void {
			event.target.bg.visible = false;
		}

		private function onRolloverEntry( event : MouseEvent ) : void {
			event.target.bg.visible = true;
		}

		private function onClickEntry( event : MouseEvent ) : void {
			_selectedId = event.target.id;
			// _menu.y = _d._tf.y - ENTRY_HEIGHT * _selectedId - 5;
			_menu.visible = false;
			_d._tf.text = _stringList[_selectedId];
			dispatchEvent( new Event( CHOOSEN ) );
		}

		override protected function onClick( event : MouseEvent ) : void {
			_menu.visible = !_menu.visible;
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
		}

		public function get selectedId() : uint {
			return _selectedId;
		}

		override public function set width( value : Number ) : void {
			_do._border.width = value;
			_do._bg.width = value - 2;
			_do._tf.width = value - 5;
			_do._btn.x = value - _do._btn.width;
			_button.width = value
		}

		public function get selectedValue() : String {
			return _stringList[_selectedId];
		}

		public function set error( value : Boolean ) : void {
			_d._border.visible = value;
			_error = value;
		}

		public function get error() : Boolean {
			return _error;
		}

		private function get _d() : DropdownView {
			return _do as DropdownView;
		}
	}
}
