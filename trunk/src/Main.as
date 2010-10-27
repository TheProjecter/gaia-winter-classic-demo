﻿/*****************************************************************************************************
* Gaia Framework for Adobe Flash ©2007-2009
* Author: Steven Sacks
*
* blog: http://www.stevensacks.net/
* forum: http://www.gaiaflashframework.com/forum/
* wiki: http://www.gaiaflashframework.com/wiki/
* 
* By using the Gaia Framework, you agree to keep the above contact information in the source code.
* 
* Gaia Framework for Adobe Flash is released under the GPL License:
* http://www.opensource.org/licenses/gpl-2.0.php 
*****************************************************************************************************/

package
{
	import com.gaiaframework.core.GaiaMain;
	
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class Main extends GaiaMain
	{		
		public function Main()
		{
			super();
			siteXML = "xml/site.xml";
		}
		override protected function onAddedToStage(event:Event):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			alignSite(1000, 600);
			super.onAddedToStage(event);
		}
		override protected function onResize(event:Event):void
		{
			view.x = Math.round((stage.stageWidth - __WIDTH) / 2);
			view.y = Math.round((stage.stageHeight - __HEIGHT) / 2);
		}
	}
}
