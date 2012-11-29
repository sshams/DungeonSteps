/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ApplicationMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "ApplicationMediator";
		
		public function ApplicationMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
		}
		
		public function get app():DungeonSteps {
			return viewComponent as DungeonSteps;
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.WIN,
				ApplicationFacade.LOSE,
				ApplicationFacade.TIMEUP,
				ApplicationFacade.END
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.WIN:
					if(ApplicationFacade.level < ApplicationFacade.TOTAL_LEVELS){
						viewComponent.addWin();
					} else {
						viewComponent.addWinFinal();
					}
					break;
				
				case ApplicationFacade.LOSE:
					if(ApplicationFacade.attempts < ApplicationFacade.TOTAL_ATTEMPTS){
						viewComponent.addLose();
					} else {
						viewComponent.addLoseFinal();
					}
					break;
				
				case ApplicationFacade.TIMEUP:
					if(ApplicationFacade.attempts < ApplicationFacade.TOTAL_ATTEMPTS){
						viewComponent.addTimeup();
					} else {
						viewComponent.addLoseFinal();
					}
					break;
				
				case ApplicationFacade.END:
					viewComponent.transitionOut();
					break;
			}
		}
	}
}