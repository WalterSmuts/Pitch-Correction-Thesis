function segmentedSample = getSegmentedSample(original,windowStartPoints,segmentSize)
	segmentedSample = [];
	windowStartPoints(1) = 1;
	for (i = 1:length(windowStartPoints))
		start = windowStartPoints(i);
		stop  = windowStartPoints(i) + segmentSize-1);
		next  = original(start:stop).*hann(segmentSize);
		segmentedSample = [segmentedSample next];
	endfor
endfunction
