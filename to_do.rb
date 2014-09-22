require './lib/task'
require './lib/list'

@lists = []

def main_menu
	puts "Press 'n' to add a new list or 'l' to see your existing lists."
	puts "Press 'x' to exit."
	main_choice = gets.chomp

	if main_choice == 'n'
		add_list
	elsif main_choice == 'l'
		list_lists
	elsif main_choice == 'x'
		puts "Goodbye!"
	else
		puts "Sorry, that wasn't a valid option."
		main_menu
	end
end

def add_list
	puts "Enter a name for your new list."
	list_description = gets.chomp
	@lists << List.new(list_description)
	puts "List created."
	puts "\n\n"
	main_menu
end

def list_lists
	puts "Here are all of your task lists:"
	@lists.each do |list|
		puts list.description
	end
	puts "\n\n"
	list_menu
end

def list_menu
	puts "Type the name of a list to add to it or see its tasks. Press 'm' to go back to the main menu."
	puts "Press 'x' to exit."
	secondary_choice = gets.chomp

	if secondary_choice == 'm'
		main_menu
	elsif secondary_choice == 'x'
		puts "Goodbye!"
	else
		@lists.each do |list|
			if secondary_choice == list.description
				list_tasks(list)
			end
		end
	end
end

def list_tasks(list)
	puts "Here are all of your #{list.description} tasks:"
	list.tasks.each do |task|
		puts task.description
	end
	puts "\n\n"
	puts task_level_menu(list)
end

def task_level_menu(list)
	puts "Press 'a' to add a task to the #{list.description} list. Press 'l' to list all the tasks in the #{list.description} list. Press 'b' to go back."
	puts "Press 'x' to exit."
	task_level_choice = gets.chomp

	if task_level_choice == 'a'
		add_task(list)
	elsif task_level_choice == 'l'
		list_tasks(list)
	elsif task_level_choice == 'b'
		list_menu
	elsif task_level_choice == 'x'
		puts "Goodbye!"
	else
		puts "Sorry, that wasn't a valid input"
		task_level_menu(list)
	end
end

def add_task(list)
	puts "Enter a description of the new task."
	user_description = gets.chomp
	list.tasks << Task.new(user_description)
	puts "Task added."
	puts "\n\n"
	task_level_menu(list)
end

main_menu