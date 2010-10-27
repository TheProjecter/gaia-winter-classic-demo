package net.aliencom.gaiademo.pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;


	
	public class HomePage extends AbstractPage
	{	
		public function HomePage()
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
