require './lib/task'

class List
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

	def List.all
		[]
	end
end