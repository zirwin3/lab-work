function [lat] = getTTLTimes(events)

lat = cell(1,8);

Sevents = events(strcmp({events.code}, 'Stimulus'));
Sval = dec2bin(str2double(regexp([Sevents.type], '\d+', 'match')), 4) == '1';
Slat = [Sevents.latency]';

for i = 1:4
    onsetidx = find(diff([0;Sval(:,i)]) > 0);
    offsetidx = find(diff([Sval(:,i);0]) < 0)+1;
    offsetidx(offsetidx > size(Slat,1)) = [];
    
    t = zeros(length(onsetidx) + length(offsetidx), 1);
    t(1:2:end) = Slat(onsetidx);
    t(2:2:end) = Slat(offsetidx);
    
    lat{4-i+1} = t;
end

Revents = events(strcmp({events.code}, 'Response'));
if (~isempty(Revents))
    Rval = dec2bin(str2double(regexp([Revents.type], '\d+', 'match')), 4) == '1';
    Rlat = [Revents.latency]';
    
    for i = 1:4
        onsetidx = find(diff([0;Rval(:,i)]) > 0);
        offsetidx = find(diff([Rval(:,i);0]) < 0)+1;
        offsetidx(offsetidx > size(Rlat,1)) = [];
        
        t = zeros(length(onsetidx) + length(offsetidx), 1);
        t(1:2:end) = Rlat(onsetidx);
        t(2:2:end) = Rlat(offsetidx);
        
        lat{8-i+1} = t;
    end
end