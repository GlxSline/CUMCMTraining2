population_size = 5000;
max_generations = 30;
crossover_fraction = 0.6;
elite_count = round(0.01 * population_size);

options = optimoptions('ga',...
    'PopulationSize', population_size, ...                  % 种群规模
    'MaxGenerations', max_generations, ...                  % 迭代次数
    'CrossoverFraction', crossover_fraction, ...            % 交叉比例
    'EliteCount', elite_count, ...                          % 精英保留
    'MutationFcn', @mutationadaptfeasible, ...              % 变异方式
    'CrossoverFcn', @crossoverarithmetic, ...               % 交叉方式
    'SelectionFcn', {@selectiontournament, 2}, ...          % 选择方式
    'PlotFcn', {@gaplotbestf, ...                           % 实时监控
     @gaplotbestindiv, ...
     @gaplotscorediversity, ...
     @gaplotrange, ...
     }, ...
    'MigrationInterval', 10, ...                            % 种群迁徙间隔
    'UseParallel', true, ...                                % 并行计算
    'UseVectorized', false, ...                             % 向量化计算
    'FunctionTolerance', 1e-6 );                            % 函数值收敛阈值

% 初始化并行池
if isempty(gcp('nocreate'))
   parpool('local', 6)
end