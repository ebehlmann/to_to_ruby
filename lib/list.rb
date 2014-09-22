require './lib/task'

class List
	@@all_lists = []

	def List.all
		@@all_lists
	end

	def List.clear
		@@all_lists = []
	end

	def initialize(description)
		@description = description
		@tasks = []
	end

	def tasks
		@tasks
	end

	def description
		@description
	end
	
	def add_task(task)
		@tasks << Task.new(task)
	end

	def save
		@@all_lists << self
	end
end