/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class WinFinalMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "WinFinalMediator";
		
		public function WinFinalMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			winFinal.addEventListener(MouseEvent.MOUSE_DOWN, winFinal_mouseDownHandler);
		}
		
		private function winFinal_mouseDownHandler(event:MouseEvent):void {
			sendNotification(ApplicationFacade.END);
		}
		
		public function get winFinal():WinFinal {
			return viewComponent as WinFinal;
		}
	}
}