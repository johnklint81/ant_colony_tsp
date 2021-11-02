function visibility = GetVisibility(cityLocation)

numberOfCities = length(cityLocation);
visibility = zeros(numberOfCities);

for iCityDestination = 1:numberOfCities
    for iCityOrigin = 1:numberOfCities
        if iCityDestination ~= iCityOrigin
            from = cityLocation(iCityOrigin, :);
            to = cityLocation(iCityDestination, :);
            distance = norm(from - to);
            visibility(iCityDestination, iCityOrigin) = 1 / distance; 
        end       
    end
end
