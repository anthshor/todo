# todo

Command line script to manage todos

Backlog <-> ready <-> in progress <-> complete

```
./todos.rb add <todo item>
./todos.rb <move command> <list>

<move command>
list | ready | progress | complete | -ready | -progress | -complete

<list>
B | R | P | C

B = backlog
R = ready
P = in progress
C = complete
```

Example run
```
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
```
