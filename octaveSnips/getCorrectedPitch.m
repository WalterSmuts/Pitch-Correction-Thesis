function correctedPitch = getCorrectedPitch(original,segmentSize,hopSize,sf)
	% Get frequency scaling contour
	originalFreqContour = getFrequencyContour(original, segmentSize, hopSize, sf);
	closestFreqContour = getClosestFreqContour(originalFreqContour);
	scalingFreqContour = closestFreqContour ./ originalFreqContour;

	% Do pitch shifting
	correctedPitch = getScaledSample(original,segmentSize,hopSize,sf,scalingFreqContour);
endfunction

