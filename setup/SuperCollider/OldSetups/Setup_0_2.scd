/*

Setup file as of 24th Feb 2016

Increases memory allocation
Adds more buffers
Boots server and proxyspace
Automatically loads all samples in repo inside a dictionary, following the format d["foldername"][x]

*/

(
Task({
	1.do{
		Server.local.options.memSize * 128;
		s.options.numBuffers=4000;
		s.boot;
		p=ProxySpace.push(s);
		p.makeTempoClock;
		p.clock.tempo = 1;
		3.wait;
		d = Dictionary.new;
		d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries);
		for (0, d[\foldernames].size-1,
			{arg i; d.add(d[\foldernames][i].folderName -> d[\foldernames][i].entries.collect({
				arg sf;
				Buffer.read(s,sf.fullPath);
			});
		)});
		("SynthDefs_0_2.scd").loadRelative;
}}).start;
)