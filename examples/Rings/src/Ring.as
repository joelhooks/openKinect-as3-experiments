package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;

	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author silvio paganini | s2paganini.com
	 */
	public class Ring extends Sprite
	{
		private var rings : Vector.<Shape>;
		
		public function Ring(name : String, parent : Sprite, _x : int, _y : int, size : int)
		{
			x = _x;
			y = _y;

			this.name = name;
			
			parent.addChild(this);
			
			rings = new Vector.<Shape>();

			for (var i : int = 0; i < 50; i++)
			{
				var ring : Shape = new Shape();
				ring.alpha = 0;

				var color : uint = Math.random() * 0xFFFFFF;

				with(ring)
				{
					graphics.clear();
					graphics.lineStyle(1, color);
					graphics.beginFill(color, 0);
					graphics.drawCircle(0, 0, size * (i / 50));
					graphics.endFill();
				}

				addChild(ring);
				
				rings.push(ring);

				TweenMax.to(ring, .005, {alpha:1, delay:i / 100});
			}
		}

		public function destroy() : void
		{
			for(var i : uint = 0; i<rings.length; i++){
				TweenMax.to(rings[i], .005, {alpha:0, delay:i / 100});
				//if (parent) parent.removeChild(this);
			}
			
			TweenMax.delayedCall(rings.length * .5, parent.removeChild, [this]);
			
		}

		public function moveTo(_x : Number, _y: Number) : void
		{
			TweenMax.to(this, .6, {x : _x, y: _y, ease: Quad.easeOut});
		}
	}
}
