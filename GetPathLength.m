function pathLength = GetPathLength(path,cityLocation);

numberOfCities = length(path);
pathLength = 0;
for index = 1:numberOfCities - 1
    currentCity = cityLocation(path(index + 1), :);
    destinationCity = cityLocation(path(index), :);
    pathLength = pathLength + norm(currentCity - destinationCity);
end

pathLength = pathLength + norm(cityLocation(path(1), :) - cityLocation(path(end), :));
end
