package net.aliencom.gaiademo.pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;


	
	public class SiteContainerPage extends AbstractPage
	{	
		public function SiteContainerPage()
		{
			super();
			 
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
