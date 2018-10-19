function voiced = isVoiced(signal)
	voiced = max(signal) > 0.02;
endfunction
