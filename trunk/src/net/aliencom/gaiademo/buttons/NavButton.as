package net.aliencom.gaiademo.buttons {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * NavButton
	 * @author - Kris
	 *
	 */
	public class NavButton extends MovieClip {
		public var		hitMc					: MovieClip;
		protected var _section			: String;
		protected var	_isSelected	: Boolean;

		public function NavButton() {
			super();
			this.hitArea = this.hitMc;
			this.mouseChildren = false;
			hitMc.mouseEnabled = false;
			this.initAsButton();
		}

		public function initAsButton():void{
			this.addEventListener(MouseEvent.ROLL_OVER, this.mouseEvents);
			this.addEventListener(MouseEvent.ROLL_OUT, this.mouseEvents);
			this.addEventListener(MouseEvent.CLICK, this.mouseEvents);
			this.buttonMode=true;
		}

		public function disableAsButton():void{
			this.removeEventListener(MouseEvent.ROLL_OVER, this.mouseEvents);
			this.removeEventListener(MouseEvent.ROLL_OUT, this.mouseEvents);
			this.removeEventListener(MouseEvent.CLICK, this.mouseEvents);
			this.buttonMode=false;
		}

		protected function mouseEvents(e:MouseEvent):void{
			if (e.type == MouseEvent.ROLL_OVER){
				this.gotoAndPlay('hover');
			}
			if (e.type == MouseEvent.ROLL_OUT){
				this.gotoAndPlay('off' );
			}
		}

		public function setSelected():void{
			if(!_isSelected){
				this.gotoAndPlay('selected');
				_isSelected = true;
				disableAsButton();
			}
		}

		public function setUnselected():void{
			if(_isSelected)	{
				this.gotoAndPlay('unselected');
				initAsButton();
				_isSelected=false;
			}
		}

		public function get section() : String {
			return _section;
		}

		public function set section(section : String) : void {
			_section = section;
		}
	}
}
