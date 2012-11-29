/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package view.components {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Chances extends MovieClip {
		
		private var times:int = 3;
		private var chances:TextField;
		
		public function Chances() {
			chances = this.getChildByName("_chances") as TextField;
		}
		
		public function lose():void {
			--times;
			chances.text = "" + times;
		}
		
		public function reset():void {
			times = 3;
			chances.text = "" + times;
		}
		
	}
	
}