function valid = getValidFrequencies()
	multiplier = nthroot(2,12);
	base  = 440;
	i = -12*3:12*3;
	valid = 440*multiplier.^i;
endfunction
