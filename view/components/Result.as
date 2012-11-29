/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import view.events.GameEvent;
	import view.events.ResultEvent;
	
	public class Result extends MovieClip {
		
		private var clip:Sprite;
		
		public function Result() {
			super();
		}
		
		public function addClip(clip:Sprite):void {
			this.clip = clip;
			this.addChild(clip);
			clip.buttonMode = true;
			clip.addEventListener(MouseEvent.MOUSE_DOWN, clip_mouseDownHandler);
			TweenLite.from(clip, .5, {y: String(10)});	
		}
		
		private function clip_mouseDownHandler(event:MouseEvent):void {
			dispatchEvent(new GameEvent(GameEvent.NEXT));
		}
		
		public function removeClip():void {
			this.removeChild(clip);
			clip.removeEventListener(MouseEvent.MOUSE_DOWN, clip_mouseDownHandler);
		}
	}
}