/**
 * @author Saad Shams :: sshams@live.com
 * Copy or reuse is prohibited.
 * */
package controller {
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediators.ApplicationMediator;
	import view.mediators.ChancesMediator;
	import view.mediators.CountDownMediator;
	import view.mediators.GameMediator;
	import view.mediators.StartMediator;
	import view.components.LoseFinalMediator;
	import view.components.PopupMediator;
	import view.components.WinFinalMediator;
	
	public class StartupCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			var app:DungeonSteps = notification.getBody() as DungeonSteps;

			facade.registerMediator(new ApplicationMediator(app));
			facade.registerMediator(new StartMediator(app.start));
			facade.registerMediator(new GameMediator(app.game));
			facade.registerMediator(new CountDownMediator(app.countDown));
			facade.registerMediator(new ChancesMediator(app.chances));
			
			facade.registerMediator(new PopupMediator(app.win));
			facade.registerMediator(new PopupMediator(app.lose));
			facade.registerMediator(new PopupMediator(app.timeup));
			
			facade.registerMediator(new WinFinalMediator(app.winFinal));
			facade.registerMediator(new LoseFinalMediator(app.loseFinal));
			
			//facade.registerMediator(new ResultMediator(app.result));
		}
		
	}
}