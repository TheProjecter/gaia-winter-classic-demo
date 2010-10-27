package net.aliencom.gaiademo.pages
{
	import net.aliencom.gaiademo.utils.StringUtils;
	import flash.text.TextField;
	import flash.text.StyleSheet;
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;



	public class CreditsPage extends AbstractPage
	{
		public var ftdMc:Sprite;
		public var alienComMc:Sprite;
		public var msgMc:Sprite;

		public function CreditsPage()
		{
			super();

		}
		override public function transitionIn():void
		{
			super.transitionIn();

			//get style from the index node
			var ss : StyleSheet = (Gaia.api.getPage(Pages.LOADING).assets.winterCss as IStyleSheet).style;
			var creditsTf:TextField = msgMc['tf'] as TextField;
			creditsTf.styleSheet = ss;

			//html content from footer.xml
			creditsTf.htmlText = StringUtils.removeExtraWhitespace(copy.innerHTML);

			alienComMc.addEventListener(MouseEvent.CLICK, onAcClick);
			ftdMc.addEventListener(MouseEvent.CLICK, ftdClick);


			alienComMc.buttonMode = ftdMc.buttonMode = true;


			gotoAndPlay("in");
		}

		private function ftdClick(event : MouseEvent) : void {
			Gaia.api.href("http://www.meetup.com/flashthedistrict/","blank");
		}

		private function onAcClick(event : MouseEvent) : void {
			Gaia.api.href("http://aliencom.net","blank");
		}

		override public function transitionOut():void
		{
			super.transitionOut();
			gotoAndPlay("out");
		}
	}
}
