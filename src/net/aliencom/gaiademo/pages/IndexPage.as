package net.aliencom.gaiademo.pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;



	public class IndexPage extends AbstractPage
	{
		public function IndexPage()
		{
			super();

		}
		override public function transitionIn():void
		{
			transitionInComplete();
		//	super.transitionIn();
		//	gotoAndPlay("in");
		}
		override public function transitionOut():void
		{
		//	super.transitionOut();
		//	gotoAndPlay("out");
		}
	}
}
