function [samplePointsSTFT samplePointsX] = getSamplePoints(scalingRatio,hop,windowSize)
	% Initialize variables
	samplePointsX = 0;
	pointerOut = 1;
	samplePointsSTFT(pointerOut) = 0;

	% Loop over each scaling ratio point
	for (i = 1:length(scalingRatio)-2)

		% Fill sample points in STFT space until next scaling ratio is reached
		while (samplePointsSTFT(pointerOut) < i-1)
			samplePointsSTFT(pointerOut+1) = samplePointsSTFT(pointerOut) + 1/scalingRatio(i);

			% Add sample points in time domain every 4th STFT point !!!75% overlap assumed!!!
			if (rem(pointerOut,4)==0)
				samplePointsX = [samplePointsX (samplePointsX(end) : scalingRatio(i) : (samplePointsX(end)+windowSize))];
			endif
			pointerOut = pointerOut + 1;
		endwhile
	endfor
endfunction
