function nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta)

tabuList = nonzeros(tabuList);
pheromoneLevelAllowed = pheromoneLevel;
visibilityAllowed = visibility;

for iTabus = tabuList
    pheromoneLevelAllowed(iTabus, :) = 0;
    visibilityAllowed(iTabus, :) = 0;
end

currentStepPheromoneLevelFactor = pheromoneLevelAllowed(:, tabuList(end)).^alpha;
currentStepVisibilityFactor = visibilityAllowed(:, tabuList(end)).^beta;
normalizationFactor = sum(currentStepPheromoneLevelFactor .* currentStepVisibilityFactor);
rouletteWheelVector = currentStepPheromoneLevelFactor .* currentStepVisibilityFactor / normalizationFactor;
[rouletteWheelSortedVector, rouletteWheelSortedIndex] = sort(rouletteWheelVector, 'descend');

spinTheWheel = rand();
rouletteWheelLength = length(rouletteWheelSortedVector);
cumulativeRouletteWheelSortedVector = cumsum(rouletteWheelSortedVector);

for i = 1:rouletteWheelLength
    if spinTheWheel <= cumulativeRouletteWheelSortedVector(i)
        cumulativeRouletteWheelSortedVector(i);
        nextNode = rouletteWheelSortedIndex(i);
        return
    end
end
end
