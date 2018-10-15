function outContour = getClosestFreqContour(inContour)
	valid = getValidFrequencies();
	for i = 1:length(inContour)
		[dummy index(i)]= min(abs(inContour(i).-valid));
	endfor
	outContour = valid(index);
endfunction
