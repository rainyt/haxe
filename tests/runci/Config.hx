package runci;

import sys.FileSystem;

enum Ci {
	TravisCI;
	AppVeyor;
	AzurePipelines;
}

class Config {
	static public final systemName = Sys.systemName();
	static public final cwd = Sys.getCwd();
	static public final repoDir = FileSystem.fullPath("..") + "/";
	static public final unitDir = cwd + "unit/";
	static public final sysDir = cwd + "sys/";
	static public final optDir = cwd + "optimization/";
	static public final miscDir = cwd + "misc/";
	static public final displayDir = cwd + "display/";
	static public final serverDir = cwd + "server/";
	static public final sourcemapsDir = cwd + "sourcemaps/";
	static public final nullSafetyDir = cwd + "nullsafety/";
	static public final threadsDir = cwd + "threads/";
	static public final asysDir = cwd + "asys/";

	static public final ci:Null<Ci> =
		if (Sys.getEnv("TRAVIS") == "true")
			TravisCI;
		else if (Sys.getEnv("APPVEYOR") == "True")
			AppVeyor;
		else if (Sys.getEnv("TF_BUILD") == "True")
			AzurePipelines;
		else
			null;

	static public function isCi():Bool {
		return ci != null;
	}

	static public final colorSupported = switch [ci, systemName] {
		case [AzurePipelines, _]: true; // not sure
		case [TravisCI | AppVeyor, _]: true;
		case [_, "Linux" | "Mac"]: true;
		case [_, "Windows"]: false;
		case _: false;
	}
}