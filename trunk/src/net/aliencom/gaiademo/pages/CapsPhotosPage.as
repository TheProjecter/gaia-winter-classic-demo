package net.aliencom.gaiademo.pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;



	public class CapsPhotosPage extends AbstractPage
	{
			public var photo1:Sprite;
			public var photo2:Sprite;
			public var photo3:Sprite;
			public var photo4:Sprite;
			public var photo5:Sprite;
			public var photo6:Sprite;

		public function CapsPhotosPage()
		{
			super();

		}
		override public function transitionIn():void
		{
			super.transitionIn();

			var t1:Bitmap = IBitmap(assets.thumb1).content;
			var t2:Bitmap = IBitmap(assets.thumb2).content;
			var t3:Bitmap = IBitmap(assets.thumb3).content;
			var t4:Bitmap = IBitmap(assets.thumb4).content;
			var t5:Bitmap = IBitmap(assets.thumb5).content;
			var t6:Bitmap = IBitmap(assets.thumb6).content;

			//now we're going to grab all the photos and
			photo1.addChild(t1);
			photo2.addChild(t2);
			photo3.addChild(t3);
			photo4.addChild(t4);
			photo5.addChild(t5);
			photo6.addChild(t6);

			photo1.addEventListener(MouseEvent.CLICK, onThumbClick);
			photo2.addEventListener(MouseEvent.CLICK, onThumbClick);
			photo3.addEventListener(MouseEvent.CLICK, onThumbClick);
			photo4.addEventListener(MouseEvent.CLICK, onThumbClick);
			photo5.addEventListener(MouseEvent.CLICK, onThumbClick);
			photo6.addEventListener(MouseEvent.CLICK, onThumbClick);

			photo1.buttonMode = true;
			photo2.buttonMode = true;
			photo3.buttonMode = true;
			photo4.buttonMode = true;
			photo5.buttonMode = true;
			photo6.buttonMode = true;

			//images always come invisible
			t1.visible = true;
			t2.visible = true;
			t3.visible = true;
			t4.visible = true;
			t5.visible = true;
			t6.visible = true;

			//not sure if smoothing is default in gaia
			t1.smoothing= true;
			t2.smoothing= true;
			t3.smoothing= true;
			t4.smoothing= true;
			t5.smoothing= true;
			t6.smoothing= true;

			gotoAndPlay("in");
		}

		private function onThumbClick(event : MouseEvent) : void {
			var thumbName:String = DisplayObject(event.currentTarget).name;

			//now create the gaia deeplink for that page
			var deeplink:String = Pages.CAPS_PHOTOS + "/" + thumbName;

			GaiaDebug.log(thumbName, deeplink);

			//apply deeplink
			Gaia.api.goto(deeplink);

		}

		override public function transitionOut():void
		{
			super.transitionOut();
			gotoAndPlay("out");
		}
	}
}
