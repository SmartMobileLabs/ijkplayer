package tv.danmaku.ijk.media.player;

public final class IjkStreamTimeInfo {



	public long measurement_time_us;
	public long start_time_realtime_us;
	public long pts_us;
	public IjkStreamTimeInfo (long measurement_time_us, long start_time_realtime_us, long pts_us) {
		this.pts_us = pts_us;
		this.measurement_time_us = measurement_time_us;
		this.start_time_realtime_us = start_time_realtime_us;
	}

}
