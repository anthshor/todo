# Todo list

class Todo
    attr_accessor :description :status :priority

    def initialize(input_text)
        @description =
        @status = 
        @priority = 
    end
end

class Todolist < Struct.new(:todoitems)

    def initialize
    	self.todoitems = []
    end

    def inspect
    	"#<todo #{todoitems}>"
    end

	def add()
  	end

	def print()
		puts "#{@todoitems}"
	end

end

# Correct way to pass an array?
todo1 = Todolist.new(["Goto Bank", "19/01/2015","NEXT_ACTION"])
#todo1.add("Goto Office", "20/01/2015","NEXT_ACTION")

#todo1.print()

# Input todo item
todo -a "Go to Bank" => "Go to Bank", "B", "I"
todo =l => displays contents of file

Rules
-----
Only one item can be "in progress" 
All other tasks are "Done" or "Backlog" or "Ready"
When you add a todo item it immediately gets added to "Backlog"
Always has only one hop Backlog -> Ready -> In progress
How to select an item from Backlog or Ready?
 - sorted list => pop the top item
 - some manual override - pop -> accept? -> move to ready, else -> push back and pop next


What is the purpose of ready?


