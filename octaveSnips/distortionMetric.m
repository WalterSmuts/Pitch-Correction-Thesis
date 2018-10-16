function result = distortionMetric(original,windowSize,hopSize,sf)
	% Do double pitch correction
	first = getCorrectedPitch(original,windowSize,hopSize,sf);
	second = getCorrectedPitch(first,windowSize,hopSize,sf);

	% Get percentage of correlation after second application
	firstCorr = max(xcorr(first));
	bothCorr  = max(xcorr(first,second));
	result = bothCorr/firstCorr*100;
endfunction
