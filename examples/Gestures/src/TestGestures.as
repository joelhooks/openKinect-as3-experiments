package
{
	import com.s2paganini.kinect.MultiTouchKinect;

	import org.tuio.debug.TuioDebug;
	import org.tuio.gestures.DragGesture;
	import org.tuio.gestures.GestureManager;

	/**
	 * @author silvio paganini | s2paganini.com
	 */
	public class TestGestures extends MultiTouchKinect
	{
		private var tDbg : TuioDebug;
		public function TestGestures()
		{
			super();
			
			initGestures();
		}

		private function initGestures() : void
		{
			var tm:GestureManager = GestureManager.init(stage, client);
			tm.touchTargetDiscoveryMode = GestureManager.TOUCH_TARGET_DISCOVERY_MOUSE_ENABLED;
			
			GestureManager.addGesture(new DragGesture());
			
			tDbg = TuioDebug.init(stage);
			client.addListener(tDbg);
			
			var item:DragRotateScaleMe;
			for (var c:int = 0; c < 10; c++ ) {
				item = new DragRotateScaleMe(100 + Math.random() * (stage.stageWidth - 200), 100 + Math.random() * (stage.stageHeight - 200), stage.stageWidth / 2, stage.stageHeight / 2);
				stage.addChild(item);
			}
		}
	}
}
