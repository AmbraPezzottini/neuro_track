function out = BPF(in, fSample, fLowCutoff, fHighCutoff)
    % out = BP_filter(in, fSample, fLowCutoff, fHighCutoff)
    % Implements a band-pass filter (0.1 Hz to 300 Hz) on vector 'in'.
    % fSample = sample rate of data (in Hz or Samples/sec)
    % fLowCutoff = low-pass filter cutoff frequency (in Hz) - 0.1 Hz
    % fHighCutoff = high-pass filter cutoff frequency (in Hz) - 300 Hz
    
    % --- Low-pass filter (300 Hz cutoff) ---
    A_high = exp(-(2*pi*fHighCutoff)/fSample);
    B_high = 1 - A_high;

    outLow = zeros(size(in));
    outLow(1) = in(1);  % Initial condition
    
    for i = 2:length(in)
        outLow(i) = (B_high * in(i-1) + A_high * outLow(i-1));
    end
    
    % --- High-pass filter (0.1 Hz cutoff) ---
    A_low = exp(-(2*pi*fLowCutoff)/fSample);
    B_low = 1 - A_low;

    outHigh = zeros(size(in));
    outHigh(1) = in(1);  % Initial condition
    
    for i = 2:length(in)
        outHigh(i) = (B_low * in(i-1) + A_low * outHigh(i-1));
    end

    % --- Combine the filters to create band-pass filter ---
    out = in - outHigh;  % High-pass filtering
    out = outLow - out;  % Low-pass filtering
    
end


% function out = HPF(in, fSample, fCutoff)
% 
% % out = HPF(in, fSample, fCutoff)
% %
% % Implements a one-pole high-pass filter on vector 'in'.
% % fSample = sample rate of data (in Hz or Samples/sec)
% % fCutoff = high-pass filter cutoff frequency (in Hz)
% %
% % Example:  If neural data was sampled at 30 kSamples/sec
% % and you wish to high-pass filter at 300 Hz:
% %
% % out = HPF(in, 30000, 300);
% 
% % Calculate IIR filter parameters
% A = exp(-(2*pi*fCutoff)/fSample);
% B = 1 - A;
% 
% % This algorithm implements a first-order LOW-pass filter, and then
% % subtracts the output of this low-pass filter from the input to create
% % a first-order high-pass filter.
% 
% outLPF = zeros(size(in));
% outLPF(1) = in(1);  % if filtering a continuous data stream, change this
%                     % to use the previous final value of outLPF
% 
% % Run filter
% for i = 2:length(in)
%     outLPF(i) = (B*in(i-1) + A*outLPF(i-1));
% end
% 
% out = in - outLPF;
