p = ProxySpace.push(s)
s.scope
//TODO: Record this with freqscope
(
~mastermod = {Slew.ar(HenonN.ar(XLine.kr(1,120,60).round(1),LFNoise2.kr(0.1,0.2,1.2),LFNoise2.kr(1,0.15,0.15)),XLine.kr(1,1000,400).round(1),XLine.kr(1,10000,400).round(1))};
~sin = {SinOscFB.ar([(~mastermod*440).round(80)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,1))};
~sin2 = {SinOscFB.ar([(~mastermod*440).round(40)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,2))};
~sin3 = {SinOscFB.ar([(~mastermod*440).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.3,4))};
~sin4 = {SinOscFB.ar([(~mastermod*880).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.1,8))};
~sin5 = {SinOscFB.ar([(~mastermod*1760).round(320)]!2*[1.01,1.04],0,XLine.kr(0.000001,0.05,20))};
~sin1.play;~sin2.play;~sin3.play;~sin4.play;~sin5.play;
)

s.scope

Stethoscope.new(s,2,0,256)