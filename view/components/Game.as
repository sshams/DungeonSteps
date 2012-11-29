/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import view.events.CountDownEvent;
	import view.events.ResultEvent;
	
	public class Game extends MovieClip {
		
		public static const WIN:String = "win";
		public static const LOSE:String = "lose";
		
		private var totalSteps:int = 9;
		private var steps:Array = [];
		private var clickedSteps:Array;
		private var randomSteps:Array;
		private var combinations:Array = [3, 4, 5];
		private var currentStep:Sprite; //to keep track of clicked steps as eventListener is on stage
		
		private const TWEEN_DURATION:Number = .3;
		private const DELAY:Number = .2;
		
		/*
		* Constructor function to insert all steps elements in steps array and to hide them
		*/
		public function Game() {
			for(var i:int=0; i<totalSteps; i++){
				steps.push(this.getChildByName("step_" + i));
				MovieClip(steps[i]).alpha = 0;
			}
		}
		
		/*
		* start the game at a specified level
		*/
		public function start(level:int=0):void {
			reset();
			if(level < combinations.length){
				randomSteps = getRandoms2(combinations[level]);
			} else { //game will revert to default combination
				randomSteps = getRandoms2(combinations[0]);
			}
			hide(); //hide if steps are visible, probably from the last level
			showSteps(); //show all steps in a sequence
		}
		
		/*
		* reset all variables to prepare the game for the next level
		*/
		private function reset():void {
			clickedSteps = [];
			randomSteps = [];
		}
		
		/*
		* to hide all, helpful in restart
		*/
		private function hide():void {
			for(var i:int=0; i<steps.length; i++){
				MovieClip(steps[i]).alpha = 0;
			}
		}
		
		/*
		* Show all the steps in sequence as per elements in randomSteps
		* and finally hide them after some delay
		*/
		private function showSteps():void {
			var timeline:TimelineLite = new TimelineLite({onComplete: enableSteps, onCompleteParams: [true]});
			
			for(var i:int=0; i<randomSteps.length; i++){
				timeline.append(new TweenLite(steps[randomSteps[i]], TWEEN_DURATION, {alpha: 1, onStart:playSound})); //to show
				timeline.append(new TweenLite(steps[randomSteps[i]], TWEEN_DURATION, {alpha: 0, delay: DELAY})); //to hide
			}
		}
		
		private function playSound():void {
			new Appear().play();
		}
		
		/*
		* To enable/disable interactivity for steps against mouseClick event
		*/
		private function enableSteps(enable:Boolean):void {

			for(var i:int=0; i<steps.length; i++){
				if(enable){
					MovieClip(steps[i]).addEventListener(MouseEvent.MOUSE_DOWN, step_mouseDownHandler);
					MovieClip(steps[i]).buttonMode = true;
				} else {
					MovieClip(steps[i]).removeEventListener(MouseEvent.MOUSE_DOWN, step_mouseDownHandler);
					MovieClip(steps[i]).buttonMode = false;
				}
			}
			
			if(enable){ //once steps are enabled to receive answer, start the countdown timer
				dispatchEvent(new CountDownEvent(CountDownEvent.START));	
			}		
		}
		
		/*
		* show lit element
		* store index for each step clicked and get result at the end
		*/
		private function step_mouseDownHandler(event:MouseEvent):void {
			currentStep = Sprite(event.currentTarget);
			Sprite(event.currentTarget).alpha = 1;
			
			var index:int = parseInt(String(event.target.name).substr(event.target.name.indexOf("_") + 1));
			clickedSteps.push(index);
			
			new TweenLite(event.currentTarget, TWEEN_DURATION, {alpha: 0, delay: DELAY});
			
			if(clickedSteps.length == randomSteps.length){
				enableSteps(false);
				dispatchEvent(new ResultEvent(getResult(), ResultEvent.RESULT));
			}
		}
		
		/*
		* Evaluate result by comparing randomSteps with clickedSteps
		*/
		private function getResult():Boolean {
			for(var i:int=0; i<randomSteps.length; i++){
				if(clickedSteps[i] != randomSteps[i]){
					return false;
				}
			}
			return true;
		}
		
		/*
		* Get unique random numbers array of size length, 
		* returns an array with range 0 - totalSteps-1
		*/
		private function getRandoms(length:int):Array {
			
			if(length > totalSteps){
				return null;
			}
			
			var temp:Array = [];
		
			while(temp.length != length){
				var random:int = Math.round(Math.random() * (totalSteps-1));
				
				var unique:Boolean = true;
				for(var i:int=0; i<temp.length; i++){
					if(temp[i] == random){
						unique = false;
						break;
					}
				}
				if(unique){
					temp.push(random);
				}
			}
			return temp;
		}
		
		/*
		* Get random numbers array of size length, and number can repeat itself one time only 
		* returns an array with range 0 - totalSteps-1 but
		*/
		private function getRandoms2(length:int):Array {
			
			var repetitionTime:int = 2;
			
			if(length > totalSteps){
				return null;
			}
			
			var temp:Array = [];
			
			while(temp.length != length){
				var random:int = Math.round(Math.random() * (totalSteps-1));
				
				var unique:Boolean = true;
				var count:int = 0;
				
				for(var i:int=0; i<temp.length; i++){
					if(temp[i] == random && ++count == repetitionTime){
						unique = false;
						break;
					}
				}
				if(unique){
					//count = 0;
					temp.push(random);
				}
			}
			return temp;
			
		}
		
	}
}