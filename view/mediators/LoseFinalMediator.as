/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class LoseFinalMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "LoseFinalMediator";
		
		public function LoseFinalMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			loseFinal.addEventListener(MouseEvent.MOUSE_DOWN, loseFinal_mouseDownHandler);
		}
		
		private function loseFinal_mouseDownHandler(event:MouseEvent):void {
			ApplicationFacade.attempts = 0;
			ApplicationFacade.level = 0;
			sendNotification(ApplicationFacade.RESET); //for chances
			sendNotification(ApplicationFacade.GAME);
		}
		
		public function get loseFinal():LoseFinal {
			return viewComponent as LoseFinal;
		}
	}
}