package com.s2paganini.kinect
{
	import org.tuio.osc.OSCManager;
	import org.tuio.ITuioListener;
	import org.tuio.TuioBlob;
	import org.tuio.TuioClient;
	import org.tuio.TuioCursor;
	import org.tuio.TuioObject;
	import org.tuio.connectors.LCConnector;

	import flash.display.Sprite;

	/**
	 * @author silvio paganini | s2paganini.com
	 * @version 0.1
	 * @year 2010
	 */
	public class MultiTouchKinect extends Sprite implements ITuioListener
	{
		// -- CONSTS
		public static const TILT_MODE : int = 4;
		public static const SEND_DATA_SIZE : int = 6;
		
		// -- PROTECTED
		protected var client : TuioClient;
		protected var connectionNameIn : String = "_OscDataStream";
		protected var connectionNameOut : String = "_OscDataStreamOut";
		protected var lcConnector : LCConnector;
		protected var oscManager : OSCManager;
		
		public function MultiTouchKinect()
		{
			lcConnector = new LCConnector(connectionNameIn, connectionNameOut);
			
			client = new TuioClient(lcConnector);
			client.addListener(this);
			
			oscManager = new OSCManager(null, lcConnector);
			oscManager.start();
		}
		
		public function addTuioObject(tuioObject : TuioObject) : void
		{
		}

		public function updateTuioObject(tuioObject : TuioObject) : void
		{
		}

		public function removeTuioObject(tuioObject : TuioObject) : void
		{
		}

		public function addTuioCursor(tuioCursor : TuioCursor) : void
		{
		}

		public function updateTuioCursor(tuioCursor : TuioCursor) : void
		{
		}

		public function removeTuioCursor(tuioCursor : TuioCursor) : void
		{
		}

		public function addTuioBlob(tuioBlob : TuioBlob) : void
		{
		}

		public function updateTuioBlob(tuioBlob : TuioBlob) : void
		{
		}

		public function removeTuioBlob(tuioBlob : TuioBlob) : void
		{
		}

		public function newFrame(id : uint) : void
		{
		}
	}
}
