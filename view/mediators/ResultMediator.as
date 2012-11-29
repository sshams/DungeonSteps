/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Lose;
	import view.components.LoseFinal;
	import view.components.Result;
	import view.components.Win;
	import view.components.WinFinal;
	import view.components.Timeup;
	import view.events.GameEvent;
	import view.events.ResultEvent;

	public class ResultMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "ResultMediator";
		
		public function ResultMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			result.addEventListener(GameEvent.NEXT, result_gameEventHandler);
		}
		
		private function result_gameEventHandler(event:GameEvent):void {
			result.removeClip();
			if(ApplicationFacade.level < ApplicationFacade.TOTAL_LEVELS){
				sendNotification(ApplicationFacade.GAME);
			} else {
				sendNotification(ApplicationFacade.END);
			}
		}
		
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.TIMEUP,
				ApplicationFacade.WIN,
				ApplicationFacade.LOSE
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.WIN:
					if(ApplicationFacade.level < ApplicationFacade.TOTAL_LEVELS){
						result.addClip(new Win());
					} else {
						result.addClip(new WinFinal());
					}
					break;
				
				case ApplicationFacade.LOSE:
					if(ApplicationFacade.attempts < ApplicationFacade.TOTAL_ATTEMPTS){
						result.addClip(new Lose());
					} else {
						result.addClip(new LoseFinal());
					}
					break;
				
				case ApplicationFacade.TIMEUP:
					if(ApplicationFacade.attempts < ApplicationFacade.TOTAL_ATTEMPTS){
						result.addClip(new Timeup());
						trace(ApplicationFacade.attempts, ApplicationFacade.TOTAL_ATTEMPTS);
					} else {
						result.addClip(new LoseFinal());
					}
					break;
			}
		}
		
		
		public function get result():Result {
			return viewComponent as Result;
		}
		
	}
}