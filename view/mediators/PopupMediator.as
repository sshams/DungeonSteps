/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.components.Popup;
	
	public class PopupMediator extends Mediator implements IMediator {
		
		public function PopupMediator(viewComponent:Object=null) {
			super(viewComponent.name + "Mediator", viewComponent);
			popup.addEventListener(MouseEvent.MOUSE_DOWN, popup_mouseDownHandler);	
		}
		
		private function popup_mouseDownHandler(event:MouseEvent):void {
			sendNotification(ApplicationFacade.GAME);
		}
		
		public function get popup():Popup {
			return viewComponent as Popup;
		}
		
	}
}