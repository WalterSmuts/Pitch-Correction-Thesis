function outContour = getClosestFreqContour(inContour)
	valid = getValidFrequencies();
	for i = 1:length(inContour)
		[dummy index(i)] = min(abs(log(inContour(i)).-log(valid)));
	endfor
	outContour = valid(index);
endfunction
