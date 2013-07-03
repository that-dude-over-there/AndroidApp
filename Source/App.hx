package;

import nme.display.Sprite;
import nme.display.Bitmap;
import nme.events.TouchEvent;
import nme.events.Event;
import nme.geom.Point;
import nme.Assets;
import nme.Lib;

class App extends Sprite
{
	private var player:Player;
	public static var level:Level;
	
	public function new():Void
	{
		super();
		
		level=new Level();
		level.add(new Wall(new Point(200,250),new Bitmap(Assets.getBitmapData("img/wall.png")),true));
		level.add(new Wall(new Point(232,250),new Bitmap(Assets.getBitmapData("img/wall.png")),true));
		level.add(new Wall(new Point(264,250),new Bitmap(Assets.getBitmapData("img/wall.png")),true));
		level.add(new Wall(new Point(296,218),new Bitmap(Assets.getBitmapData("img/wall.png")),true));
		level.loadEnts();
		
		//Fill the background with cornflower blue.
		Lib.current.graphics.beginFill(0x659CEF,1);
		Lib.current.graphics.drawRect(0,0,Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
		Lib.current.graphics.endFill();
		
		var bitmap:Bitmap=new Bitmap(Assets.getBitmapData("img/face.png"));
		bitmap.width*=2;
		bitmap.height*=2;
		player=new Player(new Point(200,200),bitmap);
		Lib.current.stage.addChild(player);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME,update);
	}
	
	public function update(e:Event):Void
	{
		player.update();
	}
	
	static function main():Void
	{
		var game:App=new App();
	}
}