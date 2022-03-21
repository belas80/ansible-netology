# 09.01 Жизненный цикл ПО  

Жизненный цикл задач типа bug [bug.xml](jira_workflow/bug.xml):  
  
1. Open -> On reproduce
2. On reproduce -> Open, Done reproduce
3. Done reproduce -> On fix
4. On fix -> On reproduce, Done fix
5. Done fix -> On test
6. On test -> On fix, Done
7. Done -> Closed, Open
  
Жизненный цикл остальных задач [my_other_workflow.xml](jira_workflow/my_other_workflow.xml):  
  
1. Open -> On develop
2. On develop -> Open, Done develop
3. Done develop -> On test
4. On test -> On develop, Done
5. Done -> Closed, Open