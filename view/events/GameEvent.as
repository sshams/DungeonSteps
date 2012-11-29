/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.events {
	import flash.events.Event;
	
	public class GameEvent extends Event {
		
		public static const NEXT:String = "next";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
	}
}