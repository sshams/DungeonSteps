/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.CountDown;
	import view.events.CountDownEvent;
	
	public class CountDownMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "CountDownMediator";
		
		public function CountDownMediator(viewComponent:Object) {
			super(NAME, viewComponent);
			countDown.addEventListener(CountDownEvent.COMPLETE, countDown_completeHandler);
		}
		
		override public function listNotificationInterests():Array {
			return [ 
					ApplicationFacade.GAME,
					ApplicationFacade.COUNTDOWN_START,
					ApplicationFacade.WIN,
					ApplicationFacade.LOSE
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				
				case ApplicationFacade.GAME:
					countDown.resetTimer();
					break;
				
				case ApplicationFacade.COUNTDOWN_START:
					countDown.startTimer();
					break;
				
				case ApplicationFacade.WIN:
				case ApplicationFacade.LOSE:
					countDown.stopTimer();
			}
		}
		
		private function countDown_completeHandler(event:CountDownEvent):void {
			ApplicationFacade.attempts++;
			sendNotification(ApplicationFacade.TIMEUP);
		}
		
		public function get countDown():CountDown {
			return viewComponent as CountDown;
		}
		
	}
}