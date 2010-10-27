package net.aliencom.gaiademo.pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;



	public class PensSinglePhotoPage extends AbstractPage
	{
		public var photoContainerMc:Sprite;

		public function PensSinglePhotoPage()
		{
			super();

		}
		override public function transitionIn():void
		{
			super.transitionIn();

			photoContainerMc.addChild(page.assets.photo.content);
			page.assets.photo.content.visible= true;

			gotoAndPlay("in");
		}
		override public function transitionOut():void
		{
			super.transitionOut();
			gotoAndPlay("out");
		}
	}
}
