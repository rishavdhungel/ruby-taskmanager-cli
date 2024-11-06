class Task
    attr_accessor :title, :description, :status

    def initialize(title, description="")
        @title = title
        @description = description
        @status = "pending" # by default status
    end

    def mark_complete
        @status = "completed"
    end

    def display
        "#{@title} | #{@description} | #{status}"
    end
    
end
#end of class Task

#start of class TaskManager

class Task_Manager
    attr_accessor :task

    def initialize
        @task = []
    end

    def add_task(title, description="")
        task = Task.new(title,description)
        @task << task
    end

    def view_task
        @task.each_with_index do |task, index|
            puts "#{index+1}. | #{task.display}"
        end
    end

    def mark_task_complete(index)
        @task[index].mark_complete if @task[index]
    end

    def delete_task(index)
        @task.delete_at(index) if @task[index]
    end
end

#end of class Task_Manager

def run_program
    manager = Task_Manager.new

    loop do
        puts "=============================="
        puts "Welcome to the Task Manager"
        puts "1. Add a Task"
        puts "2. View Task"
        puts "3. Mark Task as Completed"
        puts "4. Delete Task"
        puts "5. Exit"
        puts "=============================="
        puts "Task Will be listed below:"
        manager.view_task
        puts "=============================="
        print "Choose an option: "
        
        choice = gets.chomp.to_i

        case choice
        when 1
            print"Enter task title: "
            title = gets.chomp
            print "Enter task description: "
            description = gets.chomp
            manager.add_task(title, description)
        
        when 2
            manager.view_task
        when 3
            print "Enter task number to mark as completed."
            index = gets.chomp.to_i
            manager.mark_task_complete(index -1 )
        when 4
            print "Enter task number to delete: "
            index = gets.chomp.to_i
            manager.delete_task(index -1 )
        when 5
            break
        else
            puts "Invalid Choice: Try again."
        end
    end
end

run_program