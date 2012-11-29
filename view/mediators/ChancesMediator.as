/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Chances;
	
	public class ChancesMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "ChancesMediator";
		
		public function ChancesMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.LOSE, 
				ApplicationFacade.TIMEUP,
				ApplicationFacade.RESET
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.LOSE:
				case ApplicationFacade.TIMEUP:
					chances.lose();
					break;
				case ApplicationFacade.RESET:
					chances.reset();
					break;
			}
		}
		
		public function get chances():Chances {
			return viewComponent as Chances;
		}
		
	}
}