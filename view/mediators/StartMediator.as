/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.mediators {
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Start;
	
	public class StartMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "StartMediator";
		
		public function StartMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			start.buttonMode = true;
			start.addEventListener(MouseEvent.CLICK, start_clickHandler);
		}
		
		public function get start():Start {
			return viewComponent as Start;
		}
		
		private function start_clickHandler(event:MouseEvent):void {
			start.parent.removeChild(start);
			sendNotification(ApplicationFacade.GAME);
		}
	}
}