/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import view.events.GameEvent;
	
	public class Popup extends Sprite {
		
		public function Popup(){
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.buttonMode = true;
		}
		
		private function mouseDownHandler(event:MouseEvent):void {
			this.parent.removeChild(this);
		}
		
		private function addedToStageHandler(event:Event):void {
			TweenLite.from(this, .5, {y: String(10)});
		}
		
	}
}