/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.events {
	import flash.events.Event;
	
	public class CountDownEvent extends Event {
		
		public static const COMPLETE:String = "complete";
		public static const START:String = "start";
		public static const STOP:String = "stop";		
		
		public function CountDownEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}