require './lib/task'

class List
	def initialize(description)
		@description = description
		@tasks = []
	end

	def tasks
		@tasks
	end
	
	def add_task(task)
		@tasks << Task.new(task)
	end
	
	def description
		@description
	end
end