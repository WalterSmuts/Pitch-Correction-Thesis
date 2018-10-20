function scaledSample = getScaledSampleOLA(original,segmentSize,hopSize,sf,shiftRatioContour)
	% Get Sampling Points
	[windowStartPoints samplePointsX]  = getSamplePointsOLA(shiftRatioContour,hopSize,segmentSize);

	% Window at sampled points
	sampledSegments = getSegmentedSample(original,windowStartPoints,segmentSize);

	% Get the time stretched signal x
	stretchedX = overlapAndAdd(sampledSegments);

	% Interpolate to pitch shifted sample by arbitrary function
	scaledSample = interp1(stretchedX, [samplePointsX], 'spline');

	% Remove any NAN values that creeps in
	scaledSample(isnan(scaledSample)) = 0;
endfunction

