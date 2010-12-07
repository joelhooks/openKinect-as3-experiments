package
{
	import com.s2paganini.kinect.MultiTouchKinect;

	import org.tuio.TuioCursor;

	/**
	 * @author silvio paganini | s2paganini.com
	 */
	
	[SWF(backgroundColor="#000000", frameRate="31", width="640", height="480")];
	
	public class Main extends MultiTouchKinect
	{
		
		public function Main()
		{
			super();
		}

		override public function addTuioCursor(tuioCursor : TuioCursor) : void
		{
			new Ring(tuioCursor.sessionID.toString(), this, tuioCursor.x * stage.stageWidth, tuioCursor.y * stage.stageHeight, 30);
		}

		override public function updateTuioCursor(tuioCursor : TuioCursor) : void
		{
			try
			{
				var ring : Ring = getChildByName(tuioCursor.sessionID.toString()) as Ring;
				ring.moveTo(tuioCursor.x * stage.stageWidth, tuioCursor.y * stage.stageHeight);
			}
			catch(e : Error)
			{
			}
		}

		override public function removeTuioCursor(tuioCursor : TuioCursor) : void
		{
			try
			{
				var ring : Ring = getChildByName(tuioCursor.sessionID.toString()) as Ring;
				ring.destroy();
			}
			catch(e : Error)
			{
			}
		}
	}
}
