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

	if @lists.include? secondary_choice
		list_tasks(secondary_choice)
	elsif secondary_choice == 'm'
		main_menu
	elsif secondary_choice == 'x'
		puts "Goodbye!"
	else
		puts "Sorry, that wasn't a valid option."
		list_menu
	end
end

def add_task
	puts "Enter a description of the new task."
	user_description = gets.chomp
	@list << Task.new(user_description)
	puts "Task added."
	puts "\n\n"
	main_menu
end

def list_tasks(list)
	puts "Here are all of your #{list} tasks:"
	list.tasks.each do |task|
		puts task.description
	end
	puts "\n\n"
	main_menu
end

main_menu