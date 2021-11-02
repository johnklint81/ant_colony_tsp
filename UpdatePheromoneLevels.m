function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)

pheromoneLevel = (1 - rho) * pheromoneLevel + deltaPheromoneLevel;
pheromoneLevelIndex = any(pheromoneLevel < 1e-15);
pheromoneLevel(pheromoneLevelIndex) = 1e-15;
end