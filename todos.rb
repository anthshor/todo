#!/usr/bin/ruby
a = []
i = 0

if ! File.exists?('todos.txt') then
    f = File.open("todos.txt", "w")
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

# list

def listTodo (a,whatlist)
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
  i = 0
  # Backup file before truncate?
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

# add todo
def addTodo (a, item)
  for i in 0..a.length - 1 do
    if a[i][0] == "B" then y = i end
  end
  a[y].push(item)
  # update file => save, only on exit?
  saveit(a)
end

def progressTodo(a,whichList, whichTodo)
  for i in 0..a.length - 1 do
    if a[i][0] == whichList then y = i end
  end
  a[y+1].push(a[y][whichTodo])
  a[y].delete_at(whichTodo)
  saveit(a)
end  

def putBackTodo(a,whichList, whichTodo)
  for i in 0..a.length - 1 do
    if a[i][0] == whichList then y = i end
  end
  a[y-1].push(a[y][whichTodo])
  a[y].delete_at(whichTodo)
  saveit(a)
end  
#addTodo(a,"Eat cake")
#moveTodo
#listTodo(a,"B")

param = ARGV.shift

case param
  when 'list'
    opt = ARGV.shift
    listTodo(a,opt)
  when 'add'
    item = ARGV.shift
    addTodo(a, item)
  when 'ready'
    opt = ARGV.shift.to_i
    progressTodo(a,"B", opt)
  when 'progress'
    opt = ARGV.shift.to_i
    progressTodo(a,"R", opt)
  when 'complete'
    opt = ARGV.shift.to_i
    progressTodo(a,"P", opt)
  when '-ready'
    opt = ARGV.shift.to_i
    putBackTodo(a,"R", opt)
  when '-progress'
    opt = ARGV.shift.to_i
    putBackTodo(a,"P", opt)
  when '-complete'
    opt = ARGV.shift.to_i
    putBackTodo(a,"C", opt)
end
