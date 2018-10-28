function wpIndex = pathSearch(pathX,pathY,vehX,vehY)

distance_vector = zeros(1,length(pathX));

%{
Simple Search method for quick testing of geodesy planning
%}
for i = 1:length(pathX)
    distance_vector(i) = sqrt((vehX-pathX(i))^2+(vehY-pathY(i))^2);
end
    
temp_min = distance_vector(1);
wpIndex = 1;
for i = 2:length(pathX)
    if(distance_vector(i) < temp_min)
        temp_min = distance_vector(i);
        wpIndex = i;
    end
end

%{
if(length(rawIndex) ~= 1)
    wpIndex = rawIndex(1);
else
    wpIndex = rawIndex;
end
%}

end

