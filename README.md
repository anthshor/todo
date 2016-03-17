# todo

Anthonys-Mac-mini:todo $ ./todos.rb list B
Backlog
-------
1) Goto Bank
2) Watch TV
3) Learn Ruby
Anthonys-Mac-mini:todo $ ./todos.rb list R
Ready
-----
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
Anthonys-Mac-mini:todo $ ./todos.rb list C
Complete
--------
Anthonys-Mac-mini:todo $ ./todos.rb add "Go Swimming"
Anthonys-Mac-mini:todo $ ./todos.rb list B
Backlog
-------
1) Goto Bank
2) Watch TV
3) Learn Ruby
4) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb ready 4
Anthonys-Mac-mini:todo $ ./todos.rb list B
Backlog
-------
1) Goto Bank
2) Watch TV
3) Learn Ruby
Anthonys-Mac-mini:todo $ ./todos.rb list R
Ready
-----
1) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb progress 1
Anthonys-Mac-mini:todo $ ./todos.rb list R
Ready
-----
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
1) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb -progress 1
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
Anthonys-Mac-mini:todo $ ./todos.rb list R
Ready
-----
1) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb progress 1
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
1) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb complete 1
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
Anthonys-Mac-mini:todo $ ./todos.rb list C
Complete
--------
1) Go Swimming
Anthonys-Mac-mini:todo $ ./todos.rb list B
Backlog
-------
1) Goto Bank
2) Watch TV
3) Learn Ruby
Anthonys-Mac-mini:todo $ ./todos.rb list R
Ready
-----
Anthonys-Mac-mini:todo $ ./todos.rb list P
In Progress
-----------
Anthonys-Mac-mini:todo $ ./todos.rb list C
Complete
--------
1) Go Swimming

