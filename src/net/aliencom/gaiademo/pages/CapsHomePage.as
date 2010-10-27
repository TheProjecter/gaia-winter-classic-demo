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



	public class CapsHomePage extends AbstractPage
	{

		public var homeMsgMc:Sprite;

		public function CapsHomePage()
		{
			super();


		}
		override public function transitionIn():void
		{
			super.transitionIn();

			//get style from the index node
			var ss : StyleSheet = (Gaia.api.getPage(Pages.LOADING).assets.winterCss as IStyleSheet).style;
			var homeTf:TextField = homeMsgMc['tf'] as TextField;
			homeTf.styleSheet = ss;

			//html content from footer.xml
			homeTf.htmlText = StringUtils.removeExtraWhitespace(copy.innerHTML);

			gotoAndPlay("in");
		}
		override public function transitionOut():void
		{
			super.transitionOut();
			gotoAndPlay("out");
		}

	}
}
