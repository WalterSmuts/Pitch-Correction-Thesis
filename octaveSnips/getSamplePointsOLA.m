function [samplePointsOLA samplePointsX] = getSamplePoints(shiftRatio,hop,windowSize)
	% Initialize variables
	samplePointsX = 0;
	pointerOut = 1;
	samplePointsOLA(pointerOut) = 0;

	% Loop over each shift ratio point
	for (i = 1:length(shiftRatio)-2)

		% Fill sample points in STFT space until next shift ratio is reached
		while (samplePointsOLA(pointerOut) < i-1)
			samplePointsOLA(pointerOut+1) = samplePointsOLA(pointerOut) + 0.5/shiftRatio(i);

			% Add sample points in time domain every 2nd STFT point !!!50% overlap assumed!!!
			if (rem(pointerOut,2)==0)
				samplePointsX = [samplePointsX (samplePointsX(end) : shiftRatio(i) : (samplePointsX(end)+windowSize))];
			endif
			pointerOut = pointerOut + 1;
		endwhile
	endfor

	% Scale to whole song length
	samplePointsOLA = round(samplePointsOLA*windowSize);
endfunction
