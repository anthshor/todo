#!/usr/bin/ruby

=begin

  @requirements		: Todo list program that 
			:   - adds todos 
			:   - moves todo items between 'backlog', 'ready', 'in progress', 'complete' 
			:   - save todo list to a file
			:   - can trash a todo from backlog 
  @guaranteed outcome   : command line program to meet requirements

=end

=begin
  @pre 
  @post todo file initialized
  @invariants list headers [B,R,P,C,T]
=end

a = []
i = 0

if ! File.exists?('todos.txt') then
    f = File.open("todos.txt", "w")
    f.write('T|')
    f.write("\n")
    f.write('B|')
    f.write("\n")
    f.write('R|')
    f.write("\n")
    f.write('P|')
    f.write("\n")
    f.write('C|')
    f.write("\n")
  f.close()
end

File.open("todos.txt", "r").each_line do |line|
  line = line.chomp
  data = line.split('|')
  a[i] = data
  i = i + 1
end

def listTodo (a,whatlist)
=begin
  @pre 		: todo array, list identifier
  @post 	: print selected list
  @invariants 	: list idenitifier in (B,R,P,C,T) otherwise print undefined
=end

 if whatlist == "B" then
      puts "Backlog"
      puts "-------"
    elsif whatlist == "R" then
      puts "Ready"
      puts "-----"
    elsif whatlist == "P" then
      puts "In Progress"
      puts "-----------"
    elsif whatlist == "C" then
      puts "Complete"
      puts "--------"
    elsif whatlist == "T" then
      puts "Trash"
      puts "-----"
    else
      puts "Undefined list"
      puts "--------------"
      return
  end
  for i in 0..a.length - 1 do
    if a[i][0] == whatlist then y = i end
  end
  for x in 1..a[y].length - 1 do
    puts "#{x}) #{a[y][x]}"
  end
end

def saveit (a)
=begin
  @pre 		: todo array
  @post 	: backup existing file before truncate? todos saved to file, seperator '|', a[0..3][0]=B,R,P,C 
=end

 i = 0
  f = File.open("todos.txt", "w")
  for i in 0..a.length - 1 do
    for x in 0..a[i].length - 1 do
      element = a[i][x].chomp + "|"
      f.write(element)
    end
    f.write("\n")
    i = i + 1
  end
  f.close()
end

def addTodo (a, item)
=begin
  @pre		: current todo array, new item to add
  @post		: new todo added to array saved to file
=end

 for i in 0..a.length - 1 do
    if a[i][0] == "B" then y = i end
  end
  a[y].push(item)
  # update file => save, only on exit?
  saveit(a)
end

def moveTodo (a, whichList, whichTodo, direction)
=begin
  @pre		: current todo array, list identifier, index of todo item, direction
  @post		: move todo forward or back list B <-> R <-> P <-> C and save to file
  @invariants	: list identifier in (B,R,P,C, -1 - back, +1 - forward))
=end

  if direction == 1 || direction == -1 then
    for i in 0..a.length - 1 do
      if a[i][0] == whichList then y = i end
    end
    unless a[y][whichTodo].nil? then
      a[y+direction].push(a[y][whichTodo])
      a[y].delete_at(whichTodo)
      saveit(a)
    end
  end
end  

param = ARGV.shift

case param
  when 'list'
    opt = ARGV.shift
    listTodo(a,opt)
  when 'add'
    item = ARGV.shift
    unless item.nil? 
      addTodo(a, item)
    end
  when 'ready'
    opt = ARGV.shift.to_i
    moveTodo(a,"B", opt, 1)
  when 'progress'
    opt = ARGV.shift.to_i
    moveTodo(a,"R", opt, 1)
  when 'complete'
    opt = ARGV.shift.to_i
    moveTodo(a,"P", opt, 1)
  when '-ready'
    opt = ARGV.shift.to_i
    moveTodo(a,"R", opt, -1)
  when '-progress'
    opt = ARGV.shift.to_i
    moveTodo(a,"P", opt, -1)
  when '-complete'
    opt = ARGV.shift.to_i
    moveTodo(a,"C", opt, -1)
  when 'trash'
    opt = ARGV.shift.to_i
    moveTodo(a,"B", opt, -1)
end
