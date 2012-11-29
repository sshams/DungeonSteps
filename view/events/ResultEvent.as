/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.events {
	import flash.events.Event;
	
	public class ResultEvent extends Event {
		
		public static const RESULT:String = "result";
		
		public var outcome:Boolean;
		
		public function ResultEvent(outcome:Boolean, type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			this.outcome = outcome;
		}
		
	}
}