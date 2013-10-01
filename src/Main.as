package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.*;
	import com.gestureworks.cml.element.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.cml.managers.*;
	import com.gestureworks.cml.utils.*;
	import com.gestureworks.events.GWTouchEvent;
	import flash.events.Event;
	import com.greensock.events.TweenEvent;
	import com.greensock.*;
	import com.greensock.easing.*;

	[SWF(width = "1920", height = "1080", backgroundColor = "0x444444", frameRate = "60")]

	public class Main extends GestureWorks
	{
		private var gridObject:TouchContainer;
		
		public function Main():void 
		{
			super();
			cml = "Grid.cml";
			gml = "my_gestures.gml";
			
			// add this event listener so we know when the CML parsing is complete
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");			
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			
			captureIDs();
		}
		
		private function captureIDs():void {
			gridObject = CMLObjectList.instance.getId("gridObject");
			gridObject.addEventListener(GWTouchEvent.TOUCH_BEGIN, onAlbumTouch);
			trace(gridObject);
		}
		
		private function onAlbumTouch(e:GWTouchEvent):void {
			TweenMax.to(gridObject, 0.5, {scaleX:2, scaleY:2, ease:Cubic.easeInOut});
			
		}

}
}
			
	
	
