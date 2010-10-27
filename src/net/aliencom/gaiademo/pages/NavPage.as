package net.aliencom.gaiademo.pages {
	import flash.events.MouseEvent;
	import net.aliencom.gaiademo.buttons.NavButton;

	import com.gaiaframework.api.*;
	import com.gaiaframework.assets.XMLAsset;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;

	import flash.display.*;
	import flash.text.StyleSheet;
	import flash.text.TextField;

	public class NavPage extends AbstractPage
	{

		public var capsHomeBtn : NavButton;
		public var capsPhotoBtn : NavButton;
		public var pensHomeBtn : NavButton;
		public var pensPhotoBtn : NavButton;
		public var homeBtn: NavButton;

		private var _selectNav:NavButton;

		public var footMc :Sprite;

		public function NavPage()
		{
			super();
		}


		//setup nav is called from the timeline, when the nav is ready to be displayed.
		public function setupNav():void{

			//get style from the index node
			var footerStyleSheet : StyleSheet = (Gaia.api.getPage(Pages.LOADING).assets.winterCss as IStyleSheet).style;
			var footerTf:TextField = footMc['tf'] as TextField;
			footerTf.styleSheet = footerStyleSheet;

			//html content from footer.xml
			footerTf.htmlText = (Gaia.api.getPage(Pages.LOADING).assets.footerContent as XMLAsset).xml;

			capsHomeBtn.section = Pages.UNLEASH_THE_FURY;
			capsPhotoBtn.section = Pages.CAPS_PHOTOS;
			pensHomeBtn.section = Pages.PENSBURG_CENTRAL;
			pensPhotoBtn.section = Pages.PENS_PHOTOS;
			homeBtn.section = Pages.HOME;

			capsHomeBtn.addEventListener(MouseEvent.CLICK, onNavBtnClick);
			capsPhotoBtn.addEventListener(MouseEvent.CLICK, onNavBtnClick);
			pensHomeBtn.addEventListener(MouseEvent.CLICK, onNavBtnClick);
			pensPhotoBtn.addEventListener(MouseEvent.CLICK, onNavBtnClick);
			homeBtn.addEventListener(MouseEvent.CLICK, onNavBtnClick);

			//we want to highlight the current branch when the nav comes in
			highlightNav(Gaia.api.getCurrentBranch());
		}

		private function onNavBtnClick(event : MouseEvent) : void {
			Gaia.api.goto((event.currentTarget as NavButton).section);
		}

		override public function onDeeplink(event:GaiaSWFAddressEvent):void
		{
			GaiaDebug.log("nav heard deeplink",event.branch);
			highlightNav(event.branch);
		}

		private function highlightNav(deeplink:String):void{

			var nextButton : NavButton;

			if(capsHomeBtn.section == deeplink){
				//this deeplink is the caps homepage
				nextButton = capsHomeBtn;
			}else if(pensHomeBtn.section == deeplink){
				//this deeplink is the pens homepage
				nextButton = pensHomeBtn;
			}else if(homeBtn.section == deeplink){
				//this deeplink is the homepage
				nextButton = homeBtn;

			}else if(deeplink.indexOf(pensPhotoBtn.section) > -1){

				//this comparision proves the current deeplink is
				//either the Pens Photo page or one of its subpages.
				nextButton = pensPhotoBtn;

			}else if(deeplink.indexOf(capsPhotoBtn.section) > -1){

				//same as the above
				nextButton = capsPhotoBtn;
			}

			if(nextButton == _selectNav){
				//these are the same nav button.
				//no change required
				return;
			}

			if(_selectNav != null){
				_selectNav.setUnselected();
			}

			if(nextButton != null){
				nextButton.setSelected();
			}

			_selectNav = nextButton;

		}

		override public function transitionIn():void
		{
			super.transitionIn();
			gotoAndPlay("in");
		}
		override public function transitionOut():void
		{
			super.transitionOut();
			gotoAndPlay("out");
		}
	}
}
