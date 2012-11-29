/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package {
	import controller.StartupCommand;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade {
		
		public static const STARTUP:String = "startup";
		public static const GAME:String = "game";
		public static const WIN:String = "win"; 
		public static const LOSE:String = "lose";
		public static const COUNTDOWN_START:String = "countDownStart";
		public static const END:String = "end";
		public static const TIMEUP:String = "timeup";
		public static const RESET:String = "reset";
		
		public static const TOTAL_ATTEMPTS:int = 3; //total attempts allowed per level, Total 3, (0, 1, 2)
		public static const TOTAL_LEVELS:int = 3; //if changed, change combinations in Game.as
		
		public static var level:int = 0;
		public static var attempts:int = 0;
		
		public static function getInstance():ApplicationFacade {
			if(instance == null){
				instance = new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		public function startup(app:DungeonSteps):void {
			sendNotification(STARTUP, app);
		}
		
		
	}
}