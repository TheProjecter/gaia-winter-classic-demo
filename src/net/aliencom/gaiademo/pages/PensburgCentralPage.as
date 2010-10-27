package net.aliencom.gaiademo.pages {
	import net.aliencom.gaiademo.utils.StringUtils;

	import com.gaiaframework.api.*;
	import com.gaiaframework.templates.AbstractPage;

	import flash.display.*;
	import flash.text.StyleSheet;
	import flash.text.TextField;

	public class PensburgCentralPage extends AbstractPage
	{

		public var homeMsgMc:Sprite;

		public function PensburgCentralPage()
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
