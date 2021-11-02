function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

startingIndex = randi(50);
numberOfCities = size(visibility, 1);
tabuList = zeros(numberOfCities, 1);
tabuList(1) = startingIndex;

for i = 2:numberOfCities
    tabuList(i) = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta);
end
path = tabuList;
end