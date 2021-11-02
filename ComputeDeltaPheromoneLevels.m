function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

numberOfPaths = size(pathCollection, 1);
lengthOfPaths = size(pathCollection, 2);
deltaPheromoneLevel = zeros(lengthOfPaths, lengthOfPaths);

for iAnt = 1:numberOfPaths
    deltaPheromoneLevelTemp = zeros(lengthOfPaths, lengthOfPaths);
    for iStep = 2:lengthOfPaths
        currentPheromone = pathCollection(iAnt, iStep - 1);
        destinationPheromone = pathCollection(iAnt, iStep);
        deltaPheromoneLevelTemp(destinationPheromone, currentPheromone) = 1 / pathLengthCollection(iAnt);
    end
    deltaPheromoneLevel = deltaPheromoneLevel + deltaPheromoneLevelTemp;
end

