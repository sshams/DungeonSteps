/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Game;
	import view.events.CountDownEvent;
	import view.events.ResultEvent;
	
	public class GameMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "GameMediator";
		
		public function GameMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			game.addEventListener(ResultEvent.RESULT, resultHandler);
			game.addEventListener(CountDownEvent.START, countDown_startHandler);
		}
		
		override public function listNotificationInterests():Array {
			return [ApplicationFacade.GAME];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.GAME:
					game.start(ApplicationFacade.level);
					break;
			}
		}
		
		private function countDown_startHandler(event:CountDownEvent):void {
			sendNotification(ApplicationFacade.COUNTDOWN_START);
		}
		
		private function resultHandler(event:ResultEvent):void {
			if(event.outcome){
				ApplicationFacade.level++;
				sendNotification(ApplicationFacade.WIN);
			} else {
				ApplicationFacade.attempts++;
				sendNotification(ApplicationFacade.LOSE);
			}
		}
		
		public function get game():Game {
			return viewComponent as Game;
		}
		
	}
}