/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import view.events.CountDownEvent;

	public class CountDown extends MovieClip {
		
		private var time:TextField;
		private var timer:Timer;
		private var counter:int;
		
		private const COUNT_START:int = 15;
		
		public function CountDown() {
			counter = COUNT_START;
			time = this.getChildByName("_time") as TextField;
			time.text = getTime();
			
			timer = new Timer(1000, COUNT_START);
			timer.addEventListener(TimerEvent.TIMER, timer_timerHandler);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timer_completeHandler);
		}
		
		public function startTimer():void {
			timer.start();
		}
		
		public function stopTimer():void {
			timer.stop();
		}
		
		public function resetTimer():void {
			counter = COUNT_START;
			time.text = getTime();
			timer.reset();
		}
		
		private function timer_completeHandler(event:TimerEvent):void {
			dispatchEvent(new CountDownEvent(CountDownEvent.COMPLETE));
		}
		
		private function timer_timerHandler(event:TimerEvent):void {
			counter--;
			time.text = getTime();
		}
		
		private function getTime():String {
			return "00:" + ((counter) > 9 ? counter : "0" + counter)
		}
		
	}
}