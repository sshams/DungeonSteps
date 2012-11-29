/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package {
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.SoundChannel;
	
	import view.components.Background;
	import view.components.Chances;
	import view.components.CountDown;
	import view.components.Game;
	import view.components.Lose;
	import view.components.LoseFinal;
	import view.components.Result;
	import view.components.Start;
	import view.components.Timeup;
	import view.components.Win;
	import view.components.WinFinal;
	
	public class DungeonSteps extends MovieClip {
		
		public var background:Background;
		public var game:Game;
		public var start:Start;
		public var countDown:CountDown;
		public var chances:Chances;
		public var result:Result;
		
		public var win:Win;
		public var winFinal:WinFinal;
		public var lose:Lose;
		public var loseFinal:LoseFinal;
		public var timeup:Timeup;
		
		private var soundChannel:SoundChannel;
		
		private var hiddenObject:Sprite;
	
		public function DungeonSteps() {
			
		}
	
		public function startGame() {
			new GameInstructions().play();
			
			background = new Background();
			addChild(background);
			
			game = new Game();
			addChild(game);
			
			start = new Start();
			addChild(start);
			
			countDown = new CountDown();
			addChild(countDown);
			
			chances = new Chances();
			addChild(chances);
			
			//to remove
			result = new Result();
			addChild(result);
			
			//popups
			win = new Win();
			winFinal = new WinFinal();
			lose = new Lose();
			loseFinal = new LoseFinal();
			timeup = new Timeup();
			
			win.name = "win";
			winFinal.name = "winFinal";
			lose.name = "lose";
			loseFinal.name = "loseFinal";
			timeup.name = "timeup";
			
			soundChannel = new Atmosphere().play(0, int.MAX_VALUE);
			
			new ApplicationFacade().startup(this);
		}
		
		public function addWin():void {
			new WinSound().play();
			addChild(win);
		}
		
		public function addWinFinal():void {
			new WinSound().play();
			addChild(winFinal);
		}
		
		public function addLose():void {
			new LoseSound().play();
			addChild(lose);
		}
		
		public function addLoseFinal():void {
			new LoseSound().play();
			addChild(loseFinal);
		}
		
		public function addTimeup():void {
			new LoseSound().play();
			addChild(timeup);
		}
		
		public function removeTimeup():void {
			removeChild(timeup);
		}
		
		
		
	}
}