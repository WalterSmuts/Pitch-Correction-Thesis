function outContour = getWantedFreqContour(inContour)
	valid = getValidFrequencies();

	% Get Closest Frequencies
	for i = 1:length(inContour)
		[dummy index(i)]= min(abs(log(inContour(i)).-log((valid))));
	endfor
	outContour = valid(index);

	% Correct according to Schmitt Trigger concept
	prevState = outContour(1);
	threshold = 5;
	for i = 1:length(outContour)
		d = abs(prevState - inContour(i));
		if (d < threshold)
			outContour(i) = prevState;
		else
			prevState = outContour(i);
		endif
	endfor
endfunction
