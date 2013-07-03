package;

import nme.Assets;
import nme.Lib;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.geom.Point;
import nme.geom.Rectangle;
import nme.events.Event;
import nme.events.TouchEvent;

class Player extends Entity
{
	private var left:Button;
	private var right:Button;
	private var jump:Button;
	
	public function new(pos:Point,img:Bitmap):Void
	{
		super(pos,img);
		
		var leftBut:Bitmap;
		var rightBut:Bitmap;
		var jumpBut:Bitmap;
		
		//Create left button bitmap
		leftBut=new Bitmap(Assets.getBitmapData("img/left.png"));
		leftBut.width*=5;
		leftBut.height*=5;
		
		//Create right button bitmap
		rightBut=new Bitmap(Assets.getBitmapData("img/right.png"));
		rightBut.width*=5;
		rightBut.height*=5;
		
		//Create jump button bitmap
		jumpBut=new Bitmap(Assets.getBitmapData("img/jump.png"));
		jumpBut.width*=5;
		jumpBut.height*=5;
		
		//Instantiate all of the buttons and add them to the current stage.
		left=new Button(leftBut,new Point(0,Lib.current.stage.stageHeight-leftBut.height));
		right=new Button(rightBut,new Point(Lib.current.stage.stageWidth-leftBut.width,Lib.current.stage.stageHeight-rightBut.height));
		jump=new Button(jumpBut,new Point(Lib.current.stage.stageWidth/2-jumpBut.width/2,Lib.current.stage.stageHeight-jumpBut.height));
		Lib.current.stage.addChild(left);
		Lib.current.stage.addChild(right);
		Lib.current.stage.addChild(jump);
	}
	
	public override function update():Void
	{
		super.update();
		
		if (checkLevel(new Point(0,1),App.level.getLevel())==null)
		{
			grav=.02;
		}
		else
		{
			grav=0;
			if (vspeed>0)
				vspeed=0;
		}
		
		if (right.isPressed())
		{
			hspeed=5;
		}
		else
		if (left.isPressed())
		{
			hspeed=-5;
		}
		else
		hspeed=0;
		
		if (jump.isPressed())
		{
			//if (checkLevel(new Point(0,1),App.level.getLevel())!=null)
			//{
				vspeed=-15;
			//}
		}
	}
}